# 🤖 Claude Code Config — نظام الأدوار المتعدد

> **[English](README.md)** | **العربية**

تكوين شخصي محمول لـ [Claude Code](https://claude.com/claude-code) يحوّله إلى **شريك هندسي متعدد الأدوار** — يغطي وجهات نظر تقنية، منتجية، نموّ، تصميم، أعمال، وبنية تحتية.

---

## 🎯 لماذا نشرت هذا؟ (وما الذي فيه لك)

### أهدافي

1. **🌍 مشاركة مع المجتمع العربي** — التوثيق التقني العميق بالعربية نادر. هذا المشروع يحاول سد جزء من الفجوة.
2. **🏗️ Portfolio لتفكيري الهندسي** — يعكس كيف أفكر في architecture، products، growth، business — وليس مجرد كود.
3. **🤝 بداية محادثة** — لمن يريد التعاون أو الاستفسار عن خدماتي، الـ repo يجيب نصف الأسئلة قبل أن تُطرح.
4. **🔄 تحسين تعاوني** — أنماطكم قد تحسّن نظامي. الـ feedback مفتوح.

### لماذا يهمك أنت؟

#### 👨‍💻 إذا كنت مطوّراً عربياً

- **توفير أسابيع من التجربة والخطأ** — نظام مُجرَّب على مشاريع فعلية، ليس فكرة نظرية
- **توثيق عربي فصيح** — لا حاجة للترجمة الذهنية المستمرة من الإنجليزية
- **مرجع جاهز** — `Patterns/` و `Anti-patterns/` يوفران عليك تكرار أخطاء معروفة
- **قابل للتخصيص بسهولة** — استبدل `PersonalContext.md` بسياقك وستتكيّف التوصيات تلقائياً

#### 🚀 إذا كنت Solo developer أو Founder

- **تفكير بإنتاجية فريق** — 8 أدوار = 8 وجهات نظر متخصصة بدون توظيف
- **يكسر الـ AI tunnel vision** — بدلاً من رد generic، تحصل على رأي CTO + رأي PM + رأي Growth في القرار الواحد
- **يمنع الـ Freelancer Trap** — نظام تنبيه تلقائي عند الأنماط التي تستنزف وقتك (deals صغيرة، one-time، إلخ)
- **Auto-ADR** — قراراتك المعمارية محفوظة بشكل منظم، لا تنسى "لماذا اخترت X" بعد 6 أشهر

#### 🤔 إذا كنت تفكر في التعاون معي

- **اطلع على منهجيتي قبل اللقاء** — كيف أحلل، أصمم، أتخذ القرارات
- **اعرف مستوى التوثيق المتوقع** — هذا ما أنتجه لمشاريعي ولعملائي
- **اختبر التوافق التقني/الثقافي** — قبل استثمار وقت في discovery calls

#### 🔬 إذا كنت مهتماً بـ AI workflows

- **مثال عملي لـ multi-agent thinking** — وليس "single prompt"
- **Lazy-loaded architecture** — تعلّم كيف تكسر الـ context bloat
- **Discovery-First protocol** — حل عملي لمشكلة الـ AI hallucinated functions

### كيف تشارك؟

| تريد... | افعل... |
|---------|---------|
| **تجربة النظام** | شغّل [الـ one-liner](#-البدء-السريع) — 30 ثانية وتكون جاهزاً |
| **بناء نسختك الخاصة** | عمل [fork](https://github.com/sabrydawood/claude-config/fork) واستبدل `PersonalContext.md` |
| **مساهمة pattern أو anti-pattern** | افتح [PR](https://github.com/sabrydawood/claude-config/pulls) — أراجع كل واحد |
| **سؤال أو نقاش** | افتح [Issue](https://github.com/sabrydawood/claude-config/issues) — تفاعل مفتوح |
| **التواصل مباشرة** | [GitHub @sabrydawood](https://github.com/sabrydawood) |
| **مشاركة مع آخرين** | شارك الـ repo مع developer عربي يحاول إتقان Claude Code |

> **لماذا تساهم؟** كل pattern تضيفه يصبح متاحاً لك ولكل مطوّر آخر يستخدم النظام. التحسينات تعود لك أيضاً.

---

## 🎬 شاهده في عمل

<!-- ![Auto-Detection في عمل](docs/screenshots/auto-detection.gif) -->

```text
                          السؤال
                            ↓
   ┌────────────────────────────────────────────────────┐
   │ > هل أرفع أسعاري من $5K إلى $10K للمشاريع الجديدة؟    │
   └────────────────────────────────────────────────────┘

                  Auto-Detection يُفعَّل (بدون أمر يدوي)
                            ↓
              ┌─────────────────────────────────────┐
              │ 🎭 Active: Senior PM + BD + Growth   │
              │ 📌 السبب: قرار تسعير له أبعاد متعددة   │
              └─────────────────────────────────────┘

                  رد منظم متعدد الأدوار
                            ↓
   ┌────────────────────────────────────────────────────┐
   │ ## 🎯 Product Take — رفع السعر لـ $10K               │
   │                                                    │
   │ ### من منظور PM                                     │
   │ - $5K/مشروع حالياً = $X/ساعة فعلي                    │
   │ - المضاعفة تحفّز إعادة تصنيف العملاء                 │
   │                                                    │
   │ ### من منظور BD                                     │
   │ - عند $10K، حجم الـ deal يبرر retainer pitch         │
   │ - تفقد أدنى 30% من الـ leads — selection effect     │
   │                                                    │
   │ ### من منظور Growth                                 │
   │ - حسابات LTV/CAC: عند $10K، LTV/CAC = 4.2× (صحي)    │
   │                                                    │
   │ ### التوصية ← A/B test على آخر 3 leads               │
   │                                                    │
   │ ✅ سجّلت القرار: Decisions/Global/0003-pricing.md    │
   └────────────────────────────────────────────────────┘
```

---

## 🎯 ما هذا؟

هذا الـ repo عبارة عن **تكوين شخصي لـ Claude Code** مصمم للمطورين المنفردين والفرق الصغيرة، ليجعل الـ AI assistant:

- 🎭 **يتحوّل تلقائياً بين 8 أدوار** (CTO, PM, Engineer, UI/UX, Growth, BA, DevOps, BD) حسب السياق — بدون الحاجة لكتابة "فكّر كـ..."
- 📐 **ينشئ Architecture Decision Records (ADRs) تلقائياً** للقرارات التقنية المهمة
- 🔍 **يستخدم Discovery-First protocol** — يتحقق من الكود الموجود قبل كتابة functions جديدة (يتجنب تكرار اللوجيك)
- 🧠 **يحافظ على السياق** عبر sessions بواسطة ملفات lazy-loaded
- 🌐 **يتواصل بالعربية** (الأساس) مع مصطلحات تقنية بالإنجليزية
- ⚙️ **يعمل مع أي stack** (Bun/Node/Go/Rust/PHP/.NET) مع توجيه stack-specific حسب الحاجة

## 🏗️ بنية الـ Repo

```tree
claude-config/
├── CLAUDE.md                      # الملف الرئيسي (يُحمَّل في كل session)
├── CommunicationProfiles.md       # 5 أساليب كتابة حسب الجمهور
├── PersonalContext.template.md    # Template — املأ بياناتك (يبقى محلياً)
├── settings.template.json         # Settings نظيف — انسخ وعدّل
├── Roles/                         # 8 أدوار (lazy-loaded)
│   ├── README.md                  # دليل Auto-Detection
│   ├── CTO.md
│   ├── Senior-PM.md
│   ├── Senior-Engineer.md
│   ├── UI-UX.md
│   ├── Growth-Strategist.md
│   ├── Business-Analyst.md
│   ├── DevOps-SRE.md
│   └── Business-Developer.md
├── Patterns/                      # مكتبة How-tos قابلة للاستخدام
├── Anti-patterns/                 # سجل الأخطاء الشائعة
├── Decisions/                     # ADR template + هيكل
├── Stacks/                        # Gotchas حسب الـ stack
│   ├── Bun-Hono.md
│   ├── NextJS.md
│   └── ... (10 stacks)
├── agents/                        # Sub-agents مخصصة
├── commands/                      # Slash commands مخصصة
├── skills/                        # Skills مخصصة
└── scripts/                       # Sync scripts
    ├── install.ps1                # Windows: repo → ~/.claude/
    ├── install.sh                 # Mac/Linux: repo → ~/.claude/
    ├── backup.ps1                 # Windows: ~/.claude/ → repo
    └── sync-check.ps1             # Windows: عرض الفروقات
```

## 🚀 البدء السريع

### المتطلبات

- [Claude Code](https://claude.com/claude-code) مُثبّت
- Git
- PowerShell 5+ (Windows) أو Bash (Mac/Linux)

### ⚡ تثبيت بأمر واحد (موصى به)

**Windows (PowerShell):**

```powershell
irm https://raw.githubusercontent.com/sabrydawood/claude-config/main/bootstrap.ps1 | iex
```

**Mac / Linux (Bash):**

```bash
curl -fsSL https://raw.githubusercontent.com/sabrydawood/claude-config/main/bootstrap.sh | bash
```

هذا كل ما تحتاجه. الـ bootstrap سيقوم بـ:

1. عمل clone للـ repo إلى `~/claude-config`
2. نسخ احتياطية لـ `~/.claude/` الموجود (بـ timestamp)
3. تثبيت كل ملفات التكوين
4. إنشاء `PersonalContext.md` و `settings.json` من الـ templates

### تثبيت يدوي (بديل)

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

### بعد التثبيت

- عدّل `~/.claude/PersonalContext.md` — املأ سياقك التجاري
- عدّل `~/.claude/settings.json` — أضف صلاحياتك/hooks/أسرارك
- أعد تشغيل Claude Code لتحميل التكوين الجديد

## 🧠 كيف يعمل نظام الأدوار المتعددة

### Auto-Detection (الكشف التلقائي)

عند طرح سؤال، يكتشف الـ Agent تلقائياً أي دور (أو أدوار) يجب تفعيله حسب السياق:

| إذا سألت... | الأدوار المُفعّلة |
|------------|------------------|
| "هل أرفع أسعاري؟" | PM + BD + Growth |
| "كيف أوسّع هذا الـ API؟" | DevOps + CTO |
| "قيّم هذا العرض للشراكة" | BD + BA |
| "هل أبني هذه الـ feature؟" | PM + CTO |
| "لماذا users بيتركوا؟" | Growth + PM |

Banner يظهر في بداية الرد مع الأدوار النشطة + السبب.

### الوضع الافتراضي

الـ Agent يعمل في **CTO + Senior PM mode افتراضياً** — يخطط ويحلل لكن **لا يكتب كود** إلا بإذن صريح ("نفّذ" / "implement this").

### Auto-ADR

عندما يتخذ الـ Agent قراراً معمارياً مهماً (اختيار stack، vendor، إلخ)، ينشئ Architecture Decision Record في `Decisions/` تلقائياً.

### Discovery-First Coding

قبل كتابة أي كود، الـ Agent مُلزم بـ:

1. قراءة الـ context الكامل (الملف + types + interfaces)
2. البحث عن implementations موجودة (عبر Serena MCP)
3. التحقق من الفهم مع المستخدم
4. ثم الكتابة

هذا يمنع نمط "تكرار اللوجيك" الشائع في توليد كود AI.

## ⚙️ التكوين

### `PersonalContext.md` (Template-based)

بعد التثبيت، عدّل `~/.claude/PersonalContext.md` بـ:

- حجم فريقك وتخصصك
- الأهداف السنوية + تركيز الربع الحالي
- المشاريع النشطة ونموذج العملاء
- تفضيلات Stack الافتراضية
- تفضيلات التواصل
- ما لا تريد الـ Agent يفعله

هذا الملف **gitignored** — بياناتك الشخصية تبقى على جهازك.

### `settings.json` (Template-based)

عدّل الصلاحيات والـ hooks والـ MCP servers. **لا تـ commit ملف `settings.json` أبداً** — قد يحتوي على:

- Database connection strings مع passwords
- API tokens
- مسارات تكشف بنية المشروع

### MCP Servers الموصى بها

هذا التكوين محسّن لـ MCP servers التالية (اضبطها بشكل منفصل):

- **Serena** — Code intelligence (`find_symbol`, `search_for_pattern`)
- **code-review-graph** — Per-project code graph لتحليل المخاطر

## 🎓 اللغات

- **الأساسية:** العربية — للمحادثات الطبيعية مع Sabry
- **التقنية:** الإنجليزية — للكود، frameworks، والمصطلحات القياسية

النظام مصمم للمطورين العرب لكن المحتوى التقني (frameworks، patterns، code) بالإنجليزية.

## 🔄 سيناريوهات الاستخدام

| السيناريو | الأمر |
|----------|-------|
| **جهاز جديد كلياً** | الـ one-liner أعلاه |
| **إعادة تثبيت (refresh)** | نفس الـ one-liner — يكتشف الـ repo الموجود ويحدّثه |
| **رفع تعديلاتك المحلية للـ repo** | `cd ~/claude-config && .\scripts\backup.ps1 && git push` |
| **سحب تحديثات من جهاز آخر** | نفس الـ one-liner — يسحب التحديثات ويثبّتها |
| **عرض الفروقات قبل أي مزامنة** | `.\scripts\sync-check.ps1` |

## 📚 مصادر الإلهام

هذا الإعداد مستوحى من:

- **ثقافة dotfiles** — version control لبيئات المطورين
- **Architecture Decision Records (ADRs)** — نمط Michael Nygard
- **أنظمة multi-agent role-based** — بدلاً من assistant واحد عام، أدوار متخصصة
- **Lazy loading** — main config خفيف، تحميل المعرفة المتخصصة عند الحاجة

## 🤝 المساهمة

هذا تكوين شخصي لكن لا تتردد في:

- عمل fork وتكييفه مع workflow الخاص بك
- فتح issues لو لقيت bugs
- اقتراح patterns أو anti-patterns اكتشفتها

## 📝 الترخيص

MIT — راجع [LICENSE](LICENSE)

## 🙋 أسئلة شائعة

**س: لماذا 8 أدوار؟ ألا يكفي assistant واحد؟**
ج: قرارات مختلفة تحتاج عقليات (mental models) مختلفة. الـ CTO يفكر بشكل مختلف عن Growth Strategist. إجبار دور واحد على التعامل مع كل شيء يؤدي لنصائح عامة. فصل الأدوار = نتائج مركّزة وقابلة للتنفيذ.

**س: ما الفرق بين هذا وبين system prompts العادية؟**
ج: هذا نظام طبقي: core صغير دائم (CLAUDE.md) + أدوار متخصصة lazy-loaded + قواعد معرفية منظمة (Patterns, Decisions, Anti-patterns). يتوسع مع الاستخدام بدون نفخ الـ context.

**س: لماذا لا نستخدم `/agents` المدمجة في Claude؟**
ج: الـ sub-agents لـ spawning مهام معزولة. الأدوار هنا عبارة عن عقليات (mental models) تُحمَّل في المحادثة الأساسية — غرض مختلف.

**س: هل أحتاج كل الأدوار الثمانية؟**
ج: لا. ابدأ بـ CTO + PM (افتراضي)، وأضف الباقي عند الحاجة. كل ملف دور مستقل عن الآخر.

**س: كيف أحدّث الـ repo من تعديلاتي المحلية؟**
ج: شغّل `.\scripts\backup.ps1` ثم `git push`. الـ script ينسخ الملفات الـ trackable فقط (يتجاهل runtime data والـ secrets).

**س: ماذا لو عملت تعديلات على CLAUDE.md ولا أريد رفعها؟**
ج: استخدم `~/.claude/settings.local.json` للـ overrides الخاصة بالجهاز. أو أنشئ branch محلي في الـ repo بدون push.
