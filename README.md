<!-- Badge for License -->
<div align="right">

  [![](https://img.shields.io/github/license/Hsins/LaTeX123.svg?style=flat-square)](./LICENSE)

</div>

<!-- Logo -->
<p align="center">
  <img src="https://i.imgur.com/uPDQu69.png" alt="大家來學 LaTeX" height="150px">
</p>

</div>

<!-- Title and Description -->
<div align="center">

# 大家來學 LaTeX

📖 _The classic and complete guide written in Traditional Chinese to help you get started on your journey with LaTeX_

</div>

## 簡介

此倉庫託管著李果正（Edward G.J. Lee）先生於 2004 年接受中華民國行政院研考會委辦的「政府機關資料文件交換之電子檔案格式應用研究」計畫補助所撰寫的《大家來學 LaTeX》原始程式代碼。

絕大多數使用 LaTeX 進行專業文章排版的中文使用者必定曾經耳聞或閱讀過此書，但 LaTeX 歷經多年的發展，書中已有部分內容在今時今日已然不適用，本專案將根據原書的章節順序與原稿進行適當編修。

## 編譯說明

### 圖片處理

使用 MetaPost 繪製的 `*.mp` 檔案需要使用 [`mptopdf`](https://linux.die.net/man/1/mptopdf) 轉換為 `*.pdf` 才能插入至文件中：

```bash
$ sudo apt install mptopdf texlive-metapost
$ mptopdf <*.mp>
```

使用 LaTeX 繪製的 `*.pdf` 檔案根據設置的文件格式不同可能存在白邊，此處使用 [`pdfCropMargins`](https://pypi.org/project/pdfCropMargins/) 去除：

```bash
$ pip install pdfCropMargins --upgrade
$ pdf-crop-margins -v -p 0 -a -6 <*.pdf>
```

### 文件編譯

於 `main` 分支中版本須使用 `xelatex` 進行編譯：

## 增修內容

### 修改

- 編碼轉換：將原始檔案由 `BIG5` 編碼轉換為 `utf8` 編碼。
- 目錄結構：重新整理檔案與資料夾結構，並將封面設計、頁眉設計、顏色設定…等整併為 `latex123.cls` 主題文件。
- 編譯引擎：中文排版方案改為使用 `xelatex` 搭配 `xeCJK` 與 `fontspec` 套件進行編譯。

### 🚧 新增

- [ ] 章節內容編修

## 原始檔案

本書的原始檔案曾經託管於淡江大學數學系的伺服器上，但連結已不復存在。倉庫中的原始代碼來源自靜宜大學資訊學院所保留之 v1.0 的原始檔案：

- [《大家來學 LaTeX》線上文件](https://www.cs.pu.edu.tw/~wckuo/doc/latex123/)
- [《大家來學 LaTeX》編譯文件](https://www.cs.pu.edu.tw/~wckuo/doc/latex123/latex123.pdf)
- [《大家來學 LaTeX》原始代碼](https://www.cs.pu.edu.tw/~wckuo/doc/latex123/latex123-v1.0-src.tar.gz)

原始檔案提交於 [`legacy`](./tree/legacy) 分支中，或可以在 [Release v1.0](https://github.com/Hsins/LaTeX123/releases/tag/v1.0) 中找到。

## 授權許可

Licensed under the GNU Free Documentation License, Copyright © 2004-present Edward G.J. Lee.
