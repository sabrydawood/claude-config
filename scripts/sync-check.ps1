# ============================================================
# sync-check.ps1 — Show diff between ~/.claude/ and repo
# ============================================================
# Usage: .\scripts\sync-check.ps1
# Run from the repo root directory.
# Reports which files differ between the two locations.
# Run BEFORE backup.ps1 or install.ps1 to see what will change.
# ============================================================

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $PSScriptRoot
$ClaudeHome = Join-Path $env:USERPROFILE ".claude"

Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "  Claude Code Config — Sync Check (Diff)" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Repo:        $RepoRoot"
Write-Host "Claude home: $ClaudeHome"
Write-Host ""

if (-not (Test-Path $ClaudeHome)) {
    Write-Host "ERROR: ~/.claude/ not found at $ClaudeHome" -ForegroundColor Red
    exit 1
}

# Files & directories to compare
$ItemsToCompare = @(
    "CLAUDE.md",
    "CommunicationProfiles.md",
    "Roles",
    "Patterns",
    "Anti-patterns",
    "Stacks",
    "skills",
    "agents",
    "commands"
)

$DiffCount = 0
$NewInLocal = 0
$NewInRepo = 0
$Modified = 0

function Get-FileHashSafe([string]$Path) {
    if (Test-Path $Path -PathType Leaf) {
        return (Get-FileHash -Path $Path -Algorithm SHA256).Hash
    }
    return $null
}

function Compare-Directory([string]$LocalDir, [string]$RepoDir, [string]$Label) {
    $localExists = Test-Path $LocalDir
    $repoExists = Test-Path $RepoDir

    if (-not $localExists -and -not $repoExists) { return }

    if ($localExists -and -not $repoExists) {
        Write-Host "  [NEW LOCAL]    $Label" -ForegroundColor Yellow
        $script:NewInLocal++
        return
    }

    if ($repoExists -and -not $localExists) {
        Write-Host "  [NEW IN REPO]  $Label" -ForegroundColor Magenta
        $script:NewInRepo++
        return
    }

    # Both exist — compare files inside
    if (Test-Path $LocalDir -PathType Container) {
        $localFiles = Get-ChildItem -Path $LocalDir -Recurse -File | Sort-Object FullName
        $repoFiles = Get-ChildItem -Path $RepoDir -Recurse -File | Sort-Object FullName

        $localRel = $localFiles | ForEach-Object { $_.FullName.Substring($LocalDir.Length) }
        $repoRel = $repoFiles | ForEach-Object { $_.FullName.Substring($RepoDir.Length) }

        # Files only in local
        $onlyLocal = Compare-Object -ReferenceObject $localRel -DifferenceObject $repoRel -PassThru | Where-Object { $_.SideIndicator -eq "<=" }
        foreach ($f in $onlyLocal) {
            Write-Host "  [NEW LOCAL]    $Label$f" -ForegroundColor Yellow
            $script:NewInLocal++
        }

        # Files only in repo
        $onlyRepo = Compare-Object -ReferenceObject $localRel -DifferenceObject $repoRel -PassThru | Where-Object { $_.SideIndicator -eq "=>" }
        foreach ($f in $onlyRepo) {
            Write-Host "  [NEW IN REPO]  $Label$f" -ForegroundColor Magenta
            $script:NewInRepo++
        }

        # Modified files (in both, different content)
        $inBoth = Compare-Object -ReferenceObject $localRel -DifferenceObject $repoRel -IncludeEqual -ExcludeDifferent
        foreach ($f in $inBoth) {
            $localFile = Join-Path $LocalDir $f.InputObject
            $repoFile = Join-Path $RepoDir $f.InputObject
            $localHash = Get-FileHashSafe -Path $localFile
            $repoHash = Get-FileHashSafe -Path $repoFile
            if ($localHash -ne $repoHash) {
                Write-Host "  [MODIFIED]     $Label$($f.InputObject)" -ForegroundColor Cyan
                $script:Modified++
            }
        }
    } else {
        # Single file
        $localHash = Get-FileHashSafe -Path $LocalDir
        $repoHash = Get-FileHashSafe -Path $RepoDir
        if ($localHash -ne $repoHash) {
            Write-Host "  [MODIFIED]     $Label" -ForegroundColor Cyan
            $script:Modified++
        }
    }
}

Write-Host "Comparing files..." -ForegroundColor Cyan
Write-Host ""

foreach ($item in $ItemsToCompare) {
    $local = Join-Path $ClaudeHome $item
    $repo = Join-Path $RepoRoot $item
    $label = $item
    if (Test-Path $local -PathType Container) { $label = "$item\" }
    Compare-Directory -LocalDir $local -RepoDir $repo -Label $label
}

Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "  Summary" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "  New in local (need backup.ps1):    $NewInLocal" -ForegroundColor Yellow
Write-Host "  New in repo (need install.ps1):    $NewInRepo" -ForegroundColor Magenta
Write-Host "  Modified (review which is newer):  $Modified" -ForegroundColor Cyan
Write-Host ""

$total = $NewInLocal + $NewInRepo + $Modified
if ($total -eq 0) {
    Write-Host "All in sync. No action needed." -ForegroundColor Green
} else {
    Write-Host "Next steps:" -ForegroundColor White
    if ($NewInLocal -gt 0 -or $Modified -gt 0) {
        Write-Host "  - If local has newer changes: .\scripts\backup.ps1"
    }
    if ($NewInRepo -gt 0) {
        Write-Host "  - If repo has newer changes:  .\scripts\install.ps1"
    }
}

Write-Host ""
