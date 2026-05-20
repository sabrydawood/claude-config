# ============================================================
# install.ps1 — Sync claude-config repo → ~/.claude/
# ============================================================
# Usage: .\scripts\install.ps1
# Run from the repo root directory.
# ============================================================

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $PSScriptRoot
$ClaudeHome = Join-Path $env:USERPROFILE ".claude"
$BackupDir = Join-Path $env:USERPROFILE ".claude.backup-$(Get-Date -Format 'yyyyMMdd-HHmmss')"

Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "  Claude Code Config — Install" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Repo root:    $RepoRoot"
Write-Host "Claude home:  $ClaudeHome"
Write-Host ""

# --- Pre-flight checks ---
if (-not (Test-Path $RepoRoot)) {
    Write-Host "ERROR: Repo root not found: $RepoRoot" -ForegroundColor Red
    exit 1
}

# --- Backup existing .claude/ if present ---
if (Test-Path $ClaudeHome) {
    Write-Host "Existing ~/.claude/ found. Creating backup..." -ForegroundColor Yellow
    Write-Host "Backup location: $BackupDir"

    # Only back up the directories/files we're about to overwrite (not runtime data)
    New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null

    $TrackedItems = @(
        "CLAUDE.md", "CommunicationProfiles.md", "PersonalContext.md",
        "Roles", "Patterns", "Anti-patterns", "Decisions", "Stacks","skills",
        "agents", "commands", "settings.json", "settings.local.json"
    )

    foreach ($item in $TrackedItems) {
        $src = Join-Path $ClaudeHome $item
        if (Test-Path $src) {
            $dst = Join-Path $BackupDir $item
            Copy-Item -Path $src -Destination $dst -Recurse -Force
            Write-Host "  Backed up: $item" -ForegroundColor Gray
        }
    }
    Write-Host ""
} else {
    Write-Host "Creating fresh ~/.claude/ directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $ClaudeHome -Force | Out-Null
}

# --- Copy tracked items from repo → ~/.claude/ ---
Write-Host "Copying config files to ~/.claude/..." -ForegroundColor Cyan

$ItemsToCopy = @(
    "CLAUDE.md",
    "CommunicationProfiles.md",
    "Roles",
    "Patterns",
    "Anti-patterns",
    "Decisions",
    "skills",
    "Stacks",
    "agents",
    "commands"
)

foreach ($item in $ItemsToCopy) {
    $src = Join-Path $RepoRoot $item
    $dst = Join-Path $ClaudeHome $item

    if (Test-Path $src) {
        if (Test-Path $dst) {
            Remove-Item -Path $dst -Recurse -Force
        }
        Copy-Item -Path $src -Destination $dst -Recurse -Force
        Write-Host "  Installed: $item" -ForegroundColor Green
    } else {
        Write-Host "  Skipped (not in repo): $item" -ForegroundColor Gray
    }
}

# --- Handle PersonalContext.md (template-based) ---
$PersonalContextLocal = Join-Path $ClaudeHome "PersonalContext.md"
$PersonalContextTemplate = Join-Path $RepoRoot "PersonalContext.template.md"

if (-not (Test-Path $PersonalContextLocal) -and (Test-Path $PersonalContextTemplate)) {
    Copy-Item -Path $PersonalContextTemplate -Destination $PersonalContextLocal
    Write-Host "  Created PersonalContext.md from template" -ForegroundColor Green
    Write-Host "  IMPORTANT: Edit ~/.claude/PersonalContext.md with your actual data" -ForegroundColor Yellow
}

# --- Handle settings.json (template-based, manual customization required) ---
$SettingsLocal = Join-Path $ClaudeHome "settings.json"
$SettingsTemplate = Join-Path $RepoRoot "settings.template.json"

if (-not (Test-Path $SettingsLocal) -and (Test-Path $SettingsTemplate)) {
    Copy-Item -Path $SettingsTemplate -Destination $SettingsLocal
    Write-Host "  Created settings.json from template" -ForegroundColor Green
    Write-Host "  IMPORTANT: Edit ~/.claude/settings.json with your secrets/preferences (DO NOT commit)" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "  Install complete!" -ForegroundColor Green
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next steps:" -ForegroundColor White
Write-Host "  1. Edit ~/.claude/PersonalContext.md (your business context)"
Write-Host "  2. Edit ~/.claude/settings.json (your permissions/hooks/secrets)"
Write-Host "  3. Restart Claude Code to load new config"
Write-Host ""

if (Test-Path $BackupDir) {
    Write-Host "Old config backed up to: $BackupDir" -ForegroundColor Gray
    Write-Host "Delete this manually after confirming new config works." -ForegroundColor Gray
    Write-Host ""
}
