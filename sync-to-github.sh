#!/bin/bash
# sync-to-github.sh
# Copy latest 漂向北方 DLC files from Dropbox → this repo → commit + push.
# Run from anywhere: ./sync-to-github.sh ["optional commit message"]
#
# Dependencies: soffice (LibreOffice headless, for docx→PDF), git, gh (optional)

set -e

SRC="/Users/sun.k/Library/CloudStorage/Dropbox/#26CLNEW/漂向北方 DLC"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ ! -d "$SRC" ]; then
  echo "❌ Source not found: $SRC"
  echo "   (Are you on the right Mac? Dropbox synced?)"
  exit 1
fi

cd "$REPO_DIR"
echo "==> Syncing from Dropbox source"
echo "    $SRC"
echo "==> Into: $REPO_DIR"
echo ""

# ---------- 1. Lesson 1-9 HTMLs (rename W#_L#_*.html → lesson-0<N>-*.html) ----------
# 漂向北方 lesson mapping (Week-Lesson naming):
#   W1_L1..L5 → lesson-01..05
#   W2_L6..L9 → lesson-06..09
echo "==> Copying + renaming lesson HTMLs"

# Lesson 1: 北漂现象导入 (only main slides, no HTML worksheet)
mkdir -p lessons/lesson-01
[ -f "$SRC/W1_L1_北漂现象导入.html" ] && cp "$SRC/W1_L1_北漂现象导入.html" "lessons/lesson-01/lesson-01-slides.html" && echo "    lesson-01 slides ✓"

# Lesson 2: 北漂群像 + 排比与细节描写 worksheet
mkdir -p lessons/lesson-02
[ -f "$SRC/W1_L2_北漂群像.html" ] && cp "$SRC/W1_L2_北漂群像.html" "lessons/lesson-02/lesson-02-slides.html" && echo "    lesson-02 slides ✓"
[ -f "$SRC/W1_L2_练习册_排比与细节描写.html" ] && cp "$SRC/W1_L2_练习册_排比与细节描写.html" "lessons/lesson-02/lesson-02-worksheet.html" && echo "    lesson-02 worksheet ✓"

# Lesson 3: 城墙行囊燕郊 + 象征对比借喻 worksheet
mkdir -p lessons/lesson-03
[ -f "$SRC/W1_L3_城墙行囊燕郊.html" ] && cp "$SRC/W1_L3_城墙行囊燕郊.html" "lessons/lesson-03/lesson-03-slides.html" && echo "    lesson-03 slides ✓"
[ -f "$SRC/W1_L3_练习册_象征对比借喻.html" ] && cp "$SRC/W1_L3_练习册_象征对比借喻.html" "lessons/lesson-03/lesson-03-worksheet.html" && echo "    lesson-03 worksheet ✓"

# Lesson 4: 副歌的情感爆发 + 矛盾修辞与递进 worksheet
mkdir -p lessons/lesson-04
[ -f "$SRC/W1_L4_副歌的情感爆发.html" ] && cp "$SRC/W1_L4_副歌的情感爆发.html" "lessons/lesson-04/lesson-04-slides.html" && echo "    lesson-04 slides ✓"
[ -f "$SRC/W1_L4_练习册_矛盾修辞与递进.html" ] && cp "$SRC/W1_L4_练习册_矛盾修辞与递进.html" "lessons/lesson-04/lesson-04-worksheet.html" && echo "    lesson-04 worksheet ✓"

# Lesson 5: 周总结 Q3 模拟 (no worksheet)
mkdir -p lessons/lesson-05
[ -f "$SRC/W1_L5_周总结Q3模拟.html" ] && cp "$SRC/W1_L5_周总结Q3模拟.html" "lessons/lesson-05/lesson-05-slides.html" && echo "    lesson-05 slides ✓"

# Lesson 6: 困境深化与重复的力量 + 反复与叠词 worksheet
mkdir -p lessons/lesson-06
[ -f "$SRC/W2_L6_困境深化与重复的力量.html" ] && cp "$SRC/W2_L6_困境深化与重复的力量.html" "lessons/lesson-06/lesson-06-slides.html" && echo "    lesson-06 slides ✓"
[ -f "$SRC/W2_L6_练习册_反复与叠词.html" ] && cp "$SRC/W2_L6_练习册_反复与叠词.html" "lessons/lesson-06/lesson-06-worksheet.html" && echo "    lesson-06 worksheet ✓"

# Lesson 7: 祈祷呐喊消亡 + 设问与对位结构 worksheet
mkdir -p lessons/lesson-07
[ -f "$SRC/W2_L7_祈祷呐喊消亡.html" ] && cp "$SRC/W2_L7_祈祷呐喊消亡.html" "lessons/lesson-07/lesson-07-slides.html" && echo "    lesson-07 slides ✓"
[ -f "$SRC/W2_L7_练习册_设问与对位结构.html" ] && cp "$SRC/W2_L7_练习册_设问与对位结构.html" "lessons/lesson-07/lesson-07-worksheet.html" && echo "    lesson-07 worksheet ✓"

# Lesson 8: 结尾与全曲整合 + 同名 worksheet
mkdir -p lessons/lesson-08
[ -f "$SRC/W2_L8_结尾与全曲整合.html" ] && cp "$SRC/W2_L8_结尾与全曲整合.html" "lessons/lesson-08/lesson-08-slides.html" && echo "    lesson-08 slides ✓"
[ -f "$SRC/W2_L8_练习册_结尾与全曲整合.html" ] && cp "$SRC/W2_L8_练习册_结尾与全曲整合.html" "lessons/lesson-08/lesson-08-worksheet.html" && echo "    lesson-08 worksheet ✓"

# Lesson 9: Q3Q4 综合模拟 (no worksheet)
mkdir -p lessons/lesson-09
[ -f "$SRC/W2_L9_Q3Q4综合模拟.html" ] && cp "$SRC/W2_L9_Q3Q4综合模拟.html" "lessons/lesson-09/lesson-09-slides.html" && echo "    lesson-09 slides ✓"

# ---------- 2. Analysis HTMLs (rename Chinese filenames → English URLs) ----------
echo ""
echo "==> Copying + renaming analysis HTMLs"
declare -a PAIRS=(
  "歌词分段分析_全6段.html|lyric-segment-analysis-all-6.html"
  "附录A_歌词手法库.html|appendix-a-lyrical-techniques.html"
  "附录B_议题词典.html|appendix-b-issue-dictionary.html"
  "附录C_形象议题表.html|appendix-c-lyrical-voices-grid.html"
  "附录D_HSC考试模板.html|appendix-d-hsc-templates.html"
)
for pair in "${PAIRS[@]}"; do
  zh="${pair%%|*}"
  en="${pair##*|}"
  if [ -f "$SRC/$zh" ]; then
    cp "$SRC/$zh" "analysis/$en"
    echo "    $zh → $en ✓"
  else
    echo "    $zh ⚠ missing in source"
  fi
done

# ---------- 3. Q3 + Q4 practice (HTML + docx + regenerate PDF) ----------
echo ""
echo "==> Copying Q3+Q4 practice HTML + docx + regenerating PDF"
Q_DOCX="$SRC/漂向北方Q3&Q4_v2.docx"
Q_HTML="$SRC/漂向北方Q3&Q4_v2.html"
if [ -f "$Q_HTML" ]; then
  cp "$Q_HTML" practice/q3-q4-practice-set.html
  echo "    q3-q4-practice-set.html ✓"
else
  echo "    Q3+Q4 html ⚠ missing in source"
fi
if [ -f "$Q_DOCX" ]; then
  cp "$Q_DOCX" practice/q3-q4-practice-set.docx
  if command -v soffice >/dev/null; then
    soffice --headless --convert-to pdf --outdir practice "$Q_DOCX" >/dev/null 2>&1
    mv "practice/漂向北方Q3&Q4_v2.pdf" practice/q3-q4-practice-set.pdf 2>/dev/null || true
    echo "    q3-q4-practice-set.docx + .pdf ✓"
  else
    echo "    q3-q4-practice-set.docx ✓ (no soffice — PDF not regenerated)"
  fi
else
  echo "    Q3+Q4 docx ⚠ missing in source"
fi

# ---------- 4. Git status check ----------
echo ""
echo "==> Git status:"
git add .
if git diff --cached --quiet; then
  echo ""
  echo "✅ No changes detected. Repo is already up to date."
  exit 0
fi
git status --short

# ---------- 5. Commit + push ----------
echo ""
MSG="${1:-Sync from Dropbox $(date '+%Y-%m-%d %H:%M')}"
echo "==> Committing: \"$MSG\""
git commit -m "$MSG

🤖 Synced via sync-to-github.sh

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"

echo ""
echo "==> Pushing to GitHub..."
git push

echo ""
echo "🚀 Done. GitHub Pages will rebuild in ~1 minute."
echo "🌐 Live site: https://nothingcomesone.github.io/piaobeifang-hsc-revision/"
