#!/usr/bin/env bash
# ============================================================
# install.sh — Sync claude-config repo → ~/.claude/
# ============================================================
# Usage: bash scripts/install.sh
# Run from the repo root directory.
# ============================================================

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CLAUDE_HOME="${HOME}/.claude"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
BACKUP_DIR="${HOME}/.claude.backup-${TIMESTAMP}"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
NC='\033[0m' # No Color

echo ""
echo -e "${CYAN}============================================================${NC}"
echo -e "${CYAN}  Claude Code Config — Install${NC}"
echo -e "${CYAN}============================================================${NC}"
echo ""
echo "Repo root:    ${REPO_ROOT}"
echo "Claude home:  ${CLAUDE_HOME}"
echo ""

# --- Pre-flight checks ---
if [ ! -d "${REPO_ROOT}" ]; then
    echo -e "${RED}ERROR: Repo root not found: ${REPO_ROOT}${NC}"
    exit 1
fi

# Items to track + sync
TRACKED_ITEMS=(
    "CLAUDE.md"
    "CommunicationProfiles.md"
    "PersonalContext.md"
    "Roles"
    "Patterns"
    "Anti-patterns"
    "Decisions"
    "Stacks"
    "skills"
    "agents"
    "commands"
    "settings.json"
    "settings.local.json"
)

ITEMS_TO_COPY=(
    "CLAUDE.md"
    "CommunicationProfiles.md"
    "Roles"
    "Patterns"
    "Anti-patterns"
    "Decisions"
    "Stacks"
    "skills"
    "agents"
    "commands"
)

# --- Backup existing .claude/ if present ---
if [ -d "${CLAUDE_HOME}" ]; then
    echo -e "${YELLOW}Existing ~/.claude/ found. Creating backup...${NC}"
    echo "Backup location: ${BACKUP_DIR}"
    mkdir -p "${BACKUP_DIR}"

    for item in "${TRACKED_ITEMS[@]}"; do
        src="${CLAUDE_HOME}/${item}"
        if [ -e "${src}" ]; then
            cp -r "${src}" "${BACKUP_DIR}/${item}"
            echo -e "  ${GRAY}Backed up: ${item}${NC}"
        fi
    done
    echo ""
else
    echo -e "${YELLOW}Creating fresh ~/.claude/ directory...${NC}"
    mkdir -p "${CLAUDE_HOME}"
fi

# --- Copy tracked items from repo → ~/.claude/ ---
echo -e "${CYAN}Copying config files to ~/.claude/...${NC}"

for item in "${ITEMS_TO_COPY[@]}"; do
    src="${REPO_ROOT}/${item}"
    dst="${CLAUDE_HOME}/${item}"

    if [ -e "${src}" ]; then
        if [ -e "${dst}" ]; then
            rm -rf "${dst}"
        fi
        cp -r "${src}" "${dst}"
        echo -e "  ${GREEN}Installed: ${item}${NC}"
    else
        echo -e "  ${GRAY}Skipped (not in repo): ${item}${NC}"
    fi
done

# --- Handle PersonalContext.md (template-based) ---
PERSONAL_CONTEXT_LOCAL="${CLAUDE_HOME}/PersonalContext.md"
PERSONAL_CONTEXT_TEMPLATE="${REPO_ROOT}/PersonalContext.template.md"

if [ ! -f "${PERSONAL_CONTEXT_LOCAL}" ] && [ -f "${PERSONAL_CONTEXT_TEMPLATE}" ]; then
    cp "${PERSONAL_CONTEXT_TEMPLATE}" "${PERSONAL_CONTEXT_LOCAL}"
    echo -e "  ${GREEN}Created PersonalContext.md from template${NC}"
    echo -e "  ${YELLOW}IMPORTANT: Edit ~/.claude/PersonalContext.md with your actual data${NC}"
fi

# --- Handle settings.json (template-based) ---
SETTINGS_LOCAL="${CLAUDE_HOME}/settings.json"
SETTINGS_TEMPLATE="${REPO_ROOT}/settings.template.json"

if [ ! -f "${SETTINGS_LOCAL}" ] && [ -f "${SETTINGS_TEMPLATE}" ]; then
    cp "${SETTINGS_TEMPLATE}" "${SETTINGS_LOCAL}"
    echo -e "  ${GREEN}Created settings.json from template${NC}"
    echo -e "  ${YELLOW}IMPORTANT: Edit ~/.claude/settings.json with your secrets/preferences (DO NOT commit)${NC}"
fi

echo ""
echo -e "${CYAN}============================================================${NC}"
echo -e "${GREEN}  Install complete!${NC}"
echo -e "${CYAN}============================================================${NC}"
echo ""
echo "Next steps:"
echo "  1. Edit ~/.claude/PersonalContext.md (your business context)"
echo "  2. Edit ~/.claude/settings.json (your permissions/hooks/secrets)"
echo "  3. Restart Claude Code to load new config"
echo ""

if [ -d "${BACKUP_DIR}" ]; then
    echo -e "${GRAY}Old config backed up to: ${BACKUP_DIR}${NC}"
    echo -e "${GRAY}Delete this manually after confirming new config works.${NC}"
    echo ""
fi
