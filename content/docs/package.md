---
title: 第 07 章：巨集套件
type: docs
---

# 7. 巨集套件

{{< katex >}}\LaTeX{{< /katex >}} 系統已經好久沒有更新，有些部份可能會跟不上實際的腳步，而且有些內定的巨集定義，經過大家的使用，發覺並不是那麼的順手，尤其是功能的強化方面，因此這章談談如何引用他人已經寫好的巨集，這很重要，盡量避免重複製造輪子，寫 {{< katex >}}\TeX/\LaTeX{{< /katex >}} macro 可說是很專業的工作，要避免破壞了整體的結構，所以先找看看有什麼巨集套件可以使用。

## 7.1 一般套件的使用

我們曾在第 3.4.3 小節，頁 [*]，提到過簡單巨集的引用，事實上，有些巨集含有許多的參數來做微調，但是每個巨集套件的參數都不會一樣，因此，使用套件之前要先看一看他所附上的使用手冊。幾乎大部份的巨集套件都有使用手冊，如果是系統上就有的巨集，那麼這些文件通常會放在：

```
$TEXMF/doc  => Unix-like 系統
$TEXMF\doc  => DOS/Windows 系統
```

這些目錄底下，這些文件會有原始 {{< katex >}}\TeX/\LaTeX{{< /katex >}} 文稿，也有編譯好的 `*.dvi` 或 POSTSCRIPT 檔可以閱覽，為求方便的話，可以將他們轉成 pdf 格式來閱覽，原因是可以以關鍵字來搜尋全文，在查指令、環境時會比較方便。在 Unix-like 系統或 Windows 下的 `cygwin` 環境的話，可以使用 `texdoc` 這個指令來閱覽，例如：

```bash
$ texdoc amsguide   # 閱覽 amsguide.dvi 這個檔的說明
$ texdoc -s ams     # 查系統上所有含 ams 字樣的文件
```

## 7.2 LaTeX 官方文件中的標準巨集套件

底下是 {{< katex >}}\LaTeX{{< /katex >}} 官方文件中所附的標準巨集套件。雖然是標準巨集套件，但一般情形下，使用這些 packages 的機會並不多，都是有特殊需要時才會引入。

### 7.2.1 alltt

這個巨集套件提供 `alltt` 環境，和 `verbatim` 環境的作用相同，只是 `\`，`{`，`}` 的作用和一般文章中相同會被 {{< katex >}}\LaTeX{{< /katex >}} 解讀。這有什麼用呢？這樣一來 {{< katex >}}\LaTeX{{< /katex >}} 這個特殊標誌也可以使用，也可以讓環境中的文字具有顏色，或做其他變化，當然，裡頭的文字預設仍然是使用打字機字族的。

### 7.2.2 doc

這是用來寫 {{< katex >}}\LaTeX{{< /katex >}} 文件的巨集套件，這在使用 `ltxdoc` 這個 class 的同時就會載入 doc package。由於這不是用於一般的文件使用場合，所以，這裡就不多談，有興趣的話可自行參考他的文件說明。

### 7.2.3 exscale

由於原先的 Computer Modern font 中的數學延伸符號（cmex）只有 10pt 大小的字型（cmex10），內文放大到 large 以上的字型時，例如放大到 Large 時，有些數學符號仍然會維持一定的大小，這時可以使用這個套件，讓這些數學符號也跟著放大，例如積分符號。exscale 只有字型縮放的定義，因此只要把這個套件在 preamble 區引用就可以了，無需任何指令。

不過，這裡要說明一下，在 {{< katex >}}\TeX/\LaTeX{{< /katex >}} 裡字型放大，有時可能會造成表現失真的情形，尤其是數學式子，為了顧及數學式子中各個字母間的空間安排，cmex10 的設計並不適合拿來放大，可以把 cmr5 放大成 10pt 和真正的 cmr10 來比較就會知道表現出來會不一樣，因此，如果考慮精確配合的問題，放大數學式子的字型時可能要考慮一下使用場合，尤其目前採用向量字更是如此。請試試以下的例子，我們把 cmr5、cmr10 及 cmr12 同樣放大到 30pt 來看看結果會不會一樣：

```tex
% test-fonts.tex
\font\largecmr=cmr12 at 30pt
\largecmr
This is cmr12 at 30pt.

\font\largecmr=cmr10 at 30pt
\largecmr
This is cmr10 at 30pt.

\font\largecmr=cmr5 at 30pt
\largecmr
This is cmr5 at 30pt.
\bye
```

請注意，這是 {{< katex >}}\TeX{{< /katex >}} 文稿，不是 {{< katex >}}\LaTeX{{< /katex >}} 文稿，所以要使用 `tex` 或 `pdftex` 來編譯，他的結果如下，大家可很清楚的看得出來，雖然同樣是向量字，但放大時的表現並不會一樣：

http://edt1023.sayya.org/tex/latex123/test-fonts.tex
http://edt1023.sayya.org/tex/latex123/test-fonts.pdf

根據 Knuth 教授當初設計 Metafont，他的理念是一個同樣的字型在放大的時候，同一個字，他的筆劃置放的相對位置應該要隨放大的倍數而稍加調整。因此，假如我們只使用一種向量字型，用在不同的放大倍率的時候，文字符號間的空間配合會產生不一樣的結果，尤其是用在數學式子的時候，更加明顯。

當然，實用上 Metafont 雖然也是一種向量字型，但由於太過於複雜，不適合拿來螢幕顯示上用，所以才會退而求其次，轉成 pk 點陣字型來使用。這也就是為什麼同樣是 cmr 的字型，會有幾種不同點數的獨立字型的原因，縱使是向量字也是如此。{{< katex >}}\TeX{{< /katex >}} 已經 20 幾歲了，但是，我們的字型技術似乎還是沒有完全趕上當初 Knuth 教授的理念。

### 7.2.4 fontenc

在第 4.7.1 小節，頁 [*]，曾提到字型編碼的問題。要改變字型編碼，可以使用這個 fontenc package。以 T1 font encoding 來說：

```tex
  ...
\usepackage[T1]{fontenc}
  ...
```

這樣就可以了，但由於一些字型，例如歐洲字元，在原來的 Computer modern Type1 字型中安排不一樣，所以，有些部份會使用原始的 Metafont 字型所轉換成的 pk 點陣字，這樣的話，一般印表機印出來是差異不大，但如果是想製作成 PDF 格式在螢光幕閱覽的話，字型的表現會變得很醜。理想的話，要安裝 cm-super Type1 字型，但是一般使用者恐怕自行安裝字型會有困難。這在 teTeX 2.x 以後的版本，已經有附上 `pxfonts` 及 txfonts package 及其字型，所以，如果是新近版本的 teTeX 的話，可以由以下的方式來使用：

```tex
  ...
\usepackage{txfonts}
\usepackage[T1]{fontenc}
  ...
```

其中 `txfonts` 是模擬 Times 系列的字型，pxfonts 是模擬 Palatino 系列的字型。當然，這裡關於字型的問題有點複雜，這不在這篇文章的討論範圍，只能做簡單的說明，如果沒有特殊需要，例如，歐洲字元、一些有重音符號的字母，那使用預設的 OT1 編碼就行了，因為這些套件所附的有些字型，只有一種大小的 Type1 字型在縮放，因此使用上恐怕會有失真的情形。

### 7.2.5 graphpap

這是產生方格紙的巨集。他提供了一個指令，可以畫方格，可以配合 `picture` 環境來使用，他的語法是：

```tex
  ...
\usepackage{graphpap}
  ...
\graphpaper[n](x,y)(x1,y1)
  ...
```

其中的 n 如果省略的話，預設是 10，他指的是方格紙的最小刻度單位。(x,y) 及 (x1,y1) 指的是左下角及右上角的座標值，例如：

```tex
\documentclass{article}
\usepackage{graphpap}
\begin{document}
\graphpaper(0,0)(360,360)
\end{document}
```

這樣會畫出以 10 為最小刻度的方格，編譯好的例子如下：

http://edt1023.sayya.org/tex/latex123/test-graphpap.tex
http://edt1023.sayya.org/tex/latex123/test-graphpap.pdf

### 7.2.6 ifthen

{{< katex >}}\TeX{{< /katex >}} 本身是一種排版程式語言，當然會有條件判斷式來方便寫巨集，但如果文稿中也充滿了條件判斷式，將會使文稿複雜化，難以閱讀、維護，因此，一般條件判斷式大多數使用在巨集定義，而不是寫在文稿當中。這個 package 就是在簡化條件判斷式，以便也可以方便使用在文稿當中。

ifthen package 提供了 `\ifthenelse` 指令來做條件判斷。他後面有三個參數，第一個是條件式，第二個是條件為真的時候要執行的內容，第三個是條件為偽的時候要執行的內容。這裡不多談他的使用，底下只提供一個實例片段：

```tex
  ...
\usepackage{ifthen}
  ...
\ifthenelse{\isodd{\thepage}}%
  {\setlength{\leftmargin}{10pt}}%
  {\setlength{\leftmargin}{0pt}}
  ...
```

這樣奇數頁時，`leftmargin` 會設為 10pt，偶數頁時則為 0pt。後面加 % 代表，這三行是一整行，其間沒有空白。

### 7.2.7 inputenc

由於 fontenc package 的一些字型編碼安排，和一般所謂的 Latin-1 這些編碼（input encoding），他們的內容不一定相符，所以，fontenc package 常會和 inputenc package 互相配合使用，以確保在使用歐洲字元、符號時能正確取得到字。例如：

```tex
  ...
\usrpackage[T1]{fontenc}
\usepackage[latin1]{inputenc}
  ...
\inputencoding{ascii} % 也可以在文稿內文變換
  ...
\inputencoding{latin2}
  ...
\inputencoding{latin1}
  ...
```

當然，我們的文稿如果只是英美語系的文章，那這些都可以不必理會。

### 7.2.8 latexsym

這是 {{< katex >}}\LaTeX{{< /katex >}} 額外提供的符號。在新版的 LaTeX2e 並不會自動載入，要自行引入這個獨立出來的 package。這主要是提供 `lasy*` 這些字型裡頭的符號。如果有使用 `amsfonts` 或 `amssymb` package 的話，這些 latexsym 符號應該是可以無需引入（有少數符號是 {{< katex >}}\LaTeX{{< /katex >}} 特有的）。至於各種符號的 package 有哪些內容，可以參考系統上的 `symbols*` 這些檔案，他可能存在的形式是：

```
symbols.dvi
symbols-a4.ps[pdf]
symbols-letter.ps[pdf]
```

或者，也可以從 CTAN 下載最新的版本：

ftp://cam.ctan.org/tex-archive/info/symbols/comprehensive/symbols-a4.pdf

### 7.2.9 makeidx

這是在製作索引時要引入的 package，我們會在第 11.3 節，頁 [*] 再來討論。

### 7.2.10 newlfont

這是模擬舊版 {{< katex >}}\LaTeX{{< /katex >}} 的字型用法，讓他使用新的取字機制的 package。也就是我們在第 4.7.2，頁 [*] 所提到的用法。為免麻煩，我們盡量避免使用舊用法，而使用字型的標準指令。

### 7.2.11 oldlfont

這是模擬舊版 {{< katex >}}\LaTeX{{< /katex >}} 的字型用法的 package。

### 7.2.12 showidx

這個 package 會顯示，`\index` 指令下在什麼地方。這也會在第 11.3 節來討論。

### 7.2.13 syntonly

`syntonly` package 提供 `\syntaxonly` 指令，他可以檢查語法是否正確，並不會有 `*.dvi` 檔的輸出。但這個 `\syntaxonly` 指令一定要放在 preamble 區。

### 7.2.14 tracefnt

這是追蹤字型使用情形的 package。通常編譯時所產生的資訊已經很足夠，但如果希望有更詳細的字型使用資訊的話，可以使用這個 package：

```tex
  ...
\usepackage[debugshow]{tracefnt}
  ...
```

請注意，這樣會增加編譯的時間，而且 `*.log` 檔會很大。

## 7.3 LaTeX 官方文件中的工具組

這些巨集套件，{{< katex >}}\LaTeX{{< /katex >}} 官方文件是歸類在相關軟體（relative software）中，可能會比上一節提到的標準巨集套件來得實用些。但也同時可以看得出來 {{< katex >}}\LaTeX{{< /katex >}} 非內建的套件不少，加上其他外來的巨集套件，那真的是套件滿天飛，我們很希望在可能的情形下 {{< katex >}}\LaTeX{{< /katex >}} team 可以考慮將一些必要的套件納入內建，更加落實版面處理和文稿寫作分開的理念。

### 7.3.1 AmS-LaTeX

{{< katex >}}\LaTeX{{< /katex >}} 本身就有排版數學式子的能力，但在比較專業使用時，可能會需要增強他的功能，AmS-LaTeX 是美國數學協會（American Mathematical Society, AMS）所發展的一個增強 {{< katex >}}\LaTeX{{< /katex >}} 數學式子編輯的巨集組，是由 AmS-TeX
indexamstex@AmS-TeX 移植過來給 {{< katex >}}\LaTeX{{< /katex >}} 使用的，他主要分成兩個部份：amscls 及 amsmath，前者提供符合 AMS 的文件規格的文稿類別，後者可加強原來 {{< katex >}}\LaTeX{{< /katex >}} 的數學模式。我們會在第 10 章，頁 [*] 加以介紹。

### 7.3.2 babel

如果想排版英文以外的其他歐洲國家的語文，例如：德文、法文，那可以利用 `babel` 巨集套件。

### 7.3.3 cyrillic

這是專為排版斯拉夫民族語文，例如：俄文，那可以使用這個套件。

### 7.3.4 graphics

這是處理圖形要用到的巨集套件。但目前一般都使用功能較完善的 `graphicx` 巨集套件來取代 `graphics` 了，事實上，引用 `graphicx` 會自動的引用 `graphics`，而在指令使用的方便性上，`graphicx` 較佳，因此我們往後都是以 `graphicx` 為主來說明的。這兩個套件屬於 {{< katex >}}\LaTeX{{< /katex >}} 的圖形工具組，這個工具組包括了和顏色、圖形相關的各種巨集，我們會在第 9 章，頁 [*] 來討論。

### 7.3.5 psnfss

這是 Type1 字型的巨集套件組，例如：`times`, `charter`, `mathptmx` 等等，他會去使用這些 Type1 字型。但通常這些字型有許多是商業字型，系統上不一定會有，如果沒有的話，會去使用 free 的代替字型，或者就不嵌入這些字型了。如果沒有這些商業字型，又想要嵌入替代的 Type1 字型的話，可以考慮使用 `txfonts` 或 `pxfonts` 巨集套件及其所附字型。當然，如果專業使用的話，可能得考慮購買專業的商業字型來使用。

### 7.3.6 array

這是加強原來的 `array`, `tabular` 環境的巨集套件，可增許多細部微調的功能。這在第 8.4 節，頁 [*]，時會討論到。

### 7.3.7 calc

這個套件可以讓 {{< katex >}}\LaTeX{{< /katex >}} 接受一些簡單的代數運算。主要用於微調一些原始預設的長度及計數器（counter）。

### 7.3.8 dcolumn

這是讓表格中具有小數點的數字對齊的巨集套件。我們會在第 8.9 節，頁 [*] 中詳細討論。

### 7.3.9 delarray

這是加強 `array` 巨集套件的功能，讓矩陣或行列式的大分界符號可以使用較簡單的指令。這個套件要配合 `array` 巨集套件來使用。通常在 `array` 巨集套件中，這些矩陣或行列式的大分界符號是由 `\left` 及 `\right` 來引導才會出來，但使用 `delarray` 巨集則不必如此麻煩。這在第 10 章會討論到。

### 7.3.10 hhline

這個巨集套件會方便在畫橫線時也可以插入表格的縱線。

### 7.3.11 longtable

`longtable` 是用在跨頁表格。通常在 {{< katex >}}\LaTeX{{< /katex >}} 中的 `tabular` 表格是當做一個 box 來處理，因此無法再分割，所以無法跨頁來表現。這也會在第 8.10，頁 [*] 談到表格時提及。

### 7.3.12 tabularx

這是 `tabular` 表格環境的加強版，他可以方便的排版指定寬度的表格。同樣的，這會在第 8.3 節，頁 [*] 時提及。

### 7.3.13 afterpage

這個套件主要在調整 {{< katex >}}\LaTeX{{< /katex >}} 的浮動環境（floating environment）時，置放浮動物件，例如：圖、表的位置。

### 7.3.14 bm

`bm` 的意思，就是 bold math (symbol)，這會讓數學式子以粗體的方式來顯示。這個巨集套件，提供一個 `\bm{}` 指令，只要把數學式子置於大括號中就會由粗體來顯示。

### 7.3.15 enumerate

這是加強 `enumerate` 列舉式條列環境的巨集套件。他可以很方便的指定要使用什麼方式來起頭，原始的 `enumerate` 環境，預設第一層是阿拉伯數目字，雖然也可變更，但要重新定義，不是很方便。這裡舉個例子：

```tex
% example15.tex
\documentclass{article}
\usepackage{enumerate}
\begin{document}
\begin{enumerate}[Example-1.]
\item This is a item 1.
\item This is a item 2.
  \begin{enumerate}[(1)]
  \item This is a item (1).
  \item This is a item (2).
  \end{enumerate}
\item This is a item 3.
\item This is a item 4.
\end{enumerate}
\end{document}
```

可以指定會順延顯示的有：A, a, I, i, 1，如果這些是屬於固定顯示的部份，則要以大括號括起來，否則他會順序計算顯示。請試著和第 5.5.2 小節，頁 [*] 的標準 `enumerate` 環境比較一下。編譯後的結果如下：

http://edt1023.sayya.org/tex/latex123/example15.tex
http://edt1023.sayya.org/tex/latex123/example15.pdf

這裡請注意一下一些同名的環境、巨集套件，例如 `array` 巨集套件及 `array` 環境，這裡的 `enumerate` 巨集套件也是一樣。

### 7.3.16 fontsmpl

這是字型 sample 測試 package，他可以是互動的，也可以引用這個 package 後直接使用 \fontsample 這個指令來印出目前使用的字型 sample。

互動的話，要自行輸入字族名稱。sample 檔在 $TEXMF/tex/latex/tools 目錄下，只要下：

```bash
$ latex fontsmpl.tex
```

就可以了，他會出現：

```
This is TeX, Version 3.14159 (Web2C 7.4.5)
(./fontsmpl.tex
LaTeX2e <2001/06/01>
Babel <v3.7h> and hyphenation patterns for american, french,
german, ngerman, nohyphenation, loaded.
(/usr/share/texmf/tex/latex/base/article.cls
Document Class: article 2001/04/21 v1.4e Standard LaTeX document class
(/usr/share/texmf/tex/latex/base/size10.clo)) (./fontsmpl.sty)
Please enter a family name (for example `cmr').

\family=
```

只要輸入要測試的字型字族，例如 cmr，他就會產生 `fontsmpl.dvi` 這個檔，然後就可以使用 `dvips` 或 `dvipdfm[x]` 把他轉成 ps/pdf 格式的檔案。他只會測試 OT1 及 T1 兩種字型編碼。

### 7.3.17 ftnright

{{< katex >}}\LaTeX{{< /katex >}} 在兩欄式排版（two-column `mode）時，他的腳註是置放在各自欄位底部。ftnright` 會將兩欄式排版時，把所有的腳註都置放在右欄底部。這樣可以將腳註集中，看起來不會那麼凌亂。

### 7.3.18 indentfirst

通常，{{< katex >}}\LaTeX{{< /katex >}} 的章節開頭的第一個段落是不縮排的，在第二個段落起才會縮排。如果習慣每個段落都有縮排，可以使用 `indentfirst` package。這個套件也是引入就可以了，無需任何指令。

### 7.3.19 layout

這是顯示目前版面配置的 package。引入這個 package 後，只要在本文區下 `\layout` 指令，他就會畫出目前的版面配置，也會將各種數據顯示出來。我們在第 5.2.1 小節，頁 [*]，裡頭所顯示的版面圖，就是這樣畫出來的。


### 7.3.20 multicol

在 {{< katex >}}\LaTeX{{< /katex >}} 宣告文稿類別的同時，我們可以選用 `twocolumn` 來選擇兩欄式的排版，再多則不行。在兩欄式的排版時，我們可以使用 `\onecolumn` 及 `\twocolumn` 指令，在單欄及兩欄間變換，但這有一個很嚴重的缺點，那就是欄位變換也會迫使換新頁，原來的頁面將會顯得空曠。

`multicol` 的目的，不僅突破兩欄，可以做多欄式的排版（最多可至十欄的排版），也可以在變換欄位編排時在同一頁面變換，而不必換新頁。他提供了 `multicols` 環境來做欄位的變換。他的使用方法很簡單，欄位數目及變換完全由環境來控制：

```tex
  ...
\usepackage{multicol}
  ...
\begin{multicols}{欄數}
  ...
  內容，依正常單欄方式書寫即可
  ...
\end{multicols}
```

請注意，引入時 `multicol` 是沒有 `s` 的，而環境中的 `multicols` 是有 `s` 的。`multicol` package 處理腳註的方式，和單欄排版相同，就是通通置於本頁底部，不分左右欄位。

### 7.3.21 rawfonts

這是模擬 {{< katex >}}\LaTeX{{< /katex >}} 2.09 舊版的低階字型指令，例如 \texrm 代表 10pt 的羅馬字族的字。在新版的 LaTeX2e 並沒有定義這些指令。

### 7.3.22 somedefs

這是寫 {{< katex >}}\LaTeX{{< /katex >}} 巨集的一些範例定義，可以很容易的更改其中設定來寫自己的 package。這不在這篇文章的討論範圍，因此就不多談了。

### 7.3.23 showkeys

這個 package 會把 `\label`, `\ref`, `\pageref` 等交互參照的指令內容，或文獻引用內容，在指令所在處印出來。

### 7.3.24 varioref

這是加強型的交互參照的方式，我們會在第 11 章來討論。

### 7.3.25 verbatim

這是加強 {{< katex >}}\LaTeX{{< /katex >}} 原來的 `verbatim` 環境的同名套件。可以在裡頭使用註解，也可以利用 `\verbatiminput{檔案名}` 指令來引入外來檔案，當然，引入後會自動進入 `verbatim` 環境中。

### 7.3.26 xr

xr 是 eXternal References 的縮寫，意思就是交互參照外部的檔案。這會在第 11.2 節，頁 [*] 來討論。

### 7.3.27 xspace

這個 package 會在一個巨集結束時聰明的插入適當的空白。我們在第 3.3.2，頁 [*]，時曾談到 {{< katex >}}\LaTeX{{< /katex >}} 指令的結束的問題，所以，我們得在指令後加 `\ ` 或者 `{}` 來結束一個指令。但如果巨集定義時使用了 `xspace` 巨集套件的一個指令 `\xspace`，那麼他就會自動判斷指令何時結束，而不必自行插入 `\ ` 或 `{}` 了。

### 7.3.28 theorem

這是 {{< katex >}}\LaTeX{{< /katex >}} 內建的 theorem 環境的加強型巨集套件。我們會在第 10，頁 [*]，再來討論。

## 7.4 巨集套件何處尋？

重複發明輪子要盡量避免，所以，如果需要些功能，而 {{< katex >}}\LaTeX{{< /katex >}} 似乎沒有，那可以先找看看是不是別人已經有寫好類似的功能的巨集套件，首先要找的應該是 FAQ 文件：

http://www.tex.ac.uk/faq

在 news://tw.bbs.comp.tex 也有一篇 Chun-Chieh Huang 所維護的中文 FAQ 可以參考。另外 news://comp.text.tex 則是英文討論群組，可以多多利用。如果已經知道套件名或關鍵字，那可以到：

http://tug.ctan.org/CTANfind.html
去搜尋，搜尋到後可以抓整個目錄的壓縮檔。通常，安裝 package，他裡頭會說明如何安裝，萬一沒有的話，可以到 bbs/news 上發問，或者下載以下這個 sh script：

http://edt1023.sayya.org/tex/latex123/ltxins.sh
他的使用方法很簡單，把他置於執行路徑可及之處：

ltxins.sh your.dtx(or your.ins)
這樣就行了，他會產生必要的 *.sty 或 *.tex 及 pdf 格式的說明文件。這裡頭使用的是 dvipdfm[x]，所以要有安裝這兩種工具才行。當然，他不會自動安裝，你還是要手動把一些檔案拷貝到 LaTeX 找得到的地方。這只是一個很簡單的工具，因此不保證能成功編譯出文件出來。

如果想知道某個套件在系統上是否已安裝，安裝在什麼地方，可使用以下的小工具：

http://edt1023.sayya.org/tex/latex123/ltxpkg.sh
把他拷貝至路徑所及之處，使用方法如下：

ltxpkg.sh package-name[.sty]
這會列出所查詢的套件是否已安裝，及安裝在什麼目錄下，及這個 package 是否有預先載入其他的 package(s)。當然，這兩個小工具都是 bash script 寫的，你的系統要有安裝 bash，一般的 Unix-like 系統應該沒有問題，Mac OS X 及 Windows/cygwin 環境就不敢保證了。這也是個很簡單的小工具，如果是由 \input 指令所載入的其他 .tex 檔，可能就會偵測不出來了，許多特殊細節也是沒有去考慮到，因此實際上要以 package 的原始 macro 內容為準。以下為一個使用實例：

edt1023:~$ ltxpkg.sh colortbl

The position of this package is at:
/usr/share/texmf/tex/latex/carlisle/colortbl.sty

The preloaded package(s) of `colortbl.sty' is(are):
array,color
所以，得知 colortbl package，系統上已經安裝，而且他會在引入的同時也引入 array 及 color 這兩個 packages，除非要變更這兩個 package 引入時的選項參數，不然就可以不必引入這兩個 packages 了。

