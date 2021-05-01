---
title: 第 11 章：一篇文章、一本書的完整結構
type: docs
---

# 11. 一篇文章、一本書的完整結構

好了，寫文章最後也要整理成冊，這也是排版系統要負責的部份。如果只是簡單幾百、幾千字的小文章，那很容易，只要個文章題目，章節標題，那也就夠了。但如果是較正式的論文，那可能還有目錄、參考文獻、索引……等等，甚至一本書籍的話，也要有個封面，及送印刷廠時要用到的裁切記號（crop marks）。如果要置放在網頁上的，那還得注意網路超連結互動的問題，所以，這些細節算是滿瑣碎的，但卻是必要的。

當然，個人也並不是什麼排版、印刷的專家，只能談談我所知道的事項，如果需要補充或修正，請有這方面經驗的朋友，不吝提供心得及指正。個人出版，這實際上不是夢，尤其網路發達的今日。


## 11.1 目錄（Contents）

目錄的問題，如果不講究的話，使用 {{< katex >}}\LaTeX{{< /katex >}} 預設的就行了。就像第 4.4 節所舉的例子一樣。但如果要做調整的話，除非熟悉 {{< katex >}}\LaTeX{{< /katex >}} 巨集的寫法、定義，否則就得使用現成的巨集套件，例如 `minitoc` 可讓目錄更緊湊，`titletoc` 更可做相當幅度的調整及美化。

在 {{< katex >}}\LaTeX{{< /katex >}} 文稿內，`\tablofcontents` 可以排版一般的章節目錄。`\listoffigures` 指令可以排版圖目錄，`\listoftables` 指令則可排版表目錄。但圖表的話是指有進入浮動環境，使用 `\caption` 指令，有編號的圖表而言。請注意，這些目錄指令的置放位置會影響實際目錄出現的順序，沒有特殊需求的話，一般的順序是文、圖、表。

### 11.1.1 更改目錄標題名稱

預設的情形下，在目錄開頭都會有個標題來引導，例如：Contents、List of Figueres 及 List of Tables 等，但是這在中文的情形看起來會不相稱，我們可以去更改預設值。更改 {{< katex >}}\LaTeX{{< /katex >}} 預設值得視原來這個值是以什麼形式出現，在目錄是以指令定義的形式出現，所以我們要使用 `\renewcommand` 這個指令去重定義他。

原來的這些 Contents 標題是怎麼「弄」出來的呢？如果手頭上沒有相當的參考書籍，可以參考他的原始定義，例如這篇文章是使用 report class，那麼找一下：

```
/usr/share/texmf/tex/latex/base/report.cls  % Unix-like 系統
C:\texmf\tex\latex\base\report.cls          % DOS/Windows 系統
```

這個檔（依安裝的地方不同，可能會有不同的路徑），搜尋 Contents 這個關鍵字，就可以發現，他們原來的定義是：

```tex
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
```

這樣就清楚了，我們要重指定的是 contentsname、listfigurename 及 listtablename。其他的情形請依此類推。現在我們來把他改成中文：

```tex
\renewcommand\contentsname{目~錄~}
\renewcommand\listfigurename{圖~目~錄}
\renewcommand\listtablename{表~目~錄}
```

這裡以 CJK 巨集為例，由於我們需要中文環境，所以這些更改要放在 CJK 環境中，如果只是更改成其他英文字樣，那我們置於 preamble 區就可以了。

### 11.1.2 目錄的深度

通常，有編號的章節或有 caption 的圖表才會編入目錄中，但如果想讓目錄的結構更細，那麼我們就得更改列入目錄的深度。目錄深度的表現形式是一種計數器（counter），他的名稱是 `tocdepth`。以這篇文章的 report class 為例，他的預設值是（請自行查一下 `report.cls`）：

```tex
\setcounter{tocdepth}{2}
```

所以會計算到 `subsection`，以下的就不列入了（請參考第 3.4.4 小節的章節深度標號）。我們只要在 preamble 區，使用 `\setcounter` 指令去重新指定，就會改變他的目錄深度。

### 11.1.3 額外的目錄

這是指沒有編入目錄，但想自行加進去的情形，例如：章節指令使用了星號就不會編號，圖表目錄沒有使用 `\caption` 指令，也不編入目錄了，這時我們可以使用 `\addcontentsline` 指令來把他們手動加進去。我們來看看文圖表的三種不同情況：

```tex
\addcontentsline{toc}{章節名}{標題}
\addcontentsline{lof}{figure}{標題}
\addcontentsline{lot}{table}{標題}
```

這樣就會把這些納入目錄，但是，這還是沒有編號的。目錄中所顯示的頁數，就是這些指令（圖表）所在的頁數。


## 11.2 交互參照（Cross References）

所謂的參照，指的是在文章某處提及某個其他的章節，或某個頁數，甚至是某個圖表，某個數學式子及某個列舉項目，排版系統必需要有這樣的功能來自動達成這種效果，而 {{< katex >}}\LaTeX{{< /katex >}} 本身提供了三個簡單易用的指令來自動處理，他會自動計算相對的章節、頁數。

當然，由於網路的發達，超連結上的交互參照也變得是不可或缺，但 {{< katex >}}\TeX/\LaTeX{{< /katex >}} 畢竟是平面排版系統，並沒有這樣的原始功能，但我們可以經由巨集套件來達成這樣的目的，`hyperef` 巨集套件就是為此而寫的，這樣就可以讓 {{< katex >}}\LaTeX{{< /katex >}} 排版的結果去轉換成 PDF/HTML 格式的時候，也有超連結的功能。

廣義的來說，包括目錄的參照、文獻參照、註解的參照及外部檔案的參照（例如，參照某個外部檔案的某個章節）都是屬於交互參照的一部份，但這些議題我們另外單獨討論，因為他不在 {{< katex >}}\LaTeX{{< /katex >}} 所提供的三個基本參照的指令範圍內。

### 11.2.1 一般的交互參照

{{< katex >}}\LaTeX{{< /katex >}} 提供了三組基本參照的指令：

```
  \label{名稱}    % 置放於要被引用之處，以一個名稱來標記他
  \ref{名稱}      % 引用 \label 所標記處的章節
  \pageref{名稱}  % 引用 \label 所標記處的頁數
```

這裡頭的名稱都是自行取名的，但為了避免重複，個人使用上一般使用上會加入章節或圖表的代號，例如：

```tex
 ...
\section{\LaTeX\ 的文稿結構}
\label{sec:struct}
 ...
\begin{figure}
\includesgrapics{fontstruct}
\caption{字型的結構}
\label{fig:struct}
\end{figure}
 ...
請參考第 \ref{sec:struct} 節，頁 \pageref{sec:struct}。
請參考圖 \ref{fig:struct}，頁 \pageref{fig:struct}。
 ...
```

這兩個 `struct` 代表不同的參照處，當然，盡量避免這種情形發生，可加入 `fontstruct` 之類的來區別，但前面冠上章節、圖表的簡名，有助於看文稿時清楚區別。請注意，其中 `sec:`、`fig:` 都不是必要的，只是這樣比較容易辨識，而且不容易名稱重複。

要非常注意的的幾個重點是：

1. 有參照的文稿一定要編譯兩次才能正常顯示。
2. 能編號的章節、圖表、列舉項目、數學式、定理才能參照，雖然他們不一定要編號。
3. 圖表的參照 `\label` 一定要在 `\caption` 之後，不能在前。

### 11.2.2 超連結交互參照（hyperlink）

這當然是要像 PDF/HTML 格式的檔案才有超連結交互參照的可能，像 `*.dvi`、`*.ps` 這類格式的檔案，先天上並沒有這種設計。而 {{< katex >}}\LaTeX{{< /katex >}} 本身並沒有內建這種功能，我們可以使用 `hyperref` 巨集套件來達成這個目的。現在一般的 {{< katex >}}\TeX{{< /katex >}} 發行版本應該都會附上這個巨集，如果沒有話，可以在以下網站下載、安裝：

ftp://ftp.tug.org/pub/tex/hyperref/

這個套件會讓原本 {{< katex >}}\LaTeX{{< /katex >}} 有交互參照的地方，在製作成 PDF 格式時也會有超連結的功能。他的設定檔是 `hyperref.cfg`，為了各種文稿使用上的彈性，可以把這個檔在工作目錄上建立一個，這樣會依這個設定檔來執行，可參考本文文稿的原始碼，裡頭會有一個設定檔供參考。當然也是可以在 preamble 區來設定，但這就只能使用在特殊的文稿上了。

他的使用方法，這裡不多做說明，可以參考本文的原始碼裡頭的使用方法，或參考〈由 TeX/LaTeX製作中文 PDF 檔〉一文：

http://www.study-area.org/tips/latex/chpdf.html
http://www.study-area.org/tips/latex/chpdf.pdf

及 `hyperref` 所附的使用手冊。


## 11.3 索引（index）

索引的排版方法上並不算困難，困難的是要選出哪個字詞需要索引，及把各個字詞加入索引指令。我們引用 {{< katex >}}\LaTeX{{< /katex >}} 的標準巨集 `makeidx`，並在其他加上一個 `makeindex` 指令，然後在文稿結束前印出索引，下 `printindex` 就可以了。我們在需要編入索引的名詞後加上 `\index{名詞}` 經過編譯後就會自動把索引及其相對的頁數計算出來。

### 11.3.1 索引的結構及編譯

我們來看看文稿裡頭要加入什麼要件：

```tex
 ...
\usepackage{makeidx}
\makeindex
 ...
要索引的名詞\index{要索引的名詞}
 ...
\printindex        % 一定要有這個指令才會印出索引
\addcontentsline{toc}{chapter}{索引}  % 把他加入目錄
 ...
```

編譯的的程序如下：

```bash
$ latex your.tex
$ makeindex your.idx
$ latex your.tex
```

### 11.3.2 索引值的製作

索引值（key）裡頭 `|`、`@` 及 `!` 有特殊的意義，要索引他們時前面要加 `"` 來 escape 他。我們來看這些符號實際上有什麼作用：

```
  abc\index{abc}	這是一般正常的索引
  xyz\index{abc!xyz}	表示 xyz 是 abc 下的一個子索引
  abc\index{abc|textit}	表示這個索引值的頁數使用 italic 斜體排版
  abc\index{abc@\textbf{abc}	表示索引值是 abc，但使用粗體排版
  \'abc\index{abc@\'abc}	表示依 abc 來排序索引，而不是後面的 ábc
```

製作索引是需要細心與耐心的，這方面更詳細的資料可以參考系統上的 `makeindex.dvi` 及 `manpages.dvi`。要注意的是 `\index{}` 最理想是緊接在要索引的名詞後，前後都不留空白，有多個 `\index{}` 相連時亦同，這會讓文件維護增加困難，因此，視每個人的習慣，可以考慮索引在整篇文稿最後才加進去。這份文件也製作了簡單的索引，但這只是當個例子供參考，在製作上有點粗糙，因此，實際上可能會漏掉很多，而且，中文的處理仍有待加強。

製作索引的時候，他的表示法要細心的注意一下，前後相同索引值的表示法要一樣，例如 `\index{abc@\textbf{abc}` 和 `\index{abc@{\bf abc}` 這會造成兩個不同的索引，雖然印出來的是一樣。而且，`\verb|abc|` 這種方式就行不通，因為 `|` 這個符號在索引指令內有他的特殊作用，要改用其他的符號代替。如果是和 `hyperref` 配合的話，`abc\index{abc|textit}` 也會行不通，因為 `hyperref` 對超連結的索引是自動加上 `|hyperpage`，如果已經有 `|textit` 了的話，就不會加上去了，這樣一來超連結的部份會被忽略，解決的方法只能去重定義索引方法，或在編譯出來的 `*.idx` 或 `*.ind` 上做另外處理。例如：

```tex
abc\index{abc|textit}
latex 編譯後的情形是：
\indexentry{abc|textit}{143}          % *.idx 檔
經 makeindex 編譯後的情形是：
\item abc, \textit{143}               % *.ind 檔
這樣只編號改變字體，並沒有超連結。而我們要的是：
\item abc, \textit{\hyperpage{143}}   % 這樣才能又變更編號字體又能超連結
```

這個議題比較深入一點，解決的方式可能需要大家一同來研究、研究，不是不能解決，而是方式在使用上是否方便的問題。

索引的處理，他的資訊實際上是產生在編譯後的 `*.idx` 檔裡頭，然後經由 makeindex 外部程式編譯後，轉換成 `*.ind`，然後 `latex` 再次編譯的時候，才把這個 `*.ind` 引進來，這個 `*.ind` 其實就是一個 {{< katex >}}\LaTeX{{< /katex >}} 的文稿，他把所有的索引值及頁數，包在一個 `theindex` 環境中來引入排版的。

說明這些的用意就是暗示，我們可以由外部處理程式去動手腳，把索引的部份再「加工」，包括中文資料的處理也是一樣，下一節要談到的參考文獻的處理機制也是類似的情形，而這也就是為什麼 `latex` 要執行好幾次的原因，也正因為這樣，我們才有動手腳的機會，例如 `makeindex` 就有 `-s` 參數，可以接受外部的 style 檔，或者，如果工作目錄上有 `*.mst`（makeindex style）這個檔，也會優先去參考錈，這樣就可以產生不同形式的索引結果。當然，參考文獻可以另單獨的一個文獻外部檔，索引的話，目前則沒有辦法這樣做，是否可以比照參考文獻的做法，由外部檔案來處理呢？就請大家腦筋急轉彎一下了，這樣也可以讓文稿更容易維護。

### 11.3.3 更改索引標題

預設的索引標題是 Index，我們可以在 preamble 區來更改他（中文的話，請放在本文區 CJK 環境內），例如，設要中文名稱的話，可更改為中文：

```tex
\renewcommand\indexname{索~引}
```

## 11.4 參考文獻（Bibliography）

參考文獻可以經由 {{< katex >}}\LaTeX{{< /katex >}} 內建的 `thebibliography` 環境來製作。長篇文稿，也可以使用 BibTeX 由外部檔案來製作。至於參考文獻的格式，就要符合邀稿單位的規格了，這裡不多做說明。

### 11.4.1 thebibliography 環境

在進入 `thebibliography`，編譯後他會自成一個獨立的章節，如果是 `article` 類別的文稿，他會自動印出 Referrences 的字樣為標題，如果是 `report` 或 `book` 類別的文稿，他會印出 Bibliography 的字樣為標題。

在 `thebibliography` 環境裡頭，他是由 `\bibitem` 指令來列出資料的，我們來看一下他的語法：

```tex
\begin{thebibliography}{99}  % 參考文獻印出之編號最寬為兩個字母寬
\bibitem[標記一]{鍵值一} 參考資料一
\bibitem[標記二]{鍵值二} 參考資料二
 ...
\edn{thebibliography}
```

所謂的「標記」這是選項參數，如果沒有的話，則正常引用後會在甲用處使用阿拉伯數字外加方括號來顯示；如果有加入的話，引用後會使用所加入的標記來顯示。那個「鍵值」指的就是引用時的關鍵字，後面所接的「參考資料」就是書籍、論文等資訊。其中的 `{99}` 只表示在最後的參考文獻印出來的時候，最開始的編號統一在兩個字母寬，如果都沒有使用「標記」，那麼就是兩個數目字寬，如果有使用「標記」，那麼要設在最長標記的字母寬，否則印出時會無法對齊。

我們引用的時候是使用 `\cite{鍵值}` 這個指令，他會顯示參考資料中的編號值，且以方括號括起來。我們來看看一些設定及引用的例子，：

```tex
\begin{thebibliography}{KDE}  % 參考文獻中印出的編號最寬為三個字母寬
\bibitem{KDEt} Knuth, D.E., \textit{The \TeX{}book},
Reading, Massachusetts: Addison-Wesley, 1989.
\bibitem[KDE]{KDEm} Knuth, D.E., \textit{The \MF{}book},
Reading, Massachusetts: Addison-Wesley, 1986.
 ...
\end{thebibliography}
```

參考文獻印出的結果請參考本文件後面關於參考資料的部份。至於引用方式及其引用情形如下（顏色的部份是因為使用 `hyperref` 套件的超連結）：

引用方式	引用結果
請參考 \cite{KDEt}	請參考 [1]
請參考 \cite[1989]{KDEt}	請參考 [1, 1989]
請參考 \cite{KDEm}	請參考 [KDE]
請參考 \cite[1986]{KDEm}	請參考 [KDE, 1986]
請參考 \cite{KDEt,KDEm}	請參考 [1,KDE]

如果你現在是在觀看 PDF 格式的檔案，那在 Xpdf 或 Adobe Acrobat Reader 都可以使用滑鼠來點一下，看看真正在後面印出時是什麼樣子。再次強調，參考文獻的規格請依邀稿單位的要求，這裡所列出來的不是「標準」。

### 11.4.2 更改標題名稱

前面已提到過更改目錄及索引的標題，同樣的方法，我們也可以更改參考資料的標題，只是要注意引用的文稿類別是什麼。

```tex
\renewcommand\refname{參~考~資~料}  % article 類別文稿
\renewcommand\bibname{參~考~文~獻}  % report/book 類別文稿
```

### 11.4.3 BibTeX 簡介

如果常常有寫論文的機會，整理出自己的一份參考文獻資料庫可以節省許多時間，正常情況下，使用 `bibtex` 來處理外部文獻檔案的情形，只有引用到的文獻才會印出來，這樣也就不必擔心印出一堆不相關的文獻了。另外一個好處是，這個參考文獻資料庫可以另外獨立維護，所有的文章都用這一份資料庫，這在維護上會很方便，也減少錯誤的機會。

BibTeX 本身提供一個外部的 `bibtex` 工具程式，在 `latex` 編譯過文稿後，再利用 `bibtex` 編譯一次文稿，最後再使用 `latex` 重編譯過。而參考文獻資料庫是按一定的格式寫於 `*.bib` 檔案裡頭，在文稿中則以 `\bibliogrphy` 指令來引入，編譯過程中自然會去參考這個外部考文獻資料庫。他的使用情形如下（以 `your.bib` 為例）：

```tex
 ...
\begin{document}
\bibliographystyle{plain}  % 指定 style 檔
 ...
\bibliography{your.bib}    % *.bib 延伸檔名可以省略
 ...
\end{document}
```

編譯過程：

```bash
$ latex example
$ bibtex example
$ latex example
```

#### 11.4.3.1 *.bib 檔的格式

`*.bib` 檔的格式自成一格，和寫在原來文稿裡頭的不同，視資料的性質，要把他標明出來，例如書籍類是 `@book` 來開頭，期刊文章使用 `@article` 來起頭，我們來看一個例子：

```
@book{ KDEt,
  author      = "Knuth, Donald E.",
  year        = "1989",
  title       = "The {\TeX}book",
  publisher   = "Addison-Wesley",
  address     = "Reading, Massachusetts",
  volumn      = " ",
  edition     = " ",
  month       = " ",
  series      = " ",
  note        = " ",
}
@article{ somekey,
  author      = "Someone",
  year        = "2004",
  title       = "The {\TeX} Journal",
  journal     = "SayYa-Publisher",
  volumn      = " ",
  number      = " ",
  pages       = " ",
  month       = " ",
  note        = " ",
}
```

每行後的逗點是必要的，名字的話 Knuth, Donald E. 或 Donald E. Knuth 這兩種方式，`bibtex` 都能認得，但姓擺在前面的時候其後要加個逗點，如果是兩位以上的作者時要以 `and` 來連接。雖然可以使用 {{< katex >}}\LaTeX{{< /katex >}} 的語法，這時他整個要由大括號括起來，而且，註解符號 `%` 不被接受。紅色的項目是必要的項目，其他項目可以列進去，也可以省略，要加進去的話，則以 空出來，這樣以後有這方面的資料時再填進去。

顯現的形式是受 `*.bst` 格式檔在控制的，所以，不必要的標點符號不要自行加進去，書名的字體顯示也無需加進去。

引用的方式同樣是使用 `\cite` 指令，一般只要要引用到的資料才會印出來，如果要全部 `*.bib` 裡頭的資料都印出來的話，可以加個 `\nocite{*}` 指令。

在使用中文的情形下，`bibtex` 程式認不得中文，在 CJK 環境下編譯會出問題，我們可以先編輯一個 `*.cbib` 檔，然後再使用 `bg5conv` 來把他轉成 `*.bib` 檔：

```bash
$ bg5conv < some.cbib > some.bib
```

這樣，在文稿裡頭引入 `some.bib` 就可以了。

#### 11.4.3.2 格式檔

BibTeX 的格式檔是 `*.bst`（bibliography style），我們上面所引用的是 `plain` 其實就是引用 `plain.bst` 這個格式檔，這是最基本的格式，在編譯時期會依這個格式檔來印出參考文獻的顯現形式。其他尚有：

- `plain`	依字母的順序印出，比較順序為 `author`, `year`, `title`
- `unsrt`	依引用的先後次序印出
- `abbrv`	與 `plain` 相同，但 `first name`, `month`, `title`, `journal` 以縮寫印出
- `alpha`	引用處顯示 [作者年份] 來取代數目字。

已經有許多人發表過特定的格式檔，但這些對於中文則無法完全合乎我們的使用習慣，例如標點符號及書名號，但我們可以去更改他們的格式，這方面的資料請參考系統上的 `btxdoc.dvi` 及 `btxhak.dvi` 這兩個說明檔。

這也算是目前的一個值得去研究的空間，尤其是中文及 Unciode 編碼文件索引、排序及排版的問題，這在英文語系算是比較容易解決，都有現成的格式範例可以運用，但中文就比較缺乏這方面的範例。在吳聰敏教授的《cwTeX 排版系統》[5] 一書裡頭，有對這方面做過努力，使用的是外部程式工具 `cwbibtex`，再和 `cw.bst` 格式檔配合的話，有不錯的結果。

## 11.5 附錄（Appendix）

排版附錄使用的是 `\appendix` 指令，這個指令以後和正常一般編輯即可，不同的附錄以 `\chapter` 來區隔，但印出來的時候會標上大寫字母，而不是原來的 Chapter 字樣。也是可以有 `\section` 指令，這資了大寫英文字母外，會緊接著附上阿拉伯數字，例如 A.1、B.2 等等。

### 11.5.1 改變附錄的標題

在英文環境，附錄是以 Appendix 為標題來開始的，在中文環境下我們要把他改成中文：

```tex
\renewcommand\appendixname{附~錄}
```

`article` 類別的文稿並不印出 Appendix 字樣，因此也就沒有 `appendixname` 來更改。

## 11.6 大型文稿的維護

通常我們寫一篇文章，大概都是一個文稿寫到底，但如果超過一百頁的文稿的時候，維護起來會比較困難，所以 {{< katex >}}\LaTeX{{< /katex >}} 提供了 `\input` 及 `\include` 指令來將外部檔案引進來，當做是文稿的一部份來編譯，這樣就可以按章節來把文稿分開處理、維護。

他們的使用方法很簡單，一個是含主要正常結構的主檔，其他的則沒有 preamble 區，只有本文區，就是按照一般文稿中的章節的部份來書寫就可以了。以這一篇文件的例子來說，他的主檔是 `latex123.tex`，主要的內容如下：

```tex
\documentclass[12pt,a4paper]{report}
 ...
 這裡是 preamble 區的內容
 ...
\begin{document}
\begin{CJK}{Bg5}{hwmm}
 ...
%

\input{story}
\input{preparation}
\input{syntax}
\input{start}
\input{space}
\input{class}
\input{package}
\input{table}
\input{graphic}
\input{math}
\input{abook}
\input{theend}
\input{fdl}
...
\end{CJK}
\end{document}
```

這裡分成兩段來處理是因為要使用 `bg5latex` 來編譯文稿，但 `latex2html` 本身已經可以處理未經前置處理的 {{< katex >}}\LaTeX{{< /katex >}} 中文文稿，所以分成兩個部份來分別處理。`\input{}` 裡頭的案名，如果沒有加附檔名的話，預設他的延伸檔名是 `*.tex`。CJK package 另外提供了 `\CJKinput` 及 `\CJKinclude` 兩個指令，也可以用來引入中文文稿。

### 11.6.1 input 和 include 的差異

這兩個指令都可以用來引進外部文稿，但有一些細節不一樣。`\input` 的情形，他可以另外指定延伸檔名，`\include` 則不行，他一定要是 `*.tex` 的延伸檔名。在引入的時候 `\include` 會起新頁，`\input` 則不一定，要視文稿類別而定。最重要的差異在於 `\include` 可以在 preamble 區和 `\includeonly{}` 指令配合，這樣就不必每次都要編譯整份文稿，只編譯新文稿就可以了，頁數、參照還是會正確顯示，這在排版大型書籍的時候就很好用了。

## 11.7 裁切記號（crop marks）

裁切記號是用在排版完成，送印後會有個標記符號，讓印刷廠可以跟據這些標記符號來做截切、剪裁的工作。{{< katex >}}\LaTeX{{< /katex >}} 本身並沒有內建這種功能，這得和 `crop` 套件來配合。

由於個人也並沒有這方面的實際經驗，因此這裡不多做說明，請自行參考 `crop` 巨集套件的說明。