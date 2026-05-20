# ============================================================
# backup.ps1 — Sync ~/.claude/ → claude-config repo
# ============================================================
# Usage: .\scripts\backup.ps1
# Run from the repo root directory.
# Copies your local Claude config back into the repo.
# Excludes runtime/cache data and personal/secret files.
# ============================================================

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $PSScriptRoot
$ClaudeHome = Join-Path $env:USERPROFILE ".claude"

Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "  Claude Code Config — Backup (Local → Repo)" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""

if (-not (Test-Path $ClaudeHome)) {
    Write-Host "ERROR: ~/.claude/ not found at $ClaudeHome" -ForegroundColor Red
    exit 1
}

# Items safe to sync to repo (config + knowledge base, no secrets)
$ItemsToBackup = @(
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

# Decisions/README.md OK, but actual ADRs may have business info — skip
# PersonalContext.md is gitignored — never copy back
# settings.json contains secrets — never copy back

Write-Host "Syncing files to repo..." -ForegroundColor Cyan

foreach ($item in $ItemsToBackup) {
    $src = Join-Path $ClaudeHome $item
    $dst = Join-Path $RepoRoot $item

    if (Test-Path $src) {
        if (Test-Path $dst) {
            Remove-Item -Path $dst -Recurse -Force
        }
        Copy-Item -Path $src -Destination $dst -Recurse -Force
        Write-Host "  Synced: $item" -ForegroundColor Green
    } else {
        Write-Host "  Skipped (missing locally): $item" -ForegroundColor Gray
    }
}

# Sync Decisions/README.md only (not actual ADRs)
$DecisionsReadmeSrc = Join-Path $ClaudeHome "Decisions\README.md"
$DecisionsDir = Join-Path $RepoRoot "Decisions"
$DecisionsReadmeDst = Join-Path $DecisionsDir "README.md"

if (Test-Path $DecisionsReadmeSrc) {
    if (-not (Test-Path $DecisionsDir)) {
        New-Item -ItemType Directory -Path $DecisionsDir -Force | Out-Null
    }
    Copy-Item -Path $DecisionsReadmeSrc -Destination $DecisionsReadmeDst -Force
    Write-Host "  Synced: Decisions/README.md (template only)" -ForegroundColor Green
}

Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "  Backup complete!" -ForegroundColor Green
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""

# --- Show git status if this is a git repo ---
Push-Location $RepoRoot
try {
    $isGit = (git rev-parse --is-inside-work-tree 2>$null)
    if ($isGit -eq "true") {
        Write-Host "Git status:" -ForegroundColor Cyan
        git status --short
        Write-Host ""
        Write-Host "Next steps:" -ForegroundColor White
        Write-Host "  1. Review changes:    git diff"
        Write-Host "  2. Stage:             git add ."
        Write-Host "  3. Commit:            git commit -m 'Update config'"
        Write-Host "  4. Push:              git push"
    } else {
        Write-Host "Not a git repo. Initialize with: git init" -ForegroundColor Yellow
    }
} finally {
    Pop-Location
}

Write-Host ""
