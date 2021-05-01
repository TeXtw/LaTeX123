---
title: 第 08 章：表格的處理
type: docs
---

# 8. 表格的處理

這是屬於一般人覺得比較困難，但卻是很重要的部份，讓我們多花點時間研究。{{< katex >}}\LaTeX{{< /katex >}} 的表格，因為是抽象邏輯的思考方式來製作表格，對一般使用者而言，比較不容易轉換成直觀印象。當然，有些編輯器，例如 GNU Emacs，有方便畫 {{< katex >}}\LaTeX{{< /katex >}} 表格的編輯器 script，但這些我們先不去理他，先從 {{< katex >}}\LaTeX{{< /katex >}} 本身表格的結構理解起，這樣在使用其他的輔助工具時也會比較得心應手，甚至沒有其他工具，只要把握住表格的大結構，製作表格就不會摸不著頭緒了。

由於 {{< katex >}}\LaTeX{{< /katex >}} 內建的表格功能算有點陽春，因此這一章會介紹一些外來的巨集套件，來彌補 {{< katex >}}\LaTeX{{< /katex >}} 表格功能的不足，這些巨集，使用上算相當普遍，幾乎所有的 {{< katex >}}\TeX{{< /katex >}} 的各種發行版本都會附上，因此不必擔心可攜性的問題。

## 8.1 表格的種類

表格的使用，在文章上常常是必備的要件，他有歸納及醒目的作用，當然，表格太多也是會喧賓奪主。通常，我們中文的使用習慣，表格就是大方框內有小方框，文字置於小方框內，甚至某些小方框內還有斜線在分隔。為了排版上的方便及視覺表現上的美觀、清楚，在國際上大部份較正式的論文已不使用縱線、斜線，表格通常由橫線來做區隔，甚至完全沒有線條，使用空間區隔的方式。這種趨勢幾乎在二十幾年前就已開始普遍，只是國內的文件似乎還是很喜歡有縱、斜線在表格之中，好像沒有一些框線層層包住就不像表格。如非特殊的表現上的需求，我們應該朝簡化表格本身的方向走，將重點置於表格的內容及表格的邏輯結構安排，漂漂亮亮的表格外觀加上不當的內容配置，個人覺得這是個失敗的表格製作。

另外，等粗的雙線條，可能也是得盡量避免，通常粗細不等的外框雙線條有裝飾的作用，因此，如果文件是較正式的論文，那就可能要避免，如果是海報、DM 或要讓人們填寫的表格之類的，那又是另外一回事，這時封閉性的方框可能會有需要。這些規範只不過是一些慣例，並非一成不變的，得視文件的性質及使用場合來做變化，一個大原則是，如果是以文字敘述為主的文件，那麼，表格本身如果比文字內容搶眼太多的話，或許就要考慮簡化表格本身了。

我們這裡就來比較，有縱線、無縱線、完全沒有線框及含雙線表格的各種形式的表格，大家就自由心證，看哪一種表格看起來比較順眼。由於 HTML 格式在表格的表現上可能會失真，因此這裡製作成 PDF 格式供參考：

http://edt1023.sayya.org/tex/latex123/test-tables.tex
http://edt1023.sayya.org/tex/latex123/test-tables.pdf

## 8.2 `tabbing` 環境

這是 {{< katex >}}\LaTeX{{< /katex >}} 裡頭最基本的表格形式，除非自行另外定義、繪製，他並沒有方便可用的線條指令來區隔，完全使用空間、位置的配置來顯示表格內容，這時整個 `tabbing` 表格在 {{< katex >}}\LaTeX{{< /katex >}} 的地位並不是一個最小單位的 box，{{< katex >}}\LaTeX{{< /katex >}} `不會把整個表格當成一個單位來處理。所以，tabbing` 表格是可以跨頁的，他可以被分成兩半來處理。因此，要和其他文字、圖表並排排版時，得另外放進一個 box 中，讓他自成一個 box 單位，例如 `\parbox` 或 `minipage` 環境裡頭。

在 `tabbing` 環境中，第一個列（row）是以 `\=` 來標示 Tab 寬度來區隔欄位（column），這個寬度是由欄位裡頭的字串寬度所決定的。後續的每個欄位是由 `\>` 這個符號來區隔，每列尾要自行加上 `\\` 來換行，最後一行可以不必使用 `\\` 換行。`tabbing` 的基本大結構是：

```tex
\begin{tabbing}
column1 \= column2 \= column3 \\
item1   \> item2   \> item3   \\
itemA   \> itemB   \> itemC
\end{tabbing}
```

這裡特意把他排列整齊（事實上，不排整齊 {{< katex >}}\LaTeX{{< /katex >}} 也會幫忙排好），這樣才能看得出來他的表格結構。那如果想調整欄位寬度時可以使用 template 的方式，例如：

```tex
\begin{tabbing}
xxxxxxxxxx\=xxxxxxxxxx\=xxxxxxxxxx \kill
column1 \> column2 \> column3 \\
item1   \> item2   \> item3   \\
itemA   \> itemB   \> itemC
\end{tabbing}
```

這裡以 10 個 x 為欄位的寬度，這裡的 `\kill` 表示這一行是不印出來的，只是在表示各個欄位的樣本寬度，而且他會自動換行。當然，要使用其他的字串也是可以，例如以表格中最長字串來取代整個 x 字串，這樣就會讓欄位寬度剛好都可以容納其他欄內內容。也可以使用 `\hspace{6em}` 或其他的長度指令，來指定欄位的寬度。

對於欄位內文字的控制，`tabbing` 較不完備，雖然 {{< katex >}}\LaTeX{{< /katex >}} 有提供 `\'` 讓這個符號之前的文字靠左，及 `\` 讓這個符號之後的文字靠右，但實際運用，可能不是使用者想要的結果，因此 {{< katex >}}\LaTeX{{< /katex >}} 的表格，主要還是以 `tabular` 環境較為常用。但 `tabbing` 環境的好處是，他不見得一定要用於表格的排版，例如他也可以表現如條列環境般的另一種表現方式，而且他可以跨頁排版。

## 8.3 tabular 環境
這大概是最常使用的表格形式，可以很方便的畫線框。這種表格，{{< katex >}}\LaTeX{{< /katex >}} 是把整個表格當成一個單位來處理，就像字母一樣，因此他在版面的安排上是和一般的字母一般的處理，所以，這種表格不經特殊處理，無法被分割成兩個部份來跨頁。

和 `tabbing` 環境的不同，除了可以有線條之外（tabular 環境，當然也是可以完全沒有線條），分隔欄位的符號是 `&`，而且，一定要指定欄內文字的置放位置，欄內文字超出指定的寬度時，會自動折行，還有許多其他更細節的調整。

### 8.3.1 tabular 表格的基本結構

```tex
\begin{tabular}[t]{lll}
\hline
column1 & column2 & column3 \\
\hline
item1   & item2   & item3 \\
itemA   & itemB   & itemC \\
\hline
\end{tabular}
```

其中 `[t]` 表示 top，也可以是 b 表示 bottom，或 c 代表 center，這要在前後有文字相並排的時候才會顯現作用，因為 {{< katex >}}\LaTeX{{< /katex >}} 會把整個 tabular 表格當成一個字母單位，所以可以和其他文字、圖表並排排版。這些參數的意思是和同行文字的對齊方式，top 是表格頂端和前後文字對齊，bottom 則是表格底部和前後文字對齊，center 則是和表格中央對齊。

換行的方式和 tabbing 環境一樣，其中的 `\hline` 是畫一條橫線的意思，連續兩個 `\hline\hline` 會畫雙橫線，他本身會自動換行，因此不必加上換行符號。其中 `\begin{tabular}{lll}` 的 `lll` 是在指定各欄位內容在小方框內的置放位置，l 表示靠左（left），r 表示靠右（right），c 表示置中（center）。在 {lll} 中加上 bar（|）會畫縱線，例如 {|l|l|l|} 這樣就會變成傳統的大方框、小方框的表格。而兩個 bar 就會畫雙縱線。

tabular 環境內尚可使用另一個 tabular 環境來製作更複雜的表格，這在 tabbing 環境是不被允許的。

### 8.3.2 tabular 環境對欄位的調整

p{寬度}
這裡的 p 指的是段落（paragraph）。通常用於一個小段落的文字，指定了寬度後裡頭的文字會自動折行，而且這個段落的頂端會和其他欄位的頂端對齊。
@{文字、符號或指令}
這可以作用在本欄的各個列，讓他們都出現某個文字、符號或都在某個指令的作用下。這個指令另外會同時將欄位間距縮成 0，置於首尾的話，會有讓橫線和文字切齊的作用（預設不會切齊，橫線兩端會多出欄位間距的部份）。
\multicolumn{欄位數}{左右位置}{文字內容}
跨欄排版，例如一小段文字跨兩欄。左右位置可使用 lrc 之一。
\cline{a-b}
畫某部份欄位的橫線，其中的 a-b 指的就是要畫線的欄位數，例如 \cline{2-3} 就是畫第二欄至第三欄的橫線。
\arrayrulewidth=單位長度
調整表格線條的粗細，預設值是 0.4pt。使用方法：\arrayrulewidth=1.5pt 即可，但要注意的是要在進入 tabular 環境之前設定好。
\tabcolsep=單位長度
調整兩欄位的左右間距。請注意，這個值是實際兩欄位間距值的一半，預設是 6pt。使用方法和 \arrayrulewidth 一樣。
\doublerulesep=單位長度
調整畫雙線時，這兩線間的間距，預設值是 2pt。使用方法和 \arrayrulewidth 一樣。
\arraystretch
調整表格的上下行距。請注意，這要由 \renewcommand 來重設，因為在 LaTeX 定義出的一個常數值，而這個 \arraystretch 只是這些常數值的倍數，我們要重新改變他才能改變預設倍數。例如：example16.tex 中的使用方法。
在 tabular 環境的參數中，可能是取代原來的參數，例如 p{}。也可能是置放在原參數的前後，如 @{}，這看一下實際例子就可以瞭解：

% example16.tex
\documentclass{article}
\usepackage{textcomp}             % for \textcelsius
\renewcommand{\arraystretch}{1.2} % 將表格行間距加大為原來的 1.2 倍
\arrayrulewidth=1pt               % 調整線條粗細為 1pt
\tabcolsep=12pt                   % 調整欄間距為 24pt
\begin{document}
\centering
\section*{SPECIFIC HEATS (20 \textcelsius\ AND 1 ATM)}
\begin{tabular}{@{\sf }lll@{}}    % 第一欄位使用 sans serif 字族
\hline
 & \multicolumn{2}{c}{\bf Specific Heats} \\ % 跨二三欄排版，文字置中
\cline{2-3}                                  % 只畫二三欄橫線
 & $c$ (J/kg$\cdot$K) & $C$ (J/mol$\cdot$K) \\
\hline
Aluminum     & 900  & 24.3 \\
Copper       & 385  & 24.4 \\
Gold         & 130  & 25.6 \\
Steel/Iron   & 450  & 25.0 \\
Lead         & 130  & 26.8 \\
Mercury      & 140  & 28.0 \\
Water        & 4190 & 75.4 \\
Ice ($-$10 \textcelsius) & 2100 & 38 \\
\hline
\end{tabular}
\end{document}
textcomp 也是 LaTeX 的標準巨集之一，他提供了許多符號，不必進入數學模式也是可以正常使用。但一般編譯的話，可能會使用到 pk 點陣字，如果有安裝 cm-super Type1 字型的話，可以使用以下的編譯方式：

latex example16.tex
dvisp -Pcm-super example16.dvi
ps2pdf example16.ps
這樣就會完全使用 Type1 字型。如果沒有安裝 cm-super Type1 字型，則可引用 txfonts 或 pxfonts 巨集套件。

@{} 如果完全沒有加入任何參數，那麼他的作用只是在去掉左右兩欄間距而已，大家可以把有關 @{} 的部份拿掉，試著再編譯看看，仔細比較看有什麼不同。有些專業排版的專家建議把表格前後加個 @{} 去除突出來的橫線（實際上就是去除原有左右兩邊間距的部份）。編譯好的例子在：

http://edt1023.sayya.org/tex/latex123/example16.tex
http://edt1023.sayya.org/tex/latex123/example16.pdf
如果 @{} 裡頭不是指令，而是文字或符號，那這個文字或符號會加在各欄文字內容的前或後。

p{} 指令的使用時機是某一個欄位的文字比較多，需限定欄位的寬度讓他自動折行的情形，例如以下的例子：

% example17.tex
\documentclass{article}
\renewcommand{\arraystretch}{1.2} % 將表格行間距加大為原來的 1.2 倍
\begin{document}
\centering
\section*{Yi Syllables Area Character Blocks}
\begin{tabular}{@{}llp{6cm}@{}}
\hline
Start & End & Character Block Name \\
\hline
A000  & A48F  & Yi Syllables.

                Yi also known as Lolo, is a script resembling Chinese 
                in overall shaps that is used in the Yunnan province 
                China. \\
A490  & A4CF  & Yi Radicals.

                Basic units of the Yi syllables. \\
\hline          
\end{tabular}
\end{document}
這樣會把 p{} 指定的欄位當成一整個段落來處理，空一個空白行，同樣是表示新段落的開始。編譯好的例子如下：

http://edt1023.sayya.org/tex/latex123/example17.tex
http://edt1023.sayya.org/tex/latex123/example17.pdf

## 8.4 array 巨集套件

這個巨集套件可以加強原有 tabular 環境的功能。使用上只要引入 array 巨集套件即可，tabular 環境依原來的使用方法，只是多了些相關調整指令。

m{寬度}
這和 p{} 一樣的作用，只是置放的位置不一樣，此時其他欄位的內容會對齊這個段落的中央位置。
b{寬度}
同 p{}，但其他欄位的內容會對齊整個段落的底部。
>{指令}
這可以置於 l,r,c,p,m,b 參數之前，是對於某個欄位的內容下指令，這個指令會在此一欄位內容之前作用。引用了 array package 後，可能會抑制某些 @{指令} 的作用，此時要改用 >{指令}，但這沒有去除欄位間距的功能，可在前頭再加個 @{} 即可。
<{指令}
和 >{指令} 相同，但會在此一欄位內容之後才作用。
!{指令}
這是取代 | 的作用，可以方便使用特殊符號來代替原來的縱線。
\extrarowheight
這是在調整欄位內容頂端的空間大小，但不會改變底部的空間大小。

## 8.5 tabularx 巨集套件

tabularx 巨集套件提供一個 tabularx 環境，這是加強型的 tabular 環境，附在 LaTeX 的工具組裡頭。主要作用是改善 \tabular* 指令，指定表格寬度的功能。

在原始 tabular 環境，加了個星號，可以指定表格的寬度。但由於 \tabular* 這個原始環境，他會去修改欄內空間，而不是實際整個表格方框的寬度，這使得某些文字會超出表格範圍，因此，使用上可能 tabularx 會比較方便，他提供了 X 參數來取代原來的 lrc 參數，這個參數實際的作用是 p{} 的功能，因此會實際調整欄位方框的寬度，而且裡頭的文字敘述超過欄位寬度時會自動折行。這個套件會自動引入 array package8.1。這裡使用這兩種環境來排版，大家比較一下他的結果，就知道差異了：

% example18.tex
\documentclass{article}
\usepackage{tabularx}
\parindent=0pt
\renewcommand{\arraystretch}{1.2}
\begin{document}
\centering
\section*{\texttt{tabular*} environment}
\begin{tabular*}{8cm}{lll}
\hline
Start & End  & Character Block Name \\
\hline
3400  & 4DB5 & CJK Unified Ideographs Extension A \\
4E00  & 9FFF & CJK Unified Ideographs \\
\hline
\end{tabular*}

\section*{\textsf{tabularx} package}
\begin{tabularx}{8cm}{llX}  % 8cm 減去前兩個欄位寬度後，剩下的通通給
\hline                      % 第三欄位使用，文字超出的部份會自動折行
Start & End  & Character Block Name \\
\hline
3400  & 4DB5 & CJK Unified Ideographs Extension A \\
4E00  & 9FFF & CJK Unified Ideographs \\
\hline
\end{tabularx}
\end{document}
tabularx package 並不是都沒有缺點的，例如，使用 \verb 指令時會有一些不相容，另外，在 tabularx 環境內還要有其他的 tabularx 環境時，這個在裡頭的 tabularx 環境要由大括號括住，不能像 tabular 環境一下的直接巢狀使用。編譯好的例子在：

http://edt1023.sayya.org/tex/latex123/example18.tex
http://edt1023.sayya.org/tex/latex123/example18.pdf

## 8.6 表格線條粗細的控制（booktabs）

由前面幾節所述，可以看得出來 {{< katex >}}\LaTeX{{< /katex >}} 表格巨集的功能稍嫌陽春了點，對於一些特殊狀況可能會無法處理，對於表格外觀要求較高的使用者也會感到不足，雖然也可以自行去定義巨集，但這樣一來不但可能有可攜性的問題，而且也不是每個人都有時間去學習 {{< katex >}}\TeX/\LaTeX{{< /katex >}} 巨集的寫作。我們試圖來看看有沒有其他的解決方式，這裡不得不會提到一些外來的巨集套件，但這些套件的使用相當的普遍，幾乎可以忽略他的可攜性的問題。

我們前面曾學過 `\arraryrulewidth` 指令，可以調整線條的粗細，但是這無法各別調整線條，每個在 `tabular` 表格環境內的線條會調整成一樣的粗細。`booktabs` 巨集套件可以很方便的達成這個目的。我們來看看這個提供了什麼方便的指令：

指令	功能
\toprule[線條粗細]	畫表格頂端的橫線
\midrule[線條粗細]	畫表格裡頭的橫線
\bottomrule[線條粗細]	畫表格底部的橫線
\cmidrule	指令某個欄位畫橫線，取代原來的 \cline
使用方法和 tabular 環境差不多，連環境名稱都一樣，但可在指令後加個方括號來指定線條的粗細，不指定的話，toprule 及 bottomrule 都會比中間的其他線條粗一點。其中 cmidrule 另有更進一步的功能：

\cmidrule[線條粗細](左右是否去邊){畫線欄位}
其中「畫線欄位」和 \cline 一樣，指定欄位數即可，例如 2-3。左右去邊要表明左（l）或/及右（r），也可由大括號指定要去掉多少（預設 0.5em），如：(lr{0.7em}){2-3}。我們把 example16 拿來改一下，大家試著看看有什麼不同，編譯好的例子如下：

http://edt1023.sayya.org/tex/latex123/example19.tex
http://edt1023.sayya.org/tex/latex123/example19.pdf
由於螢幕解析度的關係，如果分不出不同，請由印表機印出來比較，或將檔案放大再來觀察。這裡最粗的是 toprule 及 bottomrule 再來是 midrule，最細的是 cmidrule。而且 booktabs 已經調整過原來 tabular 表格的上下間距，除非想得更大，不然的話，不需另外再去設定 arraystretch 的值了。

## 8.7 彩色表格（colortbl）

彩色表格已經是很普遍，但千萬要小心喧賓奪主的情況，也別弄成了大花臉。因此，淡色系可能會比較合適。我們在第 3.4.3.1 小節及 example13 曾提到過 color package 的引用，但並沒有詳細說明這個套件的用法，而 colortbl 會使用到這些顏色的功能，因此這裡稍微說明一下。

### 8.7.1 color 巨集套件

這是附在 {{< katex >}}\LaTeX{{< /katex >}} 工具組 graphics package 中的一個巨集，使用上非常簡單，只要把 color 巨集在文稿 preamble 區引上就可以使用顏色了。以下是常要用到的控制指令：

指令	作用
\color{顏色}	這會使用文章所有內容都使用這個顏色
\definecolor	定義顏色
\textcolor{顏色}{文字內容}	讓文字內容使用某特定顏色
\pagecolor{顏色}	這是在設定背景顏色，本頁及其後的頁面會使用這個背景顏色
\normalcolor{顏色}	回復原來的顏色
\colorbox{顏色}{文字內容}	這是方框背景的顏色
\fcolorbox{框色}{框內背景色}{文字內容}	這是方框顏色和其內背景顏色不同
這裡要注意的是，指令裡頭使用的顏色，必需是有定義過的顏色才能使用。color 巨集只定義了一些基本顏色，red, green, blue (RGB 模型原色), cyan, magenta, yellow, black (CMYK 模型原色), white，另外一個常用的 gray 灰階模型（gray-scale），其他的顏色得自行定義。定義顏色的語法如下：

\definecolor{顏色名稱}{色彩模型}{調色盤值}
第一個參數就是自訂的一個顏色名稱，色彩模型可使用 rgb、cmyk 或 gray，各顏色深淺值在 0-1 之間，「調色盤值」就是各種原色的值。RGB 顏色的索引值，如果是 Unix-like 系統，可找一下 rgb.txt 這個檔案，裡頭就會有各種顏色的索引值，或者，參考 example24.pdf。這裡以 bisque 這個顏色為例子，他的 rgb 三原色的深淺比例為 255, 228, 196，各除以 256 得 0.996, 0.891, 0.755，定義方法如下：8.2

\definecolor{bisque}{rgb}{.996,.891,.755}
\definecolor{mypink}{cmyk}{.1,.8,.4,.1}  % cmyk 模型的例子
這樣以後就可以使用 bisque 及 mypink 這兩種顏色了。gray 則支援灰階，可以增減他的顯現深淺，例如：

\definecolor{mygray}{gray}{.6}
或直接定義及使用，不事先定義好顏色名稱：
\textcolor[gray]{.3}{文字內容}
\textcolor[rgb]{.2,.5,.7}{文字內容}
這樣 mygray 會得到淺灰色的效果，他的顏色名稱就是 mygray。直接定義及使用雖然也可以，但不建議這麼做，因為如果有兩個地方要使用同一種顏色時，又得重複定義一次。要注意的是 gray 不能直接使用，要先定義他的灰色度，其他顏色也不能這樣單純靠一個值來定義他的深淺度。通常我們引用的時候，會加入以下的選項參數：

\usepackage[usenames,dvipsnames]{color}
\usepackage{colortbl}
這樣就可以使用 dvipsnam.def 這個檔裡頭所定義好的顏色，例如 Salmon, Orchid, BlueViolet $ \cdots\cdots$等等，請自行查閱這個檔案內容，dvipsnames 這個參數也可以不用，只用 usenames 即可。這裡引用時請注意順序，colortbl 要在後面，原因是 colortbl 巨集會自動引入 color 及 array 這兩個巨集，但裡頭並沒有含任何選項參數，所以要搶先去宣告。

### 8.7.2 colortbl 的主要指令

指令	作用
\columncolor	讓整個欄位著色
\rowcolor	整整個橫列著色
\arrayrulecolor{顏色}	指定線條的顏色
\doublerulesepcolor{顏色}	指定雙並線內間隔的顏色
在這裡，\columncolor 和 \rowcolor 的參數是一樣的，他們的共同語法是：

```tex
\columncolor[色彩模型]{顏色}[左緣突出長度][右緣突出長度]
```

我們現在就來看個實例，這裡頭有四個小例子，包括：灰階橫條、部份欄位著色、整個表格在著色背景及單一個表格內方框著色：

http://edt1023.sayya.org/tex/latex123/example20.tex
http://edt1023.sayya.org/tex/latex123/example20.pdf

## 8.8 表格的註解（threeparttable）

表格的註解比較麻煩，{{< katex >}}\LaTeX{{< /katex >}} 把 tabular 環境視為一個單位，對裡頭的文字做腳註的話，將會不翼而飛，有些巨集套件有辦法在表格內做腳註（例如 longtable package），但卻是置於頁面底部，和一般內文的註腳混在一起，多數使用者希望的是能把註解就置於表格底部。解決的方法就是使用 threeparttable package，暫時將表格的某部份分割出來。

如果你的 threeparttable package 的表現和這裡的例子有不一樣的情形，請更新這個套件，這篇文章使用的是 2003/06/13 v3.0 的版本。

ftp://ctan.unsw.edu.au/tex-archive/macros/latex/contrib/misc.zip

下載後解開壓縮檔，把 `threeparttable.sty` 拷貝至 `$TEXMF/latex/misc` 目錄下，執行一下 `texhash` 一下即可。他的環境名稱和套件名稱一樣，就是 threeparttable。把 `tabular` 及註解的指令和內容，通通包在 `threeparttable` 環境裡頭即可。

他是使用 `\tnote{符號或文字}` 先標出要註解的地方，在 `tabular` 環境結束後，再使用 `tablenotes` 環境來寫註解內容，這兩個部份都是整個被 `threeparttable` 環境包住的。底下這個例子來自這個套件的作者 Donald Arseneau，這裡把他和 booktabs package 結合起來用：

http://edt1023.sayya.org/tex/latex123/example21.tex
http://edt1023.sayya.org/tex/latex123/example21.pdf

要注意的是，在 `tablenotes` 環境下，字體並沒有縮小，可參考 `example21` 裡頭，使用 `footnotesize` 的字體大小。

## 8.9 小數點對齊（dcolumn）

這是 {{< katex >}}\LaTeX{{< /katex >}} 的標準巨集，用於將表格內的小數點對齊。原來的 `tabular` 環境的作法是去增加一個欄位，那個欄位使用 `@{.}` 來專門排小數點，這樣一來兩欄的間距會消掉，看起來就像連在一起的數字了，但這樣實在是有點 `dirty，使用` `dcolumn` 巨集的話，就可以很有規律的去對齊小數點或逗點。

`dcolumn` 的用法，主要是去取代 `tabular` 參數中的 lrc 這些參數。他使用的是一個大 D 指令，後接三個參數：

```tex
D{文稿輸入符號}{排版後輸出之符號}{小數位數}
```

例如以下的表格我們再怎麼去排，小數點總是無法對齊，因為 `tabular` 環境是以整個字串在處理的：

```tex
\begin{tabular}{lllll}
\toprule
      & headA & headB & headC & headD \\
\midrule
test1 & 7.879  & 921.661 & 1382.81 & 998.98 \\
test2 & 1.97   & 35.21   & 321.3   & 4791112.11 \\
test3 & 211.97 & 5.2     & 213.629 & 748261594.106 \\
\bottomrule
\end{tabular}
```

我們只要把 tabular 的後面參數改成：

```tex
  ...
\usepackage{dcolumn}
  ...
\begin{tabular}{lD{.}{.}{3}D{.}{.}{3}D{.}{.}{3}D{.}{.}{3}}
  ...
```

就可以讓小數點對齊。這個 3 就是最長的小數位數，我們輸入、輸出都是英文句點（就是小數點），這樣的表示法也可以另外宣告 `\newcolumntype` 的標準格式，以簡化 `tabular` 參數的輸入，即：

```tex
  ...
\usepackage{dcolumn}
  ...
\newcolumntype{z}[1]{D{.}{.}{#1}}  % 定義一個新的 z 指令
  ...
\begin{tabular}{lz{3}z{3}z{3}z{3}}
  ...
```

那個 #1 就是 z 這個新指令的參數（z 可以是任意的字母或符號），z{3} 其實就是代表 D{.}{.}{3}。中括號裡頭的 1 代表這個新的 z 後面只接一個參數，在這個例子裡就是小數點個數 3。以下是編譯好的例子：

http://edt1023.sayya.org/tex/latex123/example22.tex
http://edt1023.sayya.org/tex/latex123/example22.pdf

這裡要特別注意的是，在 dcolumn 的效力範圍裡頭，例如以上例子，受 z 指令影響的欄位，他會自動進入數學模式，裡頭要表現數學式的話，前後不必再加 $，否則會跳出數學模式。例如 example22 裡頭，那些 headA 會變成斜體字，這是因為進入了數學模式，要讓他正常的話，就要寫成 $headA$ 這樣來跳出數學模式。

## 8.10 大型表格（longtable）

這可能有兩種情形。一種是很寬的表格，另一種是很長的表格。太寬的表格可考慮旋轉一下，讓他橫放，至於長的表格可以使用 longtable 讓他可以跨頁連續。如果都不行，那只考慮夾頁，圖表另外製作，或者試著簡化圖表一途了。

### 8.10.1 太寬的表格

要把表格橫放，方法很多，例如 graphics package 一起 release 的 `lscape` 巨集套件，他會讓內文旋轉九十度，或者使用 graphics/graphicx package 本身的 `\rotatebox` 指令，將表格旋轉九十度。另外，也可以使用 rotating package 來旋轉。這些 package 基本上使用的都是 graphics/graphicx 巨集上的旋轉指令的功能，所以，不限定只能使用在圖表而已。

這裡就以 rotating package 為例來說明，他提供了 `sidewaystable` 及 `sidewaysfigure` 環境，前者會讓表格旋轉九十度，後者會讓圖形旋轉九十度。這個套件會自動引用 `graphicx` 巨集，不使用這些套件，使用 `graphicx` 的 `rotatebox{90}{表格}` 也是可以達到相同的功能，只不過限制會比較多。這裡舉一個 `rotating` 的例子，把表格置於 `sidewaystable` 環境內就行了：

http://edt1023.sayya.org/tex/latex123/example23.tex
http://edt1023.sayya.org/tex/latex123/example23.pdf

### 8.10.2 太長的表格

表格想跨頁，可以使用 `tabbing` 表格，如果想使用 `tabular` 表格，又想可以跨頁的話，可以使用 `longtable` package，這是 {{< katex >}}\LaTeX{{< /katex >}} 所附上的工具組。他提供了 `longtable` 環境來取代原來的 `tabluar` 環境。如果想要和 `booktabs` 合用的話，請更新 booktabs package 的版本，目前最新的版本是 2003/03/28 v1.618：

ftp://ctan.unsw.edu.au/tex-archive/macros/latex/contrib/booktabs.zip

我們把前面提到過的 `rgb.txt` 拿來排成表格參考，例子如下：

http://edt1023.sayya.org/tex/latex123/example24.tex
http://edt1023.sayya.org/tex/latex123/example24.pdf

## 8.11 浮動環境

`tabular` 表格，{{< katex >}}\LaTeX{{< /katex >}} 都會把他視為一個獨立的 box，也就是會把他當成一個字母單位在處理，他不能被分割，常常因為圖表稍大些 {{< katex >}}\LaTeX{{< /katex >}} 就會起新頁去置放，但這樣一來原本的頁面就會顯得空盪，整個版面看起來很不自然，這種情形下，他們的置放位置就很重要了，使用浮動環境的話，{{< katex >}}\LaTeX{{< /katex >}} 會繼續文字的部份，而把圖表置放在下一頁的頂端。通常，在 {{< katex >}}\LaTeX{{< /katex >}} 的浮動環境下，圖表通常會置放在一頁的頂端或都是底部，正常是不置放在一頁中間的位置，除非強迫指定，有放不下的情形時，就會讓他佔一整頁。因此，{{< katex >}}\LaTeX{{< /katex >}} 就得把前後位置經過整體的計算後再來決定圖表應該置放在什麼地方，這就是所謂的浮動環境。8.3

### 8.11.1 基本的浮動環境

{{< katex >}}\LaTeX{{< /katex >}} 的浮動環境很簡單，就是把表格置於 table 環境當中就可以了。在裡頭有 `\{caption}` 指令可以指定表格的標頭，而且編譯後會自動標上 `Table n:' 字樣，後接 caption 的內容，那個 n 會自動編號。

一般國際上較正式的文件，caption 置放的位置慣例是「表上圖下」，也就是說表格的標題是置於表格上方，圖形則在下方。但 {{< katex >}}\LaTeX{{< /katex >}} 對 caption 的置放位置，是對於不管圖表皆置於下方的配置，我們把 caption 置於上方時，caption 和表格的間距將會太小。如果不想手動去調整，可以找 topcapt package 試試看。手動修改的方法如下：

```tex
  ...
\begin{table}  % 進入浮動環境
\begin{table}[置放位置選項]
\setlength{\abovecaptionskip}{0pt}
\setlength{\belowcaptionskip}{10pt}
\caption{表格的標題}
\begin{tabular}{表格參數}
  表格內容
\end{tabular}
\end{table}
```

原始的定義，`abovecaptionskip` 和 `belowcaptionskip` 的值剛好相反。如果是兩欄排版時，要加個星號，`\begin{table*}...\end{table*}`。

### 8.11.2 浮動環境選項參數

{{< katex >}}\LaTeX{{< /katex >}} 的浮動環境的配置，有時會不符和我們實際上的期望，這時可加入選項參數。

位置選項	作用
h(here)	置於下指令處位置
t(top)	置於一頁的頂端
b(bottom)	置於本頁底部，如空間不夠會置於次頁
p(page)	單獨佔一頁，此頁沒有內文的部份
\suppressfloats[位置]	抑制浮動物件置放於本頁的某處，他會出現在次頁

!	置於以上選頁之前，會更強烈要求達到此選項的作用。但對 p 則無作用
如果都沒有指定，那預設是 `[tbp]`。其中 `\suppressfloats[位置]` 只能指定 t 或 b，不能同時指定好幾個，而且 ! 的作用會優先，他會忽略 `\suppressfloats` 的指示。這些指示，{{< katex >}}\LaTeX{{< /katex >}} 經過整體計算後，如果覺得窒礙難行的話，仍然會「抗命行事」的，畢竟他要以大局為重。

