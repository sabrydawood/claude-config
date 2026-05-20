# 🤖 Claude Code Config — Multi-Role Agent System

> **English** | **[العربية](README.ar.md)**

A portable, opinionated configuration for [Claude Code](https://claude.com/claude-code) that turns it into a multi-role AI engineering partner — covering technical, product, growth, design, business, and DevOps perspectives.

---

## 🎯 Why I Published This (And What's In It For You)

### My Goals

1. **🌍 Share with the Arabic developer community** — Deep technical documentation in Arabic is rare. This is one attempt to close that gap.
2. **🏗️ A portfolio of my engineering thinking** — Reflects how I reason about architecture, products, growth, and business — not just code.
3. **🤝 A conversation starter** — For potential clients or collaborators, this repo answers half the questions before they're asked.
4. **🔄 Collaborative improvement** — Your patterns might improve mine. Feedback is open.

### Why This Matters to You

#### 👨‍💻 If you're an Arabic-speaking developer

- **Skip weeks of trial-and-error** — battle-tested on real projects, not a theoretical idea
- **Native Arabic documentation** — no constant mental translation from English
- **Ready-to-use reference** — `Patterns/` and `Anti-patterns/` save you from repeating known mistakes
- **Easy to customize** — replace `PersonalContext.md` with your context and recommendations adapt automatically

#### 🚀 If you're a solo developer or founder

- **Team-level thinking without hiring** — 8 roles = 8 specialized perspectives in one assistant
- **Breaks AI tunnel vision** — instead of a generic response, you get CTO + PM + Growth viewpoints on the same decision
- **Prevents the Freelancer Trap** — auto-alert system when patterns drain your time (small deals, one-time work, etc.)
- **Auto-ADR** — your architectural decisions stay documented; never forget "why I chose X" 6 months later

#### 🤔 If you're considering working with me

- **Review my methodology before we talk** — how I analyze, design, decide
- **Set expectations on documentation quality** — this is the standard I produce for projects and clients
- **Test technical/cultural fit** — before investing in a discovery call

#### 🔬 If you're curious about AI workflows

- **A working example of multi-agent thinking** — not a single mega-prompt
- **Lazy-loaded architecture** — learn how to break context bloat
- **Discovery-First protocol** — a practical fix for AI-hallucinated functions

### How to Engage

| You want to... | Do this... |
|----------------|------------|
| **Try the system** | Run the [one-liner](#-quick-start) — 30 seconds and you're set up |
| **Build your own version** | [Fork](https://github.com/sabrydawood/claude-config/fork) and replace `PersonalContext.md` |
| **Contribute a pattern or anti-pattern** | Open a [PR](https://github.com/sabrydawood/claude-config/pulls) — every one gets reviewed |
| **Ask a question or discuss** | Open an [Issue](https://github.com/sabrydawood/claude-config/issues) — interaction welcome |
| **Reach out directly** | [GitHub @sabrydawood](https://github.com/sabrydawood) |
| **Share with others** | Send the repo to a developer trying to master Claude Code |

> **Why contribute?** Every pattern you add becomes available to you and every other developer using the system. Improvements come back to you.

---

## 🎬 See It in Action

<!-- ![Auto-Detection in action](docs/screenshots/auto-detection.gif) -->

```text
                          User Question
                                ↓
   ┌────────────────────────────────────────────────────┐
   │ > هل أرفع أسعاري من $5K إلى $10K للمشاريع الجديدة؟    │
   └────────────────────────────────────────────────────┘

                  Auto-Detection Triggers (no manual command)
                                ↓
              ┌─────────────────────────────────────┐
              │ 🎭 Active: Senior PM + BD + Growth   │
              │ 📌 Reason: pricing has multiple dims │
              └─────────────────────────────────────┘

                       Structured Multi-Role Response
                                ↓
   ┌────────────────────────────────────────────────────┐
   │ ## 🎯 Product Take — Pricing Bump to $10K            │
   │                                                    │
   │ ### From PM Perspective                            │
   │ - Current $5K/project = $X/hour effective           │
   │ - Doubling triggers re-segmentation of clients     │
   │                                                    │
   │ ### From BD Perspective                            │
   │ - At $10K, deal size justifies retainer pitch      │
   │ - Loses bottom 30% of leads — selection effect     │
   │                                                    │
   │ ### From Growth Perspective                        │
   │ - LTV/CAC math: at $10K, LTV/CAC = 4.2× (healthy)  │
   │                                                    │
   │ ### Recommendation ← A/B test on next 3 leads      │
   │                                                    │
   │ ✅ Logged decision: Decisions/Global/0003-pricing.md │
   └────────────────────────────────────────────────────┘
```

---

## 🎯 What This Is

This repository is a **personal Claude Code configuration** designed for solo developers and small teams who want their AI assistant to:

- 🎭 **Auto-switch between 8 roles** (CTO, PM, Engineer, UI/UX, Growth, BA, DevOps, BD) based on context — no need to type "think like a..."
- 📐 **Auto-create Architecture Decision Records (ADRs)** for important technical decisions
- 🔍 **Use Discovery-First protocol** — check existing code before writing new functions (avoids duplicate logic)
- 🧠 **Maintain context** across sessions via lazy-loaded reference files
- 🌐 **Communicate in Arabic** (primary) with English technical terms
- ⚙️ **Work with any stack** (Bun/Node/Go/Rust/PHP/.NET) with stack-specific guidance loaded on demand

## 🏗️ Repo Structure

```tree
claude-config/
├── CLAUDE.md                      # Main agent configuration (loaded every session)
├── CommunicationProfiles.md       # 5 audience-specific writing styles
├── PersonalContext.template.md    # Template — fill with your business context (stays local)
├── settings.template.json         # Sanitized settings — copy & customize
├── Roles/                         # 8 role definitions (lazy-loaded)
│   ├── README.md                  # Auto-detection guide
│   ├── CTO.md
│   ├── Senior-PM.md
│   ├── Senior-Engineer.md
│   ├── UI-UX.md
│   ├── Growth-Strategist.md
│   ├── Business-Analyst.md
│   ├── DevOps-SRE.md
│   └── Business-Developer.md
├── Patterns/                      # Reusable how-tos library
│   └── README.md
├── Anti-patterns/                 # Common mistakes registry
│   └── README.md
├── Decisions/                     # ADR template + structure
│   └── README.md
├── Stacks/                        # Stack-specific gotchas
│   ├── Bun-Hono.md
│   ├── NextJS.md
│   ├── NodeJS.md
│   ├── React.md
│   ├── Astro.md
│   ├── Go.md
│   ├── Rust.md
│   ├── PHP.md
│   ├── DotNet.md
│   └── GraphQL.md
├── agents/                        # Custom Claude sub-agents
├── commands/                      # Custom slash commands
└── scripts/                       # Sync scripts
    ├── install.ps1                # Windows: repo → ~/.claude/
    ├── install.sh                 # Mac/Linux: repo → ~/.claude/
    ├── backup.ps1                 # Windows: ~/.claude/ → repo
    └── sync-check.ps1             # Windows: show diff
```

## 🚀 Quick Start

### Prerequisites

- [Claude Code](https://claude.com/claude-code) installed
- Git
- PowerShell 5+ (Windows) or Bash (Mac/Linux)

### ⚡ One-line install (recommended)

**Windows (PowerShell):**

```powershell
irm https://raw.githubusercontent.com/sabrydawood/claude-config/main/bootstrap.ps1 | iex
```

**Mac / Linux (Bash):**

```bash
curl -fsSL https://raw.githubusercontent.com/sabrydawood/claude-config/main/bootstrap.sh | bash
```

That's it. The bootstrap script will:

1. Clone the repo to `~/claude-config`
2. Back up your existing `~/.claude/` configuration (timestamped)
3. Install all config files
4. Create `PersonalContext.md` and `settings.json` from templates

### Manual install (alternative)

```powershell
# Windows
git clone https://github.com/sabrydawood/claude-config.git
cd claude-config
.\scripts\install.ps1
```

```bash
# Mac / Linux
git clone https://github.com/sabrydawood/claude-config.git
cd claude-config
bash scripts/install.sh
```

### After install

- Edit `~/.claude/PersonalContext.md` — fill in your business context
- Edit `~/.claude/settings.json` — add your permissions/hooks/secrets
- Restart Claude Code to load the new config

### Sync changes back to repo

After modifying your local configuration (e.g., adding a new role or pattern):

```powershell
# Show what will change
.\scripts\sync-check.ps1

# If looks good, commit
.\scripts\backup.ps1
git add .
git commit -m "Add pattern X / Update role Y"
git push
```

## 🧠 How the Multi-Role System Works

### Auto-Detection

When you ask a question, the agent automatically detects which role(s) to activate based on context:

| You ask... | Roles activated |
|-----------|-----------------|
| "Should I raise my prices?" | PM + BD + Growth |
| "How do I scale this API?" | DevOps + CTO |
| "Evaluate this partnership offer" | BD + BA |
| "Build this feature?" | PM + CTO |
| "Why are users dropping off?" | Growth + PM |

A banner appears at the top of each response showing active roles + reason.

### Default Mode

The agent runs in **CTO + Senior PM mode by default** — it plans and analyzes but does NOT write code unless explicitly asked ("implement this" / "نفّذ").

### Auto-ADR

When the agent makes a significant architectural decision (stack choice, vendor selection, etc.), it automatically creates an Architecture Decision Record in `Decisions/`.

### Discovery-First Coding

Before writing any code, the agent is required to:

1. Read the full context (file + types + interfaces)
2. Search for existing implementations (via Serena MCP)
3. Verify understanding with the user
4. Then write

This prevents the "duplicate logic" anti-pattern common with AI code generation.

## ⚙️ Configuration

### `PersonalContext.md` (Template-based)

After installation, edit `~/.claude/PersonalContext.md` with:

- Your team size & specialization
- Annual goals + current quarter focus
- Active projects & client model
- Default tech stack preferences
- Communication preferences
- What you don't want the agent to do

This file is **gitignored** — your personal data stays on your machine.

### `settings.json` (Template-based)

Customize permissions, hooks, and MCP servers. **Never commit `settings.json`** — it may contain:

- Database connection strings with passwords
- API tokens
- Custom file paths revealing project structure

### MCP Servers Recommended

This config is optimized for these MCP servers (configure separately):

- **Serena** — Code intelligence (`find_symbol`, `search_for_pattern`)
- **code-review-graph** — Per-project code graph for risk analysis

## 🎓 Languages

- **Primary:** Arabic (العربية) — for natural conversations with Sabry
- **Technical:** English — for code, frameworks, and standardized terminology

The system is designed for Arabic-speaking developers but the technical content (frameworks, patterns, code) is in English.

## 📚 Inspiration

This setup is inspired by:

- **dotfiles culture** — version control for developer environments
- **Architecture Decision Records (ADRs)** — Michael Nygard's pattern
- **Multi-agent role-based systems** — instead of one general assistant, specialized roles
- **Lazy loading** — keep main config lean, load specialized knowledge on demand

## 🤝 Contributing

This is a personal configuration but feel free to:

- Fork and adapt to your workflow
- Open issues if you find bugs
- Suggest patterns or anti-patterns you've discovered

## 📝 License

MIT — see [LICENSE](LICENSE)

## 🙋 FAQ

**Q: Why so many roles? Isn't one assistant enough?**
A: Different decisions need different mental models. A CTO thinks differently from a Growth Strategist. Forcing one role to handle all leads to generic advice. Role separation = focused, actionable output.

**Q: How is this different from system prompts?**
A: This is a layered system: a small persistent core (CLAUDE.md) + lazy-loaded specialized roles + structured knowledge bases (Patterns, Decisions, Anti-patterns). It scales with use without bloating context.

**Q: Why not use Claude's built-in /agents?**
A: Sub-agents are for spawning isolated tasks. Roles here are mental models loaded into the main conversation — different purpose.

**Q: Do I need all 8 roles?**
A: No. Start with CTO + PM (default), add others as you encounter scenarios that need them. Each role file is independent.
