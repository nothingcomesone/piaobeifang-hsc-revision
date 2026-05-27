# 《漂向北方》HSC 中文与文学复习资源

> *Stranger in the North* — HSC Chinese & Literature Study Hub
> 2025–2030 NESA prescribed text · Theme 1 (议题 1.1 + 1.3)

🌐 **Live site**: [https://nothingcomesone.github.io/piaobeifang-hsc-revision/](https://nothingcomesone.github.io/piaobeifang-hsc-revision/)

---

## 资源概览

本仓库包含 HSC Chinese & Literature 课程指定教材《漂向北方》（黄明志 feat. 王力宏, 2017）的完整复习资料：

- **9 节课课堂资料**（W1_L1 北漂导入 → W2_L9 Q3/Q4 综合模拟）—— 主课件 HTML + 配套练习册 HTML
- **5 个分析文件**：
  - 1 个全曲歌词分段分析（6 段 × 6 块）
  - 4 个全局附录（A 歌词手法库 / B 议题词典 / C 形象议题表 / D HSC 考试模板）
- **Q3 + Q4 练习集** 三格式（HTML / DOCX / PDF）—— 5 道 Q3 + 3 道 Q4 + 完整 Band 6 范文

---

## 学术严谨度声明

所有内容经三源交叉验证：

| 权威源 | 用途 |
|---|---|
| NESA `Prescribed Issues and Texts Mapping 25-30.docx` | 议题边界（仅 Theme 1.1 + 1.3，不承载 1.2 性别角色 / 2.x / 3.x / 4.x） |
| 学校 `飘向北方-内容分析-theme1.docx` | 教学子角度框架（1.1 八子 + 1.3 四子） |
| Google NotebookLM「漂向北方 DLC」笔记本 | 技巧词汇 / 两声部结构 / Q4 三大 established pairings |

**Q4 跨文本配对严格限学校 3 大 established**：
1. 《流浪地球2》刘培强 — 家庭责任 vs 社会期望
2. 《夹缝中的光芒》 — 「月是故乡圆」解构 / 现实妥协 / 梦想坚持
3. 《大江大河》雷东宝 — 走出舒适圈

**禁词清单**（执行 HSC C&L Band 6 写作规则）：
- 分析 prose 禁用 hedging（可能 / 也许 / 或许）
- 歌曲分析禁用电影词汇（镜头 / 场景调度 / 蒙太奇 / 导演 / 剧本）
- 歌曲分析禁用小说词汇（人物塑造 / 情节安排 / 叙事视角）
- 跨文本配对禁越界（不与《二马》/《别告诉她》配 — 学校未为本曲建立此配对）

---

## 仓库结构

```
piaobeifang-hsc-revision/
├── index.html                    ← Landing page
├── README.md                     ← 本文件
├── analysis/
│   ├── lyric-segment-analysis-all-6.html    （6 段分析）
│   ├── appendix-a-lyrical-techniques.html   （10 类歌词手法）
│   ├── appendix-b-issue-dictionary.html     （12 子角度）
│   ├── appendix-c-lyrical-voices-grid.html  （5 lyrical voices）
│   └── appendix-d-hsc-templates.html        （Q3+Q4 模板）
├── lessons/
│   ├── lesson-01..09/            （每课主 slides + 配套 worksheet）
└── practice/
    ├── q3-q4-practice-set.html
    ├── q3-q4-practice-set.docx
    └── q3-q4-practice-set.pdf
```

---

## 更新流程

修改源文件后，从 Dropbox 同步到此仓库 → commit → push：

```bash
cd ~/Code/piaobeifang-hsc-revision
./sync-to-github.sh "可选的 commit message"
```

源文件位置（Dropbox-synced）：
`~/Library/CloudStorage/Dropbox/#26CLNEW/漂向北方 DLC/`

---

## License & Use

教学研究用途免费使用 / 复制 / 改编。请保留来源链接。

商业用途请联系仓库所有者。
