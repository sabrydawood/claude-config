#!/usr/bin/env bash
# ============================================================
# bootstrap.sh — One-line installer for claude-config
# ============================================================
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/sabrydawood/claude-config/main/bootstrap.sh | bash
#
# What it does:
#   1. Verifies git is installed
#   2. Clones (or updates) claude-config to ~/claude-config
#   3. Backs up existing ~/.claude/ and installs new config
#   4. Creates PersonalContext.md + settings.json from templates
# ============================================================

set -euo pipefail

REPO_URL="https://github.com/sabrydawood/claude-config.git"
REPO_DIR="${HOME}/claude-config"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
NC='\033[0m'

echo ""
echo -e "${CYAN}============================================================${NC}"
echo -e "${CYAN}  🤖 Claude Code Config — Bootstrap Installer${NC}"
echo -e "${CYAN}============================================================${NC}"
echo ""

# --- Check git ---
if ! command -v git &> /dev/null; then
    echo -e "${RED}ERROR: Git is not installed.${NC}"
    echo ""
    echo -e "${YELLOW}Install Git:${NC}"
    echo "  macOS:  brew install git  (or install Xcode CLT)"
    echo "  Ubuntu: sudo apt install git"
    echo "  Fedora: sudo dnf install git"
    echo "  Arch:   sudo pacman -S git"
    echo ""
    exit 1
fi

echo -e "${GREEN}✓ Git found: $(git --version | sed 's/git version //')${NC}"

# --- Clone or update repo ---
if [ -d "${REPO_DIR}" ]; then
    echo ""
    echo -e "${YELLOW}Existing repo found at: ${REPO_DIR}${NC}"
    echo -e "${CYAN}Pulling latest changes...${NC}"

    cd "${REPO_DIR}"

    # Check for local changes
    if [ -n "$(git status --porcelain)" ]; then
        echo ""
        echo -e "${YELLOW}⚠️  Local changes detected in ${REPO_DIR}${NC}"
        echo -e "${YELLOW}Files modified:${NC}"
        git status --short
        echo ""

        # Use /dev/tty for input even when piped via curl
        if [ -t 0 ] || [ -t 1 ]; then
            read -p "Continue with pull (may cause merge issues)? [y/N] " answer < /dev/tty || answer="n"
        else
            answer="n"
        fi

        if [[ ! "$answer" =~ ^[Yy]$ ]]; then
            echo -e "${RED}Aborted. Resolve local changes first.${NC}"
            exit 1
        fi
    fi

    git pull --ff-only > /dev/null 2>&1
    echo -e "${GREEN}✓ Repo updated${NC}"
    cd - > /dev/null
else
    echo ""
    echo -e "${CYAN}Cloning repo to: ${REPO_DIR}${NC}"
    git clone --depth 1 "${REPO_URL}" "${REPO_DIR}" > /dev/null 2>&1
    echo -e "${GREEN}✓ Repo cloned${NC}"
fi

# --- Run install.sh ---
INSTALL_SCRIPT="${REPO_DIR}/scripts/install.sh"

if [ ! -f "${INSTALL_SCRIPT}" ]; then
    echo ""
    echo -e "${RED}ERROR: install.sh not found at ${INSTALL_SCRIPT}${NC}"
    echo -e "${YELLOW}Repo may be corrupted. Try deleting ${REPO_DIR} and re-running.${NC}"
    exit 1
fi

chmod +x "${INSTALL_SCRIPT}"

echo ""
echo -e "${CYAN}Running installer...${NC}"
echo ""

bash "${INSTALL_SCRIPT}"

# --- Final summary ---
echo ""
echo -e "${CYAN}============================================================${NC}"
echo -e "${GREEN}  🎉 Bootstrap complete!${NC}"
echo -e "${CYAN}============================================================${NC}"
echo ""
echo -e "📁 Repo location:  ${REPO_DIR}"
echo -e "🏠 Claude config:  ${HOME}/.claude/"
echo ""
echo -e "${CYAN}🔄 To update later:${NC}"
echo -e "${GRAY}    cd ${REPO_DIR} && git pull && bash scripts/install.sh${NC}"
echo ""
echo -e "${YELLOW}📝 Don't forget to customize:${NC}"
echo -e "${GRAY}    - ~/.claude/PersonalContext.md  (your business context)${NC}"
echo -e "${GRAY}    - ~/.claude/settings.json       (your secrets/permissions)${NC}"
echo ""
