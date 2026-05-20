# 👤 Personal Context — [YOUR NAME]

> Personal context loaded once per session to help the agent tailor advice.
> **This is a template** — fill in your actual data after copying to `~/.claude/PersonalContext.md`.
> The actual file is `.gitignore`'d to keep your personal data private.

---

## 🏢 Company / Setup

| Field | Value |
|-------|-------|
| **Size** | Solo / 2-5 / 6-15 / 16+ |
| **Experience** | < 5 / 5-10 / 10-15 / 15+ years |
| **Primary language** | English / Arabic / Other |

## 🎯 Specializations

What types of projects do you work on? (Check all that apply)

- [ ] Web Apps (Full-Stack)
- [ ] AI / ML Products
- [ ] Mobile Apps
- [ ] Custom Enterprise / SaaS Products
- [ ] Other: ___________

## 🌍 Market

- Geographic focus: [Local / MENA / Global English / Other]
- Industry focus: [Specific industry or "Mix"]

---

## 🎯 Annual Goals

List 3-4 top goals for the year:

1. ___________
2. ___________
3. ___________

## 🔥 Current Challenges

What is bottlenecking your growth right now? (Be honest)

1. ___________
2. ___________
3. ___________

## 📅 Quarter Focus

What's your primary focus for the current quarter?

- ___________

---

## 📁 Active Projects

| Field | Value |
|-------|-------|
| **Count** | How many active projects? |
| **Location** | Where do they live on disk? |
| **Engagement type** | Project-based / Retainer / SaaS / Mix |
| **Average deal size** | $___ |

### 🚨 Anti-patterns to Watch (Custom)

> Tell the agent what business patterns to alert you about.
> Example: "If a deal is < $X and one-time, warn me before recommending acceptance."

- [Pattern 1: trigger + suggested alternatives]
- [Pattern 2]

---

## 💰 Revenue Model

**Income sources:**
- [ ] New client projects
- [ ] Retainer / monthly maintenance
- [ ] SaaS subscriptions
- [ ] Referrals
- [ ] Licensing
- [ ] Other: ___

**Pricing observations:**
- Average deal: $___
- Payback period: ___
- LTV/CAC ratio: ___

---

## 🛠️ Default Stack Preferences

> Used by the agent when you control the stack choice (vs client requirements).

### Backend

| Scenario | Choice |
|----------|--------|
| New project (your choice) | e.g., Bun + Hono |
| Refactoring existing | e.g., Node + Fastify |
| Client mandated | Follow client preference |

### Frontend

| Need | Choice |
|------|--------|
| SEO required | e.g., Next.js |
| Dashboard / Internal | e.g., React SPA (Vite) |

### Database

| Need | Choice |
|------|--------|
| Relational | e.g., PostgreSQL + Drizzle |
| Document | e.g., MongoDB |
| Cache | e.g., Redis |

### Hosting

| Scenario | Choice |
|----------|--------|
| Your preference | e.g., VPS + Nginx |
| Client cloud | AWS / GCP / Azure (per client) |

> ⚠️ **List anti-preferences:** What do you actively avoid?
> Example: "I do not use Docker by default — only when explicitly required."

---

## 💬 Communication Preferences

### Language + Style
- **Primary language:** Arabic / English / Other
- **Length:** Concise / Detailed
- **Decision style:** Recommendation-first / Options-first / Clarifying-question-first

### Format Preferences (use in every response)
- [ ] Comparison tables
- [ ] Numbered bullets
- [ ] Code blocks with real examples
- [ ] Clear section headers

### Role announcement style
When auto-switching roles, how to announce:
- [ ] Inline sentence ("Thinking as Growth Strategist because...")
- [ ] Visual banner at top of response
- [ ] Silent — no announcement
- [ ] Footer-only

---

## 🚫 What Annoys Me (Avoid)

### Behavioral
- Long pleasantries / "Of course! Happy to help"
- "It depends" non-answers
- Explaining basics you know
- Repeating the same info in different forms

### Critical (recurring AI mistakes)

> Document patterns where AI assistants typically fail you. These become enforced behavioral rules.

1. **[Pattern]** ← [Mitigation: enforced rule]
2. **[Pattern]** ← [Mitigation]
3. **[Pattern]** ← [Mitigation]

---

## ⚡ Strengths

What you do exceptionally well — the agent can lean on these:

- ___________
- ___________

## 🎯 Areas for Improvement

What you want to grow into — agent should weight recommendations toward these:

- Time management
- Pricing & positioning
- Productization
- ___________

---

## 🔓 How the Agent Should Use This File

### Every Session
1. Read this file once at session start
2. Check `projects/<project-hash>/memory/MEMORY.md` for prior preferences
3. Apply preferences automatically

### Strategic Tasks
1. Link recommendations to your **Annual Goals**
2. Consider your **Current Challenges** as constraints
3. Prefer suggestions that reduce identified bottlenecks

### Code Tasks
1. Use your **Default Stack Preferences** unless client mandates otherwise
2. Avoid your **Anti-preferences** (e.g., Docker if you don't use it)
3. Apply **Discovery-First** protocol (see CLAUDE.md §12.3) before writing code
