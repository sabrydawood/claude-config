# 🤝 المساهمة في claude-config

> **[English](CONTRIBUTING.md)** | **العربية**

شكراً لتفكيرك في المساهمة. هذا المستودع يصبح أقوى مع كل pattern أو anti-pattern أو تحسين يضيفه مطوّر فعلي من تجربته الواقعية.

هذا الدليل مصمم لـ **خفض احتكاك المساهمة**: قوالب جاهزة، workflow متوقّع، مراجعات سريعة.

---

## 🎯 ما يمكنك المساهمة به

| النوع | ما يدخل فيه | الأنسب لـ |
|------|-------------|----------|
| **🧩 Pattern** | "كيف-تفعل" قابل لإعادة الاستخدام تم تطبيقه في production | "كيف أعمل X" |
| **🚫 Anti-pattern** | خطأ كلّفك وقت/مال | "كيف كسرت X" |
| **🛠️ Stack rules** | gotchas خاصة بـ framework (Bun, Next.js, Go...) | تجربة حديثة على stack |
| **🎭 تحسين دور** | frameworks أو templates أفضل داخل ملف دور | خبرة في domain |
| **📐 ADR (Decision)** | template قرار معماري قابل لإعادة الاستخدام | دروس مستفادة generic |
| **🐛 Bug fix** | مشاكل install scripts، روابط مكسورة، typos | مكاسب سريعة |
| **🌐 ترجمة** | تناسق العربي ↔ الإنجليزي | تحسين لغوي |
| **💡 دور جديد** | دور متخصص لم يُغطَّ بعد | مساهمة أكبر |

---

## ⚡ البدء السريع

```bash
# 1. عمل fork عبر GitHub UI، ثم:
git clone https://github.com/YOUR_USERNAME/claude-config.git
cd claude-config

# 2. أنشئ branch محدد
git checkout -b pattern/add-webhook-handler

# 3. اعمل تعديلاتك (راجع القوالب أدناه)

# 4. تحقق أن الـ scripts ما زالت تعمل (اختياري لكن مُقدَّر)
.\scripts\sync-check.ps1   # Windows
# bash scripts/install.sh --dry-run  # Linux/Mac

# 5. Commit + push
git commit -m "Add pattern: secure webhook handler"
git push origin pattern/add-webhook-handler

# 6. افتح PR على GitHub
```

**اصطلاح تسمية الـ branches:**

- `pattern/<اسم-قصير>` — pattern جديد
- `antipattern/<اسم-قصير>` — anti-pattern جديد
- `stack/<framework>` — stack جديد أو محدّث
- `role/<اسم-دور>` — تحسين على دور موجود
- `fix/<مشكلة>` — bug fix
- `docs/<موضوع>` — README، CONTRIBUTING، comments

---

## 📋 قوالب حسب نوع المساهمة

### 🧩 إضافة Pattern

**موقع الملف:** `Patterns/<فئة>-<فعل>.md`

**أمثلة:** `Patterns/server-add-module.md`، `Patterns/client-add-form.md`

**القالب:**

````markdown
# Pattern: [اسم قصير ووصفي]

## Use Case
متى نستخدم هذا الـ pattern + متى لا نستخدمه.

## Prerequisites
- Stack required (مثل Bun + Hono + Drizzle)
- أدوات مطلوبة
- صلاحيات / وصول مطلوب

## Steps
1. الخطوة 1 — action ملموس مع مسارات الملفات
2. الخطوة 2 — ...

## Code Example
```ts
// كود فعلي قابل للنسخ والتشغيل
// ليس pseudo-code، ليس "..."، ليس TODO
```

## Verification
- [ ] Test 1: كيف تتحقق أنه نجح
- [ ] Test 2: edge case للتأكيد

## Common Pitfalls
- ⚠️ خطأ شائع 1 + كيف تتجنبه
- ⚠️ خطأ شائع 2

## Related Patterns
- [Related-Pattern.md] — إذا كنت تحتاج X أيضاً
````

**Checklist قبل فتح الـ PR:**

- [ ] مثال الكود يعمل فعلاً (اختبره)
- [ ] لا مسارات شخصية / عميل في الكود
- [ ] لا credentials حقيقية أو API keys أو URLs داخلية
- [ ] أُضيف للـ index في `Patterns/README.md`

---

### 🚫 إضافة Anti-pattern

**موقع الملف:** `Anti-patterns/<فئة>-<اسم-قصير>.md`

**أمثلة:** `Anti-patterns/drizzle-update-without-where.md`، `Anti-patterns/jwt-in-localstorage.md`

**القالب:**

```markdown
# Anti-pattern: [اسم قصير]

## What
وصف بجملة واحدة للنمط الخاطئ.

## Why it's wrong
لماذا هذا خطأ — ما الذي يسببه؟

## When seen (السياق)
- Stack/Framework: [أين رأيت هذا]
- التكلفة: [downtime / data loss / ساعات debugging]
- (لا داعي لذكر عملاء أو مشاريع محددة بالاسم)

## Correct Approach
الطريقة الصحيحة + مثال كود.

## Detection
كيف نلتقط هذا النمط مبكراً:
- Linter rule (إن أمكن)
- Code review checklist
- Test pattern

## Related
- [Other-Anti-pattern.md] — إذا كانت تظهر سوياً غالباً
```

**قاعدة Anonymization:** احذف أسماء العملاء، الـ URLs الحقيقية، الـ credentials. اوصف الخطأ، ليس الحادثة.

---

### 🛠️ مساهمة Stack File

**موقع الملف:** `Stacks/<StackName>.md`

**إذا تضيف stack جديد:** اتبع بنية ملف موجود (مثل `Stacks/Bun-Hono.md`).

**الأقسام الموصى بها:**

1. **أساسيات الـ Runtime/Framework** — ما هذا الـ stack
2. **اصطلاحات بنية الملفات**
3. **اصطلاحات التسمية**
4. **Gotchas شائعة** (الأهم — هنا تكمن القيمة)
5. **الـ packages المطلوبة + البدائل**
6. **Setup checklist**

**معيار الجودة:** Senior engineer يقرأ هذا الملف، يجب أن يستطيع بدء مشروع جديد على هذا الـ stack دون مفاجآت.

---

### 🎭 تحسين ملف دور

**موقع الملف:** `Roles/<RoleName>.md`

**التحسينات المقبولة:**

- أسئلة إطار تفكير أفضل
- Templates إضافية للرد
- مراجع لـ methodologies / frameworks جديدة (مع citation)
- Anti-patterns محدّثة خاصة بالدور
- أمثلة من الواقع (anonymized)

**غير المقبول:**

- حذف محتوى موجود بدون مبرر
- تغيير حدود الدور الجوهرية (مثل جعل Engineer يكتب كود بدون إذن)
- إضافة تفضيلات شخصية خاصة بمستخدم واحد

**إذا كنت تقترح إعادة تصميم كبير لدور**، افتح Issue أولاً للنقاش قبل PR.

---

### 📐 مساهمة ADR Template

**موقع الملف:** `Decisions/README.md` (تحسينات على الـ template فقط)

> **مهم:** الـ ADRs الفعلية (مثل `Decisions/Global/0001-bun-default.md`) gitignored لأنها شخصية. نقبل فقط تحسينات على template/structure الـ ADR في `Decisions/README.md`.

إذا عندك مثال ADR ممتاز من عملك يعلّم الصيغة، شاركه كـ code block في الـ README — وليس كملف مرفوع.

---

### 🐛 إصلاح Bug

**أمثلة مقبولة لإصلاح bugs:**

- أخطاء `install.ps1` / `install.sh` على منصات معينة
- روابط مكسورة في الـ READMEs
- typos في ملفات الأدوار
- مراجع لإصدارات framework قديمة
- Scripts تفشل في edge cases (مسارات طويلة، spaces في الأسماء، إلخ)

**كيفية الإبلاغ (لو ما تقدر تصلح):**
افتح Issue يحتوي:

- إصدار OS + Shell
- خطوات إعادة الإنتاج
- السلوك المتوقع vs الفعلي
- مخرجات الخطأ (مع تنظيف أي secrets)

---

### 🌐 مساهمة ترجمة

**احتياجات شائعة:**

- ملف جديد بالإنجليزية → يحتاج نسخة عربية
- المحتوى العربي يبعد عن الإنجليزي (أو العكس)
- اختيار كلمات أفضل للمصطلحات التقنية

**قواعد الترجمة:**

1. **المصطلحات التقنية تبقى بالإنجليزية:** `function`، `component`، `architecture`، `deployment`، `framework`، `stack`
2. **أسماء البراندات تبقى أصلية:** Bun، Hono، Next.js، React، Claude Code
3. **الكود/الأوامر لا تُترجم أبداً**
4. **الأسلوب:** عربي طبيعي محادثة — وليس فصيح/أدبي
5. **الاتجاه:** الـ READMEs الاثنان يجب أن يوصلا نفس الفكرة، ليس ترجمة حرفية كلمة بكلمة

---

### 💡 اقتراح دور جديد

هذه **مساهمة أكبر**. افتح Issue أولاً لمناقشة الدور قبل تقديم PR.

**المطلوب لدور جديد:**

1. **حدود domain واضحة** — ماذا يفعل هذا الدور والذي لا تفعله الـ 8 أدوار الموجودة؟
2. **Auto-detection triggers** — أي سياق محادثة يفعّله؟
3. **Co-active partners** — أي أدوار موجودة تعمل معه؟
4. **Frameworks مستخدمة** — methodologies قياسية (وليس مخترعة)
5. **Anti-patterns خاصة بالدور**

**بنية الملف:** طابق صيغة `Roles/CTO.md` أو `Roles/Business-Developer.md`.

---

## ✅ Pull Request Checklist

قبل فتح الـ PR، تحقق:

- [ ] اسم الـ branch يتبع الاصطلاح (`pattern/`، `antipattern/`، `stack/`، إلخ)
- [ ] الملفات تتبع بنية القالب لنوع المساهمة
- [ ] لا بيانات شخصية (أسماء عملاء، مسارات، credentials، emails)
- [ ] أمثلة الكود تعمل فعلاً (مُختبرة محلياً)
- [ ] أُضيفت لملف الـ index المعني (`Patterns/README.md`، `Anti-patterns/README.md`)
- [ ] الـ Markdown يُعرض بشكل نظيف (لا جداول مكسورة، لا code blocks مشوّهة)
- [ ] إذا لمست `install.ps1` / `install.sh` / `bootstrap.ps1` / `bootstrap.sh` — اختبر يدوياً
- [ ] إذا أضفت ملف جديد بالإنجليزية، فكّر هل النسخة العربية مطلوبة

## 📝 PR Description Template

```markdown
## What
[جملة-جملتان: ماذا يضيف/يغير هذا الـ PR؟]

## Why
[ما المشكلة التي يحلها؟ أو ما القيمة التي يضيفها؟]

## Files Changed
- `Patterns/server-add-module.md` (جديد)
- `Patterns/README.md` (تحديث الـ index)

## Tested
- [ ] اتبعت بنية القالب
- [ ] مثال الكود يعمل
- [ ] لا secrets / بيانات شخصية
- [ ] الـ Markdown يُعرض نظيف

## Related
[روابط لـ Issues / Patterns / Anti-patterns ذات صلة، إن وجدت]
```

---

## 🎨 دليل الأسلوب

### Markdown

- **Headers:** استخدم `##` و `###` (وليس `####+` — اجعل الهرمية مسطّحة)
- **جداول:** استخدمها للمقارنات، الخيارات، الـ mappings
- **Code blocks:** حدد اللغة دائماً (```ts، ```bash)
- **Emoji في headers:** نعم، لكن باتساق مع الأسلوب الموجود
- **Bold:** للتأكيد فقط (وليس فقرات كاملة)
- **القوائم:** مرقّمة للخطوات المتسلسلة، Bullets لغير المرتبة

### الإنجليزية

- **الصوت:** مباشر، تقني، بدون marketing fluff
- **الجمهور:** مطورون mid-to-senior — تخطّ الأساسيات
- **الأمثلة:** كود فعلي قابل للتشغيل — لا pseudo-code أو "..."

### العربية

- **الأسلوب:** عربي حديث، نبرة محادثة (ليس فصحى/أدبية)
- **المزج:** مقبول إبقاء المصطلحات التقنية بالإنجليزية (`function`، `architecture`، `framework`)
- **RTL:** Markdown يتعامل معه طبيعياً — لا تضف `dir="rtl"`

---

## 🚦 عملية المراجعة

1. **فحص أولي** خلال 7 أيام — للتأكد من اتباع الـ guidelines
2. **مراجعة جوهرية** — feedback على المحتوى، البنية، الدقة
3. **Merge أو طلب تعديلات**

**ما يُدمج بسرعة:**

- إصلاح typos
- إصلاح روابط مكسورة
- تحديثات لإصدارات framework قديمة
- Anti-patterns بتكلفة واضحة وموثقة

**ما يحتاج نقاش:**

- أدوار جديدة (افتح Issue أولاً دائماً)
- تغييرات على سلوك CLAUDE.md الأساسي
- إضافة أدوات/dependencies جديدة للـ scripts
- Refactors كبيرة للأدوار الموجودة

---

## 🚫 ما لا نقبله

- **Self-promotion** — روابط لخدمات شخصية، دورات، كتب إلا إذا كانت ذات صلة مباشرة
- **Patterns تعتمد على أدوات مغلقة/مدفوعة بدون بدائل**
- **Anti-patterns تذكر عملاء أو مشاريع محددة** — اعمل anonymize أولاً
- **محتوى AI-generated بدون تحقق بشري** — لا نقبل "Claude كتب هذا وأنا لم أختبره"
- **Patterns لم تُستخدم في عمل حقيقي** — نظرية بدون تطبيق
- **Breaking changes بدون نقاش** — افتح Issue أولاً

---

## 🙋 أسئلة؟

- 💬 **افتح [Issue](https://github.com/sabrydawood/claude-config/issues)** لأي سؤال
- 📧 **GitHub @sabrydawood** للتواصل المباشر
- 🐛 **Bug reports** — راجع قسم Bug Fix أعلاه

---

## 📜 الترخيص

بالمساهمة، أنت توافق على أن مساهماتك ستكون مرخّصة تحت نفس [MIT License](LICENSE) التي تغطي المشروع.

تحتفظ بحقوق التأليف على مساهماتك. نحن فقط نحتاج الحق في تضمينها في هذا المشروع تحت MIT.

---

> **أفضل مساهمة هي التي جاءت من ألم حقيقي.**
> إذا قضيت 4 ساعات في debugging شيء كان يجب توثيقه — هذا الـ anti-pattern ذهب. شاركه.
