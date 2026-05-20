# 🤝 Contributing to claude-config

> **English** | **[العربية](CONTRIBUTING.ar.md)**

Thanks for considering a contribution. This repo grows stronger with each pattern, anti-pattern, or improvement that real developers add from their actual experience.

This guide is designed to **minimize friction**: clear templates, predictable workflow, fast reviews.

---

## 🎯 What You Can Contribute

| Type | What goes there | Best for |
|------|-----------------|----------|
| **🧩 Pattern** | A reusable "how-to" you've validated in production | "How I do X" |
| **🚫 Anti-pattern** | A gotcha that cost you time/money | "How I broke X" |
| **🛠️ Stack rules** | Framework-specific gotchas (Bun, Next.js, Go, ...) | Fresh stack experience |
| **🎭 Role improvement** | Better frameworks/templates inside a role file | Domain expertise |
| **📐 ADR (Decision)** | A reusable architectural decision template | Generic lessons learned |
| **🐛 Bug fix** | Install script issues, broken links, typos | Quick wins |
| **🌐 Translation** | Arabic ↔ English consistency | Language polish |
| **💡 New role** | A specialized role not yet covered | Bigger contribution |

---

## ⚡ Quick Start

```bash
# 1. Fork via GitHub UI, then:
git clone https://github.com/YOUR_USERNAME/claude-config.git
cd claude-config

# 2. Create a focused branch
git checkout -b pattern/add-webhook-handler

# 3. Make your change (see templates below)

# 4. Verify scripts still work (optional but appreciated)
.\scripts\sync-check.ps1   # Windows
# bash scripts/install.sh --dry-run  # Linux/Mac

# 5. Commit + push
git commit -m "Add pattern: secure webhook handler"
git push origin pattern/add-webhook-handler

# 6. Open PR on GitHub
```

**Branch naming convention:**

- `pattern/<short-name>` — new pattern
- `antipattern/<short-name>` — new anti-pattern
- `stack/<framework>` — new or updated stack file
- `role/<role-name>` — improvement to existing role
- `fix/<issue>` — bug fix
- `docs/<topic>` — README, CONTRIBUTING, comments

---

## 📋 Templates by Contribution Type

### 🧩 Pattern Submission

**File location:** `Patterns/<category>-<action>.md`

**Examples:** `Patterns/server-add-module.md`, `Patterns/client-add-form.md`

**Template:**

````markdown
# Pattern: [Short, descriptive name]

## Use Case
When to use this pattern + when NOT to use it.

## Prerequisites
- Stack required (e.g., Bun + Hono + Drizzle)
- Tools needed
- Permissions / access required

## Steps
1. Step 1 — concrete action with file paths
2. Step 2 — ...

## Code Example
```ts
// Real, copy-pasteable code
// Not pseudo-code, not "...", not TODO
```

## Verification
- [ ] Test 1: how to verify it worked
- [ ] Test 2: edge case to confirm

## Common Pitfalls
- ⚠️ Pitfall 1 + how to avoid
- ⚠️ Pitfall 2

## Related Patterns
- [Related-Pattern.md] — if you also need X
````

**Checklist before opening PR:**

- [ ] Code example actually works (test it)
- [ ] No personal/client paths in code
- [ ] No real credentials, API keys, or internal URLs
- [ ] Added to the index in `Patterns/README.md`

---

### 🚫 Anti-pattern Submission

**File location:** `Anti-patterns/<category>-<short-name>.md`

**Examples:** `Anti-patterns/drizzle-update-without-where.md`, `Anti-patterns/jwt-in-localstorage.md`

**Template:**

```markdown
# Anti-pattern: [Short name]

## What
One-sentence description of the wrong pattern.

## Why it's wrong
Why this is a mistake — what does it cause?

## When seen (Context)
- Stack/Framework: [where you saw this]
- Cost: [downtime / lost data / hours debugging]
- (No need to name clients or specific projects)

## Correct Approach
The right way + code example.

## Detection
How to catch this pattern early:
- Linter rule (if applicable)
- Code review checklist
- Test pattern

## Related
- [Other-Anti-pattern.md] — if these tend to appear together
```

**Anonymization rule:** Strip client names, real URLs, real credentials. Describe the mistake, not the incident.

---

### 🛠️ Stack File Contribution

**File location:** `Stacks/<StackName>.md`

**If adding a new stack file:** Follow the structure of an existing one (e.g., `Stacks/Bun-Hono.md`).

**Recommended sections:**

1. **Runtime/Framework basics** — what's the stack
2. **File structure conventions**
3. **Naming conventions**
4. **Common gotchas** (most important — this is where value lives)
5. **Required packages + alternatives**
6. **Setup checklist**

**Quality bar:** A senior engineer reading this should be able to start a new project on this stack without surprises.

---

### 🎭 Role File Improvement

**File location:** `Roles/<RoleName>.md`

**Acceptable improvements:**

- Better thinking framework questions
- Additional response templates
- New methodologies / frameworks references (with citation)
- Updated anti-patterns specific to the role
- Real-world examples (anonymized)

**NOT acceptable:**

- Removing existing content without justification
- Changing fundamental role boundaries (e.g., making Engineer write code without permission)
- Adding personal preferences specific to one user

**If you're proposing a major role redesign**, open an Issue first to discuss before PR.

---

### 📐 ADR Template Contribution

**File location:** `Decisions/README.md` (template improvements only)

> **Important:** Actual ADRs (e.g., `Decisions/Global/0001-bun-default.md`) are gitignored because they're personal. We only accept improvements to the ADR template/structure in `Decisions/README.md`.

If you have a great ADR example from your own work that would teach the format, share it as a code block in the README — not as a committed file.

---

### 🐛 Bug Fix

**Examples of accepted bug fixes:**

- `install.ps1` / `install.sh` errors on specific platforms
- Broken links in READMEs
- Typos in role files
- Outdated framework version references
- Scripts that fail on edge cases (long paths, spaces in names, etc.)

**How to report (if you can't fix it):**
Open an Issue with:

- OS + Shell version
- Steps to reproduce
- Expected vs actual behavior
- Error output (with secrets redacted)

---

### 🌐 Translation Contribution

**Common needs:**

- New file added in English → needs Arabic version
- Arabic content drifts from English (or vice versa)
- Better word choice for technical terms

**Translation rules:**

1. **Technical terms stay in English:** `function`, `component`, `architecture`, `deployment`, `framework`, `stack`
2. **Brand names stay original:** Bun, Hono, Next.js, React, Claude Code
3. **Code/commands NEVER translated**
4. **Tone:** Natural, conversational Arabic — not formal/literary
5. **Direction:** Both READMEs should communicate the same idea, not be word-for-word identical

---

### 💡 New Role Proposal

This is a **larger contribution**. Open an Issue first to discuss the role before submitting a PR.

**Required for a new role:**

1. **Clear domain boundary** — what does this role do that existing 8 don't?
2. **Auto-detection triggers** — what conversation context activates it?
3. **Co-active partners** — which existing roles work alongside it?
4. **Frameworks used** — standardized methodologies (not invented)
5. **Anti-patterns specific to the role**

**File structure:** Match the format of `Roles/CTO.md` or `Roles/Business-Developer.md`.

---

## ✅ Pull Request Checklist

Before opening your PR, verify:

- [ ] Branch name follows naming convention (`pattern/`, `antipattern/`, `stack/`, etc.)
- [ ] Files follow the template structure for the contribution type
- [ ] No personal data (client names, paths, credentials, emails)
- [ ] Code examples actually work (tested locally)
- [ ] Added to the relevant index file (`Patterns/README.md`, `Anti-patterns/README.md`)
- [ ] Markdown renders cleanly (no broken tables, malformed code blocks)
- [ ] If touching `install.ps1` / `install.sh` / `bootstrap.ps1` / `bootstrap.sh` — tested manually
- [ ] If adding new file in English, considered if Arabic version is needed

## 📝 PR Description Template

```markdown
## What
[1-2 sentences: what does this PR add or change?]

## Why
[What problem does it solve? Or what value does it add?]

## Files Changed
- `Patterns/server-add-module.md` (new)
- `Patterns/README.md` (updated index)

## Tested
- [ ] Followed template structure
- [ ] Code example works
- [ ] No secrets/personal data
- [ ] Markdown renders cleanly

## Related
[Links to related Issues / Patterns / Anti-patterns, if any]
```

---

## 🎨 Style Guide

### Markdown

- **Headers:** Use `##` and `###` (not `####+` — keep hierarchy shallow)
- **Tables:** Use them for comparisons, options, mappings
- **Code blocks:** Always specify language (`)```ts`, ```bash`)
- **Emoji in headers:** Yes, but consistently with existing style
- **Bold:** For emphasis only (not whole paragraphs)
- **Lists:** Numbered for sequential steps, bullets for unordered

### English

- **Voice:** Direct, technical, no marketing fluff
- **Audience:** Mid-to-senior developers — skip basics
- **Examples:** Real, runnable code — never pseudo-code or "..."

### Arabic

- **Style:** Modern Standard Arabic, conversational tone (not formal/literary)
- **Mixing:** Acceptable to keep technical terms in English (`function`, `architecture`, `framework`)
- **RTL:** Markdown handles this naturally — don't add `dir="rtl"`

---

## 🚦 Review Process

1. **Initial check** within 7 days — confirms the PR follows guidelines
2. **Substantive review** — feedback on content, structure, accuracy
3. **Merge or request changes**

**What gets fast-merged:**

- Typo fixes
- Broken link fixes
- Updates to outdated framework versions
- Anti-patterns with clear, documented cost

**What needs discussion:**

- New roles (always open Issue first)
- Changes to core CLAUDE.md behavior
- Adding new tools/dependencies to scripts
- Major refactors of existing roles

---

## 🚫 What We Don't Accept

- **Self-promotion** — links to personal services, courses, books unless directly relevant
- **Patterns that depend on closed-source/paid tools without alternatives**
- **Anti-patterns that name specific clients or projects** — anonymize first
- **AI-generated content with no human validation** — we don't accept "Claude wrote this and I didn't test it"
- **Patterns that haven't been used in real work** — theory without practice
- **Breaking changes without discussion** — open an Issue first

---

## 🙋 Questions?

- 💬 **Open an [Issue](https://github.com/sabrydawood/claude-config/issues)** for any question
- 📧 **GitHub @sabrydawood** for direct contact
- 🐛 **Bug reports** — see the Bug Fix section above

---

## 📜 License

By contributing, you agree that your contributions will be licensed under the same [MIT License](LICENSE) that covers the project.

You retain copyright to your contributions. We just need the right to include them in this project under MIT.

---

> **The best contribution is one that came from real pain.**
> If you've spent 4 hours debugging something that should've been documented — that anti-pattern is gold. Share it.
