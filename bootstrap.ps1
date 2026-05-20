# ============================================================
# bootstrap.ps1 — One-line installer for claude-config
# ============================================================
# Usage (PowerShell):
#   irm https://raw.githubusercontent.com/sabrydawood/claude-config/main/bootstrap.ps1 | iex
#
# What it does:
#   1. Verifies git is installed
#   2. Clones (or updates) claude-config to ~/claude-config
#   3. Backs up existing ~/.claude/ and installs new config
#   4. Creates PersonalContext.md + settings.json from templates
# ============================================================

$ErrorActionPreference = "Stop"

$RepoUrl = "https://github.com/sabrydawood/claude-config.git"
$RepoDir = Join-Path $env:USERPROFILE "claude-config"

Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "  🤖 Claude Code Config — Bootstrap Installer" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""

# --- Check git ---
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "ERROR: Git is not installed." -ForegroundColor Red
    Write-Host ""
    Write-Host "Install Git from: https://git-scm.com/download/win" -ForegroundColor Yellow
    Write-Host "Or via winget:    winget install Git.Git" -ForegroundColor Yellow
    Write-Host ""
    exit 1
}

Write-Host "✓ Git found: $((git --version) -replace 'git version ','')" -ForegroundColor Green

# --- Clone or update repo ---
if (Test-Path $RepoDir) {
    Write-Host ""
    Write-Host "Existing repo found at: $RepoDir" -ForegroundColor Yellow
    Write-Host "Pulling latest changes..." -ForegroundColor Cyan

    Push-Location $RepoDir
    try {
        # Check for local changes
        $localChanges = git status --porcelain
        if ($localChanges) {
            Write-Host ""
            Write-Host "⚠️  Local changes detected in $RepoDir" -ForegroundColor Yellow
            Write-Host "Files modified:" -ForegroundColor Yellow
            git status --short
            Write-Host ""
            $answer = Read-Host "Continue with pull (may cause merge issues)? [y/N]"
            if ($answer -notmatch '^[Yy]') {
                Write-Host "Aborted. Resolve local changes first." -ForegroundColor Red
                exit 1
            }
        }
        git pull --ff-only 2>&1 | Out-Null
        Write-Host "✓ Repo updated" -ForegroundColor Green
    } finally {
        Pop-Location
    }
} else {
    Write-Host ""
    Write-Host "Cloning repo to: $RepoDir" -ForegroundColor Cyan
    git clone --depth 1 $RepoUrl $RepoDir 2>&1 | Out-Null
    Write-Host "✓ Repo cloned" -ForegroundColor Green
}

# --- Run install.ps1 ---
$InstallScript = Join-Path $RepoDir "scripts\install.ps1"

if (-not (Test-Path $InstallScript)) {
    Write-Host ""
    Write-Host "ERROR: install.ps1 not found at $InstallScript" -ForegroundColor Red
    Write-Host "Repo may be corrupted. Try deleting $RepoDir and re-running." -ForegroundColor Yellow
    exit 1
}

Write-Host ""
Write-Host "Running installer..." -ForegroundColor Cyan
Write-Host ""

& powershell -ExecutionPolicy Bypass -File $InstallScript

# --- Final summary ---
Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "  🎉 Bootstrap complete!" -ForegroundColor Green
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "📁 Repo location:  $RepoDir" -ForegroundColor White
Write-Host "🏠 Claude config:  $env:USERPROFILE\.claude\" -ForegroundColor White
Write-Host ""
Write-Host "🔄 To update later:" -ForegroundColor Cyan
Write-Host "    cd $RepoDir; git pull; .\scripts\install.ps1" -ForegroundColor Gray
Write-Host ""
Write-Host "📝 Don't forget to customize:" -ForegroundColor Yellow
Write-Host "    - ~/.claude/PersonalContext.md  (your business context)" -ForegroundColor Gray
Write-Host "    - ~/.claude/settings.json       (your secrets/permissions)" -ForegroundColor Gray
Write-Host ""
