---
title: 第 09 章：圖形的處理
type: docs
---

# 9. 圖形的處理

{{< katex >}}\TeX{{< /katex >}} 系統發展的時代，對於圖形處理還比較落後，當時，ps/eps/pdf、jpeg/png 這些圖檔都還不存在，因此這是 {{< katex >}}\TeX{{< /katex >}} 本身的一個盲點，雖然有 Metafont/MetaPost 這些強大的造字、繪圖的程式，但這些工具，一般人恐怕不容易駕馭，因此，可能需要尋求更方便的外來工具。

但 {{< katex >}}\TeX{{< /katex >}} 聰明的地方就是，他本身不能處理的，就預留個位置，讓其他輔助的工具來處理，所以，這也是 {{< katex >}}\TeX{{< /katex >}} 20 幾歲了，還是能和新的工具配合的原因。圖形倒是還好，因為有方便的巨集及繪圖工具來處理，只要能畫的出圖來，一切都好說，而繪圖的技巧就和 {{< katex >}}\TeX/\LaTeX{{< /katex >}} 本身的排版技巧不算是直接相關了。

## 9.1 圖形的種類

我們使用的圖檔，基本上分成兩大類，一是向量圖，不會因縮放而失真，一是點陣圖，會因為縮放而失真，但視使用場合，並不是所有的圖檔都適合製作成向量圖的。不管是哪一種圖形格式，都是數位化的結果，在電腦裡頭儲存的都是數字，只不過解釋過程不同而已。由於製作高品質的文件通常都使用向量圖，因此，我們將會把重點放在向量圖，尤其是 eps/pdf 格式。

### 9.1.1 點陣圖形

這種圖形應該是佔最多數的，使用也最廣泛。他是使用自然的方式來儲存數位資料，把圖形所佔的頁面想像成是許多很細小的方格子所組成，每一個小格子就代表了一個圖素（pixel），這個圖素可能代表者各種不同的顏色，只要單位小格子愈多（解析度愈高），我們人類眼睛就會分辨不出其中的各小格式間的區隔，於是影像就可以平滑的顯示出來了。

我們平常常見的圖檔格式，例如：jpeg, gif, bmp, ico, xpm, png, psd, tiff……等等都是屬於點陣圖檔。由於他是由固定大小的圖素實際數位化儲存的，所以如果他們放大或縮小，我們的眼睛就會分辨出不同，甚至放得更大些，還可以看得出「格子」出來（這會造成所謂的鋸齒狀，jaggies），原來的影像就因此失真了。

### 9.1.2 向量圖形

向量圖檔儲存的並不是實際各種圖素的資訊，而只是儲存數學運算的基本描述，顯像時再馬上計算出結果來顯示。例如，以一個圓形圖來說，他的圖檔可能只有儲存圓心所在、圓的半徑、顏色索引值等資料，要顯示時，馬上計算，然後顯像（在螢幕或印表機上，最後顯像當然仍是要轉成點陣圖的），但由於每放大、縮小時都會重新計算過，所以，就不會造成失真了。當然，這會更秏電腦資源，但以目前的電腦軟、硬體進步的情形，這些消秏都可以控制在可被忍受的範圍。

目前最常見到的向量圖檔，應該就是 eps/pdf, svg……等圖檔，向量字型也是屬於特殊格式的一種向量圖。一般比較規律性結構的圖，會比較適合使用向量圖，自然界的實體影像可能就比較適合使用點陣圖了，但科技不會把腳步停下來，將來的數位化會是怎麼樣的情形就只能用我們的想像力去填補了。

## 9.2 繪圖工具

繪圖的工具實在是太多了，這裡不可能一一介紹，只能擇要的簡單說明。我們的重點是排版，因此要知道的是圖形怎麼安置於版面裡頭才會使整個版面協調一致，而不是在繪圖教學。就請大家自行選個順手的繪圖軟體去熟悉，這類工具，大概都是一理通百理通，畫筆怎麼用簡單，要畫出像樣的圖出來會比較困難。

### 9.2.1 原生繪圖工具

這是安裝 {{< katex >}}\TeX/\LaTeX{{< /katex >}} 系統，不管是哪一種的發行版本都會附上的，但可能會有不易入門的感覺，一旦抓到到了訣竅，這是不假外求的工具。因此，在這篇文章裡頭，會對這些原生的繪圖工具多做一些說明。這裡所提到的原生繪圖工具，另外一個好處就是可以使用 CJK 環境，意思當然就是說可以在圖中插入中文及 {{< katex >}}\LaTeX{{< /katex >}} 排版後的結果，這恐怕是許多使用者希望的功能，但一般 GUI 式的繪圖工具就常常無法完整支援了。

1. {{< katex >}}\LaTeX{{< /katex >}} 的 picture 環境  
    在 {{< katex >}}\LaTeX{{< /katex >}} 裡頭有個標準內建的圖形環境，那就是 picture 環境，但他只能繪製一些簡單的圖形，後來也有人寫了 epic 及 eepic package 來增強 picture 環境的功能，這可說是 {{< katex >}}\LaTeX{{< /katex >}} 「原生」的繪圖巨集，雖然功能不是很強，而且是由指令來指揮繪圖，不容易直觀的轉換過來，但好處是他是和 LaTeX 文稿結合在一起，使用的是 {{< katex >}}\LaTeX{{< /katex >}} 的指令，不是另外引用外來的現成圖檔，和 {{< katex >}}\LaTeX{{< /katex >}} 的結合當然會比較好。所以，我們在此會加以簡單介紹。由於 eepic 引用了 POSTSCRIPT 的指令，使用 pdflatex 時會無法編譯，因此這章只會探討 picture 環境及 epic package。我們會在第 9.3 節做進一步的說明。

2. PSTricks 巨集  
    另一個相當有名氣的繪圖巨集組 PSTricks package，功能就相當強了，他仍然是使用了 POSTSCRIPT 的指令，所以，在 pdflatex/dvipdfm[x] 常會無法編譯，要 dvips 才有辦法解讀。但另有人寫了 PDFTricks package，可以轉換成 PDF device 認得的指令，所以，在此也會一併簡單介紹他們的使用。我們將會在第 9.4 節做進一步的介紹。

3. MetaPost 繪圖工具  
    在 TeX 系統，則有 Metafont 及 MetaPost 可供繪圖，這可說是 TeX 系統的標準繪圖語言，但和 TeX 的語法有很大的不同，是一種 object-oriented 式的 macro 語言，功能相當的強大，甚至可以製作字型。MetaPost 是 Metafont 的改良版本，主要是讓預設的輸出是 eps 向量圖檔9.1，而且可以連續處理多個檔案，也可以嵌入 {{< katex >}}\TeX/\LaTeX{{< /katex >}} 的語法在裡頭。

目前 Knuth 教授編寫 TAOCP 使用的繪圖工具就是 MetaPost，我們這裡就不探討 Metafont，在語法上 MetaPost 和 Metafont 是類同的。由於 MetaPost 所產生的 eps 圖檔，不管是 latex 或是 pdflatex 都可以順利引用，所以將會在第 9.5 節獨立做進一步的說明。

當然，以上的任一個工具，要詳細說明的話，都可以寫成一本獨立的書，所以，在這裡只能簡單的介紹，沒有提到的部份，可以參考他們的使用手冊。Metafont 及 MetaPost 則可以另參考 Knuth 教授所寫的 The Metafontbook。

### 9.2.2 外來繪圖工具

我們也可以從其他的外來繪圖工具來繪製圖形，然後再引入圖檔即可，這樣一來就可以使用自己熟悉的繪圖工具。繪圖的話，當然是以向量圖為優先考慮，因為他不會因為縮放而失真。但像一些照片類的圖檔，就不太適合使用向量圖了。

以下列出的都是 free 的繪圖工具，一般用途上，功能上不見得會輸商業產品，但使用界面上就不一定比商業產品方便。以下只做簡單的介紹，至於操作方法，請直接參考其中的使用手冊的說明。種類很多，請別眼花撩亂了，就選個一、二種去熟悉他吧！畫筆可能很多種，但畫圖「心法」只有一種。

1. gnuplot  
    這是個有點古老，但卻非常實用的 $ XY$ 及 $ XYZ$ 數據資料及數學函數的繪圖工具，他有內建的繪圖語言來繪圖，可以使用交談式的方式，或寫成檔案來做批次處理。如果有安裝 kile 的話，他有 GUI 的圖形界面可以用來方便繪圖。他可以輸出 fig 圖檔，供 xfig 做進一步的修改、編輯，也可以輸出 LaTeX 的 picture 環境文稿及 MetaPost 程式碼供引入。幾乎主流的作業系統都有他的版本。他的網站及和 LaTeX 結合的一些 sample，可以參考：
http://www.gnuplot.info/
http://www.fnal.gov/docs/products/gnuplot/tutorial/
http://cips02.physik.uni-bonn.de/~baehren/tex/gnuplot.html

2. GNU plotutils  
    這是和 gnuplot 類似的繪圖工具及函式庫（GNU libplot for C, libplotter for C++），主要用於繪製 2D 科學數據及數學函數向量圖。他也支援 xfig 的 fig 圖檔。而且有現成的函式庫，對於寫繪圖程式的人來說也很方便，像後面會談到的 pstoedit 就有利用到這個函式庫。他的網站在：
http://www.gnu.org/software/plotutils/

3. xfig  
    這也是很古老的 X Window System 下的繪圖工具，他的檔案格式是公開的，所以 gnuplot 也支援他。他相當於 MS Windows 下的 CorelDraw，預設的輸出格式是 eps 圖檔，但也可以輸出 LaTeX picture/epic 文稿。請參考他所附的文件來和 LaTeX/gnuplot 配合使用。他的網站在：
http://www.xfig.org/
如果你的平台無法編譯 xfig，可以試試 Java 的 jfig：

http://tech-www.informatik.uni-hamburg.de/applets/javafig/

4. tgif  
    這是和 xfig 類似的向量繪圖工具，也可以輸出 eps/pdf 圖檔供 LaTeX 來引入，gnuplot 也支援 tgif 圖檔，這個工具和 gif 圖檔是沒有關係的。記得，在好幾年前接觸 tgif 時，有人把他拿來畫卡通影像，效果還不錯，當然，他的主要用途不是在畫卡通。他的網站在：
http://bourbon.cs.umd.edu/tgif

5. grace  
    這是源自於古老的 ACE/gr 的 Motif 版本 xmgr9.2，由於改變版本為 GNU GPL 發行，所以名稱改為 grace，意思是 ``GRaphing, Advanced Computation and Exploration of data''，要說是 ``Grace Revamps ACE/gr'' 也是可以啦！這是類似 gnuplot 的 X Window System 下的繪圖工具，但有漂亮的 GUI 操作界面，是 WYSIWYG 的 2D 數據資料繪圖工具，他需要 Motif 或 LessTif 函式庫，目前尚有少數 xmgr 原來的功能還沒有完全移植過來。他的網站在：
http://plasma-gate.weizmann.ac.il/Grace/
GNU Dia
這很適合拿來畫流程圖、電路圖的一個 X Window System 下的繪圖工具，使用 Gtk+ 函式庫，類似 Windows 下的 Visio。他可以輸出 eps/svg 及一般常見的點陣圖檔，也可以輸出 MetaPost、LaTeX PSTricks 及 xfig 的圖檔。
http://www.lysator.liu.se/~alla/dia/dia.html
Ipe
這是一般性的 X Window System 及 Windows 下的繪圖軟體，使用 Qt 函式庫。他的特點是，主要輸出 pdf 圖檔，並可嵌入 TeX/LaTeX 文字，也就是說圖裡頭的文字可以是 TeX/LaTeX 排版出來的結果，也可以輸出 eps 圖檔及 XML 檔。另外一個好處是，只要是 Ipe 製作出來的 pdf/eps 圖檔，他可以由 Ipe 重新載入後予以再次的編修，這對於 eps/pdf 檔案的編修非常的方便，這類向量圖檔的編修，一般是比較困難的，尤其是 pdf 格式。他的網站在：
http://ipe.compgeom.org/
skeneil(sketch)
這在以前，稱為 sketch，是一個一般性用途的繪圖軟體，可以輸出多種向量圖，包括 svg。他是使用 Python script 語言所寫的。他的網站在：
http://sketch.sourceforge.net/index.html
GIMP(GNU Image Manipulation Program)
這是一般性的繪圖軟體，有 X Window System 及 Windows 的版本。但他主要處理的是點陣圖，類似 Photoshop 軟體。他的網站在：
http://www.gimp.org/
MetaGraf
這是 MetaPost 的圖形界面軟體，這樣就可以使用 GUI 的方式來使用 MetaPost 的強大繪圖功能了。他是 Java 語言所寫的，所以要先安裝 Java 相關工具組才行。而且，如果是像製作字型這類精確度要求很高的圖檔的話，可能就不是很合適了。他的網站在：
http://w3.mecanica.upm.es/metapost/metagraf.php
OpenOffice.org
這是整合式的文書處理軟體，裡頭也附有繪圖工具 OpenOffice.org Draw(oodraw，可單獨拿做繪圖工具)。他的網站在：
http://www.openoffice.org/
KOffice
這是另一個整合式的文書處理軟體，裡頭附有許多不同用途的繪圖工具，例如：Kivio、Karbon、Krita 及 KChart 等， 他們都可以單獨拿來繪圖。他的網站在：
http://www.koffice.org/
9.2.3 圖形轉換工具
由於 dvips 只能接受 eps 圖檔及 POSTSCRIPT 指令，而 pdflatex 則只能接受 pdf/jpeg/png 圖檔，dvipdfm[x] 除了可接受 pdf/jpeg/png 圖檔外，大部份情形下，也可以接受 eps 圖檔，但硬生生插入的 POSTSCRIPT 指令，則仍然是無法接受，畢竟他是要生成 pdf 檔的，除非是由 MetaPost 所製作出來的圖檔，不然的話，就得使用轉換工具將他們轉成可被接受的格式，所幸，這方面的工具還算方便。上一節所提到的繪圖工具，在某種程度上也是可以轉換圖檔格式。

ImageMagick
我們主要是使用這個軟體中的一個工具：convert，他是個功能非常強大的圖檔轉換程式，但主是用在點陣圖，縱使轉成向量圖也不是真正的向量圖，只是把點陣圖 wrap 進向量圖檔裡頭而已，放大時仍然會有鋸齒狀。他的網站在：
http://www.imagemagick.org/
netpbm
這是許多圖檔轉換的小工具所組成的圖檔轉換工具組，主要是用在點陣圖的轉換。他的網站在：
http://netpbm.sourceforge.net/
pstoedit
這是真正各種向量圖格式之間的轉換工具。向量圖的轉換，主要是利於編修，例如 eps/pdf 圖檔要直接編修的話，一般工具會有困難，如果我們轉換成 fig 圖檔，然後再交給 xfig 去編修；或轉成 MetaPost 原始碼，使用編輯器進行編修，完成後再轉回 eps/pdf，這樣就很方便了。他的網站在：
http://www.pstoedit.net/pstoedit/
ps2eps
通常我們手上的圖檔不一定是 eps，而是一般的 ps，也就是說除了真正圖的部份外，尚有一些空白在圖的四周，這代表裡頭的邊界（BoundingBox）沒有定好，這樣引入圖檔的時候，除非另做其他處理，不然的話，連原圖周圍的不必要空白也會引進文稿裡去，通常我們只是想要有圖的部份，這時可以將這個 ps 檔經由 ps2eps 處理過，去除不必要的空白。這個程式的作者是 Roland Bless，使用 perl 所寫一個很實用的小工具，在 Windows 系統的話，只要有安裝 perl 及 GhostScript 也可以使用，作者也提供了一個 ps2eps.bat 批次檔供使用。他的網站在：
http://www.ipv6.tm.uka.de/~bless/ps2eps
系統上安裝 Ghostscript 的話，他也會附上一個 ps2epsi，這個工具也可以利用，但有時會算錯 BoundingBox 就是了。


## 9.3 `picture` 環境

由於這是 {{< katex >}}\LaTeX{{< /katex >}} 內建的繪圖環境，最能配合 {{< katex >}}\LaTeX{{< /katex >}} 原來的語法及版面配置，因此我們多花一點時間研究，使用時請另外引入 epic package，這樣可使用多一些繪圖功能。要注意的是，{{< katex >}}\LaTeX{{< /katex >}} 的 `picture` 環境，和座標息息相關，所以，繪圖之前一定腦海裡要有個座標圖來定位，而且要有相對長度的想像。

### 9.3.1 進入 `picture` 環境

進入 `picture` 環境的方式就像進入其他的環境一樣，但他要指定圖形物件的大小：

```tex
  ...
\usepackage{epic}
  ...
\begin{document}
  ...
\begin{picture}(寬, 高)(參考原點)  % 進入圖形模式
  這裡下繪圖指令，形成一個或多個圖形物件，也可以寫入一般文字
  讓 latex 去排版。
\end{picture}
  ...
\end{document}
```

指定長、寬等度量時，可以加上單位，如果不加單位，事先也沒有指定使用單位，那就是以 pt 為單位，(寬, 高) 是不能省略的，這在座標圖上，就是建立了左下角 (0, 0) 至右上角 (寬, 高) 的參考座標系。(參考原點) 指的是左下角的原點平移至這個位置，往後就以這個點為原點，這個可以省略，省略的話，原點位置就是 (0, 0)。通常我們都會在進入 picture 環境前先加以指定好單位，例如：

```tex
  ...
\unitlenght=1mm         % 指定 picture 環境內的度量單位為 mm
\begin{picture}(50, 50) % 要進入 picture 環境前指定
  ...
```

這樣在 `picture` 環境裡頭就無需使用單位，直接寫數字就可以了，而單位就是 mm。

### 9.3.2 picture 環境的繪圖指令

在繪製任何線條之前，我們通常會指定開始的位置，否則通通會從（參考）原點開始畫起。原則上，`picture` 環境內，有方向性的圖形物件的參考原點，例如直線、箭頭直線，他的移動方式，在繪製了圖形物件後，如果不再指定起始點，那麼，{{< katex >}}x{{< /katex >}} 軸的位置會平移過去，但 {{< katex >}}y{{< /katex >}} 軸的位置則維持在原點的位置，這樣說有點抽象，只有請大家試著去畫看看才能體會了，但最好就是指定好各個圖形物件的起始位置，才不容易搞錯。

\put(啟始座標){圖形物件}
將圖形物件置於啟始座標。這個圖形物件也就是 `picture` 環境的繪圖指令，也可以是一般的文字敘述，如果是文字，那麼會依 LaTeX 的排版方式來顯現，在這篇文章裡頭，有時也會稱為「圖文物件」。
\line(向量座標){長度}
以參考原點和向量座標所構成的斜率畫指定長度的直線。不過，LaTeX 的這個畫直線的指令，有其限制：
(a) 兩座標值必需互質。
(b) 座標值要在 $ -6$ 和 $ +6$ 之間的整數。
(b) 座標值必需為整數。
所以，實際上只能畫出 25 種斜率的直線，超過這個限制的直線，只能使用較複雜的 \qbezier 指令來畫出來。
\vector(向量座標){長度}
和 \line 指令的作用及使用方法相同，但限制更嚴格，座標值要在 $ -4$ 和 $ +4$ 之間，和 \line 不同的是向量方向的那一端會多了個箭頭符號。直線和箭頭直線，他們的參考起啟點如果沒有另行指定，那 $ x$ 軸的值是會連續的，也就是說畫了一條直線後，再接著畫另一條直線，那他的 $ x$ 軸起啟點是由前一條直線的終點開始，但 $ y$ 軸的值則沒有這個特性。
\circle{半徑}
畫圓指令。請注意，如沒有使用 \put，則圓心是在原點。如果是使用 \circle*{半徑} 則是實心的圓，常常用來畫某個粗點。由於圓是以圓心為參考點，並沒有方向性，所以，並不像直線一樣，$ x$ 軸的位置會平移，仍然會以原來的原點為圓心。但如果前面有直線，那麼圓心的位置會受前一個直線影響，也就是說圓心的 $ x$ 軸位置會是前一條直線的終點的位置，當然，$ y$ 軸的位置不會受其影響，正圓及橢圓都是一樣。
\oval{寬,高}[顯示部份]
畫橢圓。「顯示部份」指的是要畫上半部（t），或是畫下半部（b），或是畫左下半部（bl），依此類推。不管是否完全畫出，圓心仍然是位在完整畫出時的圓心位置。
\qbezier[曲線總點數]{起點座標}{控制點座標}{終點座標}
畫 quadratic Bézier 曲線。其中的「曲線總點數」，代表整條曲線的總點數，有指定的話，曲線會變成虛線，不指定的話是實線，至於什麼是控制點（control point），他可以控制曲線的弧度，可由數學運算計算出來。有興趣的話，請參考：
http://www.ursoswald.ch/metapost/tutorial/BezierDoc/BezierDoc.pdf
\thicklines
指定用較粗的線條，無需接任何參數。使用 \thinklines 可還原為預設值。
\thinklines
指定用較細的線條，這是預設的線條組細大小，亦無需接任何參數。
\linethickness{粗細單位}
指定線條的預設粗細。
\framebox(寬, 高)[框內位置]{圖文物件}
畫實線框。所謂的「框內位置」可有 t, b, l, r, s，表示圖文物件置放於方框中的位置。
\dashbox{虛線線段長度}(寬, 高)[框內位置]{圖文物件}
畫虛線框。

### 9.3.3 簡化座標位置

選定一個座標定點，我們可以使用 `\put(座標)` 的方式來指定，但如果是有規律性重複出現的圖形物件，這樣一個一個指定，不僅很煩，而且也較耗記憶體，計算也會比較慢。這時可以使用 `\multiput` 指令，他的語法如下：

\multiput(起啟座標)(座標遞增值){重複次數}{圖形物件}
這裡舉一個例子，畫一個有格子的座標系：

```tex
% example25.tex
\documentclass{article}
\usepackage{epic}
\parindent=0pt
\begin{document}
\unitlength=1mm
\begin{picture}(80, 60)
\multiput(5, 0)(5, 0){15}{\line(0, 1){60}} % 畫 15 條直線，每隔 5mm 一條
\multiput(0, 5)(0, 5){11}{\line(1, 0){80}} % 畫 11 條橫線，每隔 5mm 一條
\thicklines
\put(0, 0){\vector(0, 1){60}} % 畫 y 軸
\put(0, 0){\vector(1, 0){80}} % 畫 x 軸
\put(0, 0){\circle*{1}}       % 畫圓點，實心粗點
\put(-5, -5){$O(0, 0)$}       % 標上原點的座標
\put(-5, 60){$y$}             % 標上 y 軸字樣
\put(80, -5){$x$}             % 標上 x 軸字樣
\end{picture}
\end{document}
```

我們來看看這個 multiput 到底做了些什麼事：

\multiput(5, 0)(5, 0){15}{\line(0, 1){60}}
第一個座標 (5, 0) 是啟始座標，接著的 (5, 0) 是遞增值，也就是說 (5, 0), (10, 0), (15, 0)...(75, 0) 會畫後面所接的圖形物件，也就是畫長度為 60mm 的垂直線 15 次。由於我們在 $ x$ 軸及 $ y$ 軸是另外畫帶有箭頭的直線，因此，縱橫軸的部份可以少畫一條直線。$ x$ 軸為 0 的 \line 就是在畫垂直線，$ y$ 軸為 0 的則是在畫水平線。試想想看，這些線條如果要由 \put 指令一個一個畫上去的話，會有多煩！

畫這些除了練習外，主要是給初接觸 picture 環境的朋友一個建議，那就是把方格子畫上去，有利於繪圖時找位置，等真正要畫的圖畫好了，再把方格子拿掉。編譯好的例子如下：

http://edt1023.sayya.org/tex/latex123/example25.tex
http://edt1023.sayya.org/tex/latex123/example25.pdf
另外一個簡化座標的方式，就是使用 \shortstack 指令，他的語法如下：

\shortstack[位置]{圖文物件}
這會像疊羅漢一樣的把「圖文物件」疊在一個欄位內，和疊羅漢不同的是，後進的疊在最下面，先進的會被往上堆高，底部的基準線是固定的，高度則是往上增高，各圖文物件由換行符號來換行，也就是說可以由換行符號來決定他們之間的間隔。當然，這要自行注意他的高度，否則會和其上的其他內容重疊。「位置」可為 l, r, c 之一，是指居中，或靠這個欄位的左右邊的意思。

\shortstack 的一個特殊的運用，就是在座標圖上標註縱軸的文字，但這通常是用在中文，因為，一般的慣例，縱軸的說明文，英文的話是沿縱軸由下往上寫，中文的話是由上往下寫。我們把 example25 標上中文，實際要加入的內容為：

  ...
\put(-7, 20){\shortstack{這\\[-2pt]裡\\[-2pt]是\\[-2pt]縱\\[-2pt]軸}}
\put(30, -6){這裡是橫軸}
  ...
從這裡，我們也可以發現，把格子畫出來，對於繪圖或加入說明文字時的定位非常方便。請注意，這個例子使用了 CJK 環境，要使用 bg5latex 來編譯。編譯好的例子如下：

http://edt1023.sayya.org/tex/latex123/example26.tex
http://edt1023.sayya.org/tex/latex123/example26.pdf
當然，這樣一來，字間距也得手動去調整了，理想的話是應該將中文字旋轉才比較能符合原來的字間距，意即，橫排時的字間距和行間距，在直排的時候，兩者要互換過來，但是這樣一來，會造成中文是沿著縱軸往上寫的情形，這就不符合慣例了，但這剛好常常用在中英文混合的說明文場合，中英文混合時，是按英文的慣例，沿著縱軸由下往上寫，我們將 example26 修改一下：

  ...
\put(-7, 20){\rotatebox{90}{這裡是 $y$ $axis$}}
\put(30, -6){這裡是 $x$ $axis$}
  ...
請注意，數學式子中的額外空白通常會被忽略。編譯好的例子如下：

http://edt1023.sayya.org/tex/latex123/example27.tex
http://edt1023.sayya.org/tex/latex123/example27.pdf
如何恰當的使用，就請大家視需要去調整、運用了。我們甚至可以更進一步的把各別的中文字去分別旋轉後再排上去，而且，通常圖表的說明文字會比正文小一號，就請大家動手練習一下囉！這個 \rotatebox 指令，我們還沒有學到，會在第 9.6.4 小節，頁 [*] 裡說明。

請將以上所談到的指令，一一去試著畫幾次，大概就能體會出 picture 環境如何畫圖了。

### 9.3.4 epic 巨集延伸的指令與環境

以下是 epic 所擴充的指令，和 picture 環境配合的話，會使繪圖更得心應手。

\multiputlist(起啟座標)(座標遞增值)[tbrl]{物件1, 物件2 $ \cdots\cdots$}
\multiput 是針對同一個圖形物件按規律性來置放，這個指令則是針對，不同的圖物形物件按規律性來置放。他是把所有的物件置放在一個 box 中去排列，因此會有 tbrl 的置放位置的選項參數。
\matrixput(起啟座標)(遞增值1){次數1}(遞增值2){次數2}{圖形物件}
這是 \multiput 的兩種置放規律版本，可指定兩種規律來置放同一圖形物件。
\grid(寬, 高)(橫間隔,直間隔)[標註縱橫軸座標起啟值]
畫方格的指令。我們在前面有使用 \multiput 來畫方格的例子，使用這個 \grid 將更為方便、簡潔。選項的部份，就是在方格外圍標註他的座標值，通常使用 (0, 0) 即可。
\picsquare{圖形物件}
這只是讓圓形、橢圓形，會自動產生一個圓心黑點。
\dottedline[點的形式]{點間距}(座標1)(座標2) $ \cdots\cdots$(座標n)
畫各種不同形式的虛線。會在各座標間連成虛線。點的形式可以使用其他的符號代替。
\dashline[延展值]{各點線長}[dash 點間距](座標1)(座標2) $ \cdots\cdots$(座標n)
畫各種不同形式的 dash 線。會在座標間連成 dash 線。延展值從 $ -$100 至無限大，可調整各 dash 的間距。「dash 點間距」只是在調整構成 dash 本身的點的間距，非各 dash 間距。
\drawline[延展值](座標1)(座標2) $ \cdots\cdots$(座標n)
這是加強型的畫線指令，可以將各座標間連成一線。延展值與 \dashline 同，負數值會造成類似 dash 線的效果。
\putfile{檔名}{繪圖指令}
這是引用外來數據資料來繪圖。也就是可以將 $ XY$ 座標值數據資料另存放在外部檔案來引用進來，其餘的功能和 \put 一樣。
更詳細的 epic 說明及其實例，可參考 Sunil Podar 所寫的文件 Enhancements to the Picture Environment of LaTeX：

http://www.ntg.nl/doc/podar/picman.pdf

## 9.4 PSTricks 及 PDFTricks 巨集套件

PSTricks 插入了 POSTSCRIPT 的繪圖指令給 dvips 去處理，所以繪圖功能當然比 picture 環境強大，但有一個缺點是 pdflatex/dvipdfm[x] 編譯時會出問題，得由 latex/dvips/ps2pdf 的方式來製作 pdf 檔，或者另外繪製後，利用 graphicx 巨集來引入獨立的圖檔。

所以，如果是要製作 pdf 檔案的話，那麼處理上會比較不方便，而且，如果又是中文的話，那麼所製作出來的中文 pdf 檔，以目前的 PDFLaTeX 的話，對於中文將會沒有 copy&paste&search 的功能。PDFTricks 雖然可以讓 pdflatex 使用 PSTricks，但他是利用了 TeX 系統引用作業系統 shell 的功能，這在非 Unix-like 的作業系統可能會出問題，而且他和 latex/dvipdfm[x] 的相容性並不是很好。如果製作的是英文文件，那倒是沒有關係，反而可以使用 PSTricks 的強大繪圖功能。

9.4.1 PSTricks 的組成巨集
PSTricks 除了主要的 pstricks 巨集外，另外還有其他的巨集，專門處理各種不同的特殊繪圖。例如：pst-node 及 ps-tree 可用來畫樹狀圖，pst-grad 可以表現漸層顏色，pst-poly 可以繪製多種的多邊形，pst-gr3d 可以畫 3D 格子圖。通常，一般用途的話，就是引用 pstricks，而他的繪圖環境是包在 pspicture 環境裡頭的，他的預設單位是 1cm，和 picture 環境的 1pt 不同：

  ...
\usepackage{pstricks}
  ...
\begin{document}
  ...
\begin{pspicture}(左下角座標)(右上角座標)
  這裡繪圖
\end{pspicture}
  ...
他的其他專用巨集並不會自動引用 pstricks，所以要自行引入後，再引用專用的巨集，另外，如果要使用顏色的話，由於 pstricks 對顏色的定義和 LaTeX 的巨集會有不相容的情形，因此，我們要引用 David Carlisle 另外寫的 pstcol 這個巨集來修正他。pstcol 會自動引用 color 及 pstricks 這兩個巨集，因此，除非要加入選項參數，引用了 pstcol 就不必引用 color 及 pstricks 了。pstcol 也可以引用和 color 一樣的參數，例如：

  ...
\usepackage[usenames,dvipsnames]{pstcol}
  ...
由於篇輻的關係，這裡不準備詳細介紹 PSTricks 的繪圖指令，但 TUGIndia(Indian TeX Users Group) 已經完成了相當不錯的 PSTricks 入門教材，請大家不要錯過：

http://sarovar.org/projects/pstricks/
http://www.tug.org.in/tutorials.html
9.4.2 PDFTricks 的使用
這個套件一般系統是沒有安裝的，請至 CTAN 下載，下載後解開，如果是在 Unix-like 系統，那執行 make 就可以了，否則請將 pdftricks.sty 拷貝至：

$TEXMF/usr/share/texmf/tex/latex/pstricks  或
$TEXMF/usr/share/texmf/tex/latex/pdftricks  請自行建立目錄
執行 texhash 或 mktexlsr
另外，將 pst2pdf 這個可執行檔，拷貝至執行路徑可及之處就行了。另請注意他的檔案格式，如果是在 Unix-like 系統，則要把他的檔案格式改為 Un*x 系統的規格。

PDFTricks 主要是把 PSTricks 巨集的引用，由 psinputs 環境包起來，而 pspicture 環境，則另外由 pdfdisplay 環境包起來，這樣就可以由 pdflatex 來編譯了。例如：

\documentclass{article}
\usepackage{pdftricks}
\begin{psinputs}
 \usepackage[usenames,dvipsnames]{pstcol}
 所有 pstricks 的巨集引用，都要被 psinputs 環境包起來
\end{psinputs}
  ...
\begin{document}
  ...
\begin{pdfdisplay}
\begin{pspicture}
  這裡依正常 pstricks 的指令繪圖
\end{pspicture}
\end{pdfdisplay}
  ...
\end{document}
這樣就可以由 pdflatex 直接編譯了。要非常注意的是，執行 pdflatex 時，後面要加上 -shell-escape 參數，這個功能，一般的 TeX 系統是關閉的，要打開來讓他可以由 pdflatex 執行當中，停下來等待外部指令的執行完畢後再繼續原來未完成的工作。不過，這個方式不保證能在 Windows 系統中正確執行。

這裡舉一個簡單的例子，同時說明如何使用 PSTricks、PDFTricks 及如何引入外部 gnuplot 製作的 picture 環境文稿的例子：

http://edt1023.sayya.org/tex/latex123/test-pstricks.pdf
http://edt1023.sayya.org/tex/latex123/test-pdftricks.pdf
http://edt1023.sayya.org/tex/latex123/test-pstricks.tex
http://edt1023.sayya.org/tex/latex123/test-pdftricks.tex
http://edt1023.sayya.org/tex/latex123/gnuplot-label.dem
最後一個 tar ball 是原始文稿。latex/dvips/ps2pdf 的編譯的方式如下：

gnuplot gnuplot-label.dem  => 產生 gp-test.tex picture 環境文稿
latex test-pstricks.tex
dvips -o test-pstricks.ps test-pstricks.dvi
ps2pdf test-pstricks.ps
pdflatex 的編譯方式如下，請不要忘了 -shell-escape 參數：

[gnuplot gnuplot-label.dem]  如果前面已製作好，這裡就不必執行了
pdflatex -shell-escape test-pdftricks.tex
關於這些在 LaTeX 繪圖的例子另請參考 Urs Oswald 所舉的例子及其說明：

http://www.ursoswald.ch/LaTeXGraphics/overview/overview.html
http://www.ursoswald.ch/LaTeXGraphics/overview/latexgraphics.pdf
從這些例子可以發現，picture 環境及 PSTricks 巨集的確是可以拿來繪製精美的圖形的。


9.5 MetaPost 使用簡介
MetaPost 除了可以直接繪圖，還可以做一些數學運算後把結果圖形化，所以不必如 picture 環境般的一筆一筆的畫上去，只要能整理出規律出來，就可以使用數學函數的方式來繪圖。在使用上和 picture 環境一樣，要有座標系的觀念。

9.5.1 如何編譯 MetaPost 圖檔文稿？
通常 MetaPost 文稿我們以 .mp 為他的延伸檔名，以便和其他檔案辨別，這個文稿使用任何一種編輯器編輯即可。在英文環境，編譯 MetaPost 文稿的方法可有兩種，中文環境的話，我們會在第 9.5.6 小節討論：

使用 mpost
這是最正統的方式。底下以 some.mp 為例，這裡假設裡頭只有一個圖檔，他的編號是 1：
mpost some.mp    % 產生 some.1 及 some.log
epstopdf some.1  % 產生 some.pdf 圖檔
some.1 就可以直接引入文稿中了。

使用 mptopdf
這會產生 pdf 格式的結果，以便給 pdflatex 來引用。其實這只是間接使用了 mpost，主要的編譯程式仍然是 mpost，只不過另外會自動去引用外部程式處理轉換成 pdf 格式的步驟而已。另外，他對字型的使用有做特別處理，因此如果圖檔裡頭有使用文字的話，可能 mptopdf 會處理的比較好。
mptopdf some.mp  % 產生 some.1 及 some-1.pdf
這樣也可以產生 some.1，及多出一個 some-1.pdf。但 mptopdf 所產生的 some.1 是真正的 eps 檔，可以直接由 gv/gsview 來閱覽，傳統 mpost 所產生的 some.1 則是使用 MetaPost 的字型表示法，所以 gv/gview 會無法正常閱覽。不過，引進 LaTeX 文稿則沒有什麼差異。

編譯結果的驗證方法
由於 mpost 編譯後的 eps 圖檔，gv/gsview 並不一定能閱覽，所以，我們要驗證他的編譯結果，除了引入文稿中外，還有一個標準的驗證方法：
tex mproof some.1 ... some.n  % 產生 mproof.dvi
dvips mproof.dvi              % 產生 mproof.ps
可以接受多個圖檔，看原來的文稿中有幾個圖檔，後面就接幾個圖檔，他會集中所有圖檔顯示在 mproof.dvi 當中，再利用 dvips/dvipdfm[x] 就可以產生 ps/pdf 檔來閱覽，他會加入各個圖檔的檔名及編號。

9.5.2 MetaPost 文稿的基本結構
在談到 MetaPost 文稿的結構前，我們先提一下 MetaPost 使用的度量單位，如果沒有標明的話，他預設是使用 big point(bp)，也就是 POSTSCRIPT 規格中所使用的單位，這和 TeX 本身是使用 printer point(pt) 不一樣。這裡我們所談的，主要是用於繪圖，至於他的巨集功能，這裡就不討論了。他的文稿結構如下：

% 和 TeX 一樣，註解是使用百分號
beginfig(n);
  這裡寫 MetaPost 的繪圖指令敘述，每個指令敘述以 ; 結尾
endfig;
bye;   % 這一行可以不必 ;。這是通知 mpost 程式跳出，結束繪圖，end 亦可。
其中的 beginfig(n) 的 n 可以是任何一個數目字，代表經 mpost 編譯過後所輸出的 eps 圖檔的延伸檔名，如果一次要處理多數圖檔，只要使用多個 beginfig...endfig 就可以了，但其內的數字則不可相同，以免圖檔被覆蓋。MetaPost 的指令和 TeX/LaTeX 不同的是前面沒有 \ 來起頭，而且每個敘述最後一定要加個 ; 來結束，否則編譯會出錯，例外是 beginfig、endfig 及 bye/end 這些指示可以不必使用 ; 來結束。

9.5.3 MetaPost 的九種基本資料型態
這些資料型態可以儲存固定的繪圖指令組或者是數學運算式，這樣的好處是，可以把一組複雜但又常重複的繪圖指令集或數學運算，宣告成幾個變數來代表，往後要用到時，就使用變數即可，可以讓 MetaPost 的程式碼寫起來更簡潔。

numeric
數值，他的大小要在 $ -$4096 與 4096 之間，中間的計算值也不能超過這個限度的 8 倍。一般宣告的例子如下：
numeric a, b, c, d; % 宣告 a,b,c,d 四個變數為數值型態
a := 9;
b := 3*a**2;
c := a++b;
d := c+-+b;
show a, b, c, d;    % 把計算結果顯示出來
bye
其中 3*a**2 代表 $ (3a)^2$，a++b 代表 $ \sqrt{a^2+b^2}$，c+-+b 代表 $ \sqrt{a^2-b^2}$。MetaPost 不支援科學計數表示法。這可以存成一個檔案，經由 mpost 編譯後會顯示計算結果，也可以由以下的方式來直接輸入計算：

edt1023:~$ mpost
This is MetaPost, Version 0.641 (Web2C 7.4.5)
**\relax
* => 變成一個星號時，就可以輸入各行敘述了
  ...
這裡要注意的是，numeric 型態不一定要事先宣告，可以直接使用，但宣告的用意是在消除前面的指定，也就是說，一經宣告就會消除以前所指定的值。所以，直接使用的變數，MetaPost 會把他當做是 numeric 型態。

pair
這是指平面座標值，各 pair 間可做四則運算。例如，我們指定9.3：
beginfig(1);
u := 1mm;         % 指定單位
pair a, b, c, d;  % 宣告四個 pair 形態的變數
a := (0, 0); b := (30u, 0); c := (30u, 30u); d := (0, 30u);
draw a--b--c--d--a;
endfig;
bye
這會繪製 30mm 長寬的正方形。也可以使用矩陣的方式來宣告，例如：

pair a[];   % 這等於宣告了 a0, a1, a2, a3...
pair a[][]; % 這樣宣告也可以，代表 a00, a01...,a12, a13...
path
有方向性的 pair 都可以是 path。例如：直線、曲線。
color
顏色，由 rgb 值所組成，例如：(0, 0, 0) 是黑色，(1, 1, 1) 是白色。預先定義好的顏色有:
顏色	rgb 值
black	(0, 0, 0)
white	(1, 1, 1)
red	(1, 0, 0)
green	(0, 1, 0)
blue	(0, 0, 1)
在 MetaPost 使用顏色比在 LaTeX 裡頭方便多了，各種顏色的表示，除了原來的 rgb 值的表示法外，也可以在各種預先定義好了的顏色加上其深淺度，例如：

withcolor .6red;
withcolor .5white;
color A;          % 宣告 A 為 color 型態的變數
A := (.3,.8,.2);  % 指定 A 的顏色
withcolor A;      % 使用顏色 A
string
字串，在 MetaPost 中，字串可能兩種情形，一種是單純的字串，以 " 框起來即可，另外一種是由 btex 及 etex 包住的字串，這些字串，MetaPost 並不去處理，而是交給 tex 去處理。
通常，我們常常需要把計算出來的數值結果標示在圖上，這時要把他轉換成字串的型態才能標示上去，我們可以使用 decimal() 函數來轉換。因為我們不能把變數值放在標註指令內，否則他將無法進行運算。例如：

u := 1cm;
for i=0 upto 10:
  label.top(decimal(i/10), ((i+1/2)*u,1u));
endfor;
這時，變數尚未計算出來，因此不能當做 label.top() 的參數，需要在結果計算出來後，馬上進行轉換成為字串型態。

boolean
布林值。
picture
任何可以由 MetaPost 繪出來的圖形，皆可宣告成 picture 變數。
pen
畫筆。
transform
轉換。
9.5.4 MetaPost 常用的指令及函數
MetaPost 的指令，基本上可分成兩大類，繪圖指令（picture command）及標籤指令（label command）。繪圖指令用於繪圖，例如 draw、fill 等等；標籤指令則用於標註文字，例如 label、dotlabel 等等。繪圖指令後面可以再接附加指令（addto command）及修整指令（clip command），例如 withcolor、withpen、clip...to 等等，附加指令及修整指令都是可以省略的；標籤指令接的則是要標註的文字及其位置，這些則不能省略。整體的語法結構算是很緊密的結合在一起，所以這裡就不完整列出來了，但實際使用則還算口語化，從實際例子去熟悉用法，可能會比較容易進入狀況。

畫線（draw-）
由 draw 指令來開始畫圖，各座標值（pair）由兩個 hyphen（就是鍵盤上的減號）- 來連接各個 pair，這就會構成直線，最後連接至 cycle 的話，就會形成封閉區域的的各種形狀的「框」。有附加指令的情形，例如：
pair a, b, c;
a := (0, 0); b := (1cm, 0); c := (0, 1cm);
draw a-b-c-cycle withpen pencircle scaled 1bp
     withcolor .8white dashed withdots;
棕色的部份就是附加指令，他的意思是設定線條的粗細為 1bp（預設值是 0.5bp），使用的顏色是灰色，並且是虛線，附加指令可以省略全部或一部份的敘述。如果附加指令的部份會使用二次以上的話，也可以將他固定下來，這樣就不必每 draw 時都要去指定，例如：

pair a, b, c;
a := (0, 0); b := (1cm, 0); c := (0, 1cm);
pickup pencircle scaled 1bp;                        % 固定線條粗細
draw a--b--c--cycle withcolor .8white dashed withdots;
設定 draw 預設值（drawoptions()）
如果我想更進一步的設定 draw 的預設值，我們可以使用 drawoptions() 函式，例如前面的例子，可以設成：
pair a, b, c; 
a := (0, 0); b := (1cm, 0); c := (0, 1cm);
drawoptions(withpen pencircle scaled 1pt dashed withdots withcolor .8white);
draw a--b--c--cycle;
要注意的是，如果有標註文字，這會連圖上的標註文字也使用所指定的顏色。

畫弧線（draw..）
和畫直線完全相同，只是把兩個 hyphen 換成兩個句點 .. 來連接各個 pair。
畫箭號（drawarrow, drawdblarrrow）
和 draw 指令的用法一樣，只是改成 drawarrow（單箭號）及 drawdblarrow（雙箭號）。
畫虛線
在畫線指令後附加上 dashed evenly 或 dashed withdots 即可。這是屬於附加指令的敘述。我們也可以由 dashpattern() 來自行定義虛線的形式，例如：
pair a, b, c; 
picture dptn;
a := (0, 0); b := (1cm, 0); c := (0, 1cm);
pickup pencircle scaled 1bp;                        % 固定線條粗細
dptn := dashpattern(on 6bp off 2bp on 2bp off 2bp); % 指定 dash 的形式
draw a--b--c--cycle withcolor .8white dashed dptn;
dashpattern 的部份，on 表示會顯示出來的線段，off 表示不顯示出來的空白。預設指定的形式是：

evenly   := dashpattern(on 3 off 3);
withdots := dashpattern(off 2.5 on 0 off 2.5);
這裡的 evenly 及 withdots 就是屬於 picture 型態的變數。

填色
使用 fill 指令來代替前面的畫線指令，後面要加個 withcolor 的指令來指定顏色，否則會填入黑色。要注意的是，fill 必須是封閉區域才有意義，因此，連接 pair 時最後一定要使用 cycle 把區域封閉起來。
要注意的是，他僅僅著色，不畫線框，要畫線框要另外由 draw 指令來畫。或者改用 filldraw 指令，這樣可以既畫框又填色，只不過，這樣一來都是同一種顏色了，如果框線和所填的顏色要不一樣，就得經過 draw 及 fill 兩道手續。

畫圓
draw 後附加個 fullcircle，這畫的是正圓。也可以畫其他種類的圓：
圓的種類	指令
完整正圓	fullcircle
四分之圓	quartercircle
半圓	halfcircle
draw fullcircle scaled 1cm  % 圓心 (0, 0)，直徑 1cm 的圓
draw fullcircle scaled 1cm shift (x, y)  % 圓心平移至 (x, y)
draw fullcircle xscaled a yscaled b  % 長短軸各為 a, b 的橢圓
前面曾出現的 with... 附加指令都可以使用。其他如半圓、四分之一圓的使用方法相同。

畫方框（unitsquare）
前面曾學過由畫線連起來可以畫正方形，但畫方框有更簡單的方式，那就是使用 unitsquare 附加指令，例如：
draw unitsquare scaled 1cm;  % 左下角是 (0, 0)，寬高 1cm 的正方形
draw unitsquare scaled 1cm rotated 30;    % 將正方形逆時針旋轉 30 度
draw unitsquare xscaled 2cm yscaled 1cm;  % 寬 2cm，高 1cm 的矩形
而且，也可以使用 shift(x, y) 來平移左下角座標的位置。

標註文字（label, dotlabel）
我們先把標註文字時的位置弄清楚，再來看怎麼標註上去：
 	top（正上方）	 	 	ulft（左上角）	 	urt（右上角）
lft（左）	$ \bullet$	rt（右）	 	 	$ \bullet$	 
 	bot（正上方）	 	 	llft（左下角）	 	lrt（右下角）
由其中的英文字縮寫，應不難明白他們的意思。中央的黑點，代表標註文字時所給的座標位置。所以，我們的文字可以標示在一個定點的八個方位。例如：

label.bot("O(0,0)", (0,0));    % 在原點正下方標示 O(0,0) 字樣
dotlabel.bot("O(0,0)", (0,0)); % 和 label 一樣，但會有個粗黑點
label.bot(btex $O(0,0)$ etex, (0,0));   % O(0,0) 字樣經由 \TeX\ 排版
dotlabel.bot(btex $O(0,0)$ etex, (0,0));
由 " 包圍的，他的文字是由 MetaPost 自行處理，就是一般的文字表現，但由 btex...etex 包圍的，則會交給 TeX 去排版，例如這裡進入數學模式，就會以數學斜體來排版。

這裡舉一個簡單的例子，rgb 三原色及灰階的漸層演色表，順便使用了我們沒有提到的 for loop9.4及調整字型大小的方法（這些會特別用底線標示出來）。

% test-mpcolor.mp
beginfig(1);
defaultscale := 12pt/fontsize(defaultfont); % 使用 12 點字
u := 1cm;
path sqr;
sqr := unitsquare scaled u;
for i=0 upto 10:   % for loop 迴圈，請注意這裡是冒號
  label.top(decimal(i/10), ((i+1/2)*u,1u));
  fill sqr shifted (i*u, 0) withcolor i*0.1red;
  fill sqr shifted (i*u, -1.2u) withcolor i*0.1green;
  fill sqr shifted (i*u, -2.4u) withcolor i*0.1blue;
  fill sqr shifted (i*u, -3.6u) withcolor i*0.1white;
endfor;
label.lft("r", (0,.6u));
label.lft("g", (0,-.6u));
label.lft("b", (0,-2u));
label.lft("gray", (0,-3u));
endfig;
bye
由 mptopdf 執行的結果如下：

http://edt1023.sayya.org/tex/latex123/test-mpcolor.mp
http://edt1023.sayya.org/tex/latex123/test-mpcolor-1.pdf
9.5.5 和 LaTeX 的配合
MetaPost 主要是用在 TeX 文稿，但由於他可以引入 TeX 巨集，也因此表示可以把 LaTeX 的一些指令及巨集引進去，這樣，編譯的時候，該呼叫 tex 的，就會改呼叫 latex。當然，這也表示，我們可以使用 CJK 環境來書寫中文了。

通常會要呼叫 tex 及 latex 的場合，就是要使用他們的排版功能，主要是用於排文數字，可以加入一般的文字，經過 TeX/LaTeX 排版後的漂亮結果，也可以是高品質的數學式子。

加入文數字
只要是包在 btex...etex 裡頭的文數字都會交給 TeX 去排版。當然，僅僅使用 " 包住也是可以，但就不經過 TeX 處理了。
LaTeX 的情形
要使用 LaTeX 要經過一些處理，因為 MetaPost 預設是把排版交給 tex 去編譯的，這時要把所需要用到的 LaTeX 巨集及指令包在 verbatimtex...etex 當中，例如：
verbatimtex
%&latex         % 指示由 latex 編譯，而不是預設的 tex
\documentclass{article}
\usepackage{some,packages}
\begin{document}
etex
  ...
verbatimtex     % 以下這段通常不必，但如果有引入其他環境時則不可省略
\end{document}  % 這段放在文稿最後即可
etex
這樣一來，包在 btex...etex 之間的文字就可以使用 LaTeX 指令去排版，而 mpost 也會交給 latex 去處理文字的部份。


9.5.6 在 MetaPost 中使用中文
MetaPost 文稿中，重點當然是畫圖，但是，有時也是要加入一些文字，這在英文是很方便，但在我們的 Big-5 中文就很頭大了，這裡我們使用了一個小工具 b5mp.pl，這個工具主要是引用王佑中[7]先生的 clatex 中的一個函式，把會出問題的 Big-5 中文處理好。然後，我們再加入必要的 LaTeX 及 CJK 環境的結構，最後呼叫 mpost 來編譯他，這個小工具是由 perl 寫的，可以在此下載：

http://edt1023.sayya.org/tex/latex123/b5mp.pl
他的使用方法很簡單，把他當成是 mpost 即可，使不使用 .mp 延伸檔名都沒有關係。如果 fontname 沒有指定，那麼預設是 aming：

b5mp.pl [fontname] your[.mp] => 這樣會產生 your.1 (視圖檔內的編號而定)
perldoc b5mp.pl              => POD 格式的 b5mp.pl 使用說明
這個 your.1 就可以被引進 LaTeX 文稿裡頭去了。由於這個編譯出來的 eps 檔，含有中文字型資訊，所以 gv 及 gsview 都會無法閱覽，epstopdf 也是無法處理，我們可以使用以下的方法來「預視」：

tex mproof your.1      => 這會產生 mproof.dvi
dvips mproof.dvi       => 產生 mproof.ps
或
dvipdfm[x] mproof.dvi  => 產生 mproof.pdf
這樣就可以去預視了。當然，你的 LaTeX 系統要安裝好 CJK 套件，否則還是會認不得這些中文字型資訊的。mptopdf 除非另做些修改，否則在中文的場合會無法正常使用。我們這裡就綜合舉一個例子：

% test-yi.mp
beginfig(1)
u:=3cm;
path p;
p=(0,1u)..(1u,0)...(0,-1u);
fill p{dir(157)}..(0,0){dir(23)}..{dir(157)}cycle;
draw p..(-1u,0)..cycle;
fill (0,-.6u)..(0.1u,-.5u)..(0,-.4u)..(-.1u,-.5u)..cycle withcolor white;
fill (0,.6u)..(.1u,.5u)..(0,.4u)..(-.1u,.5u)..cycle;
label.bot(btex \Large 仿太極陰陽魚圖 etex,(0,-1.2u));
endfig;

beginfig(2)
a=.7in; b=0.5in;
z0=(0,0); z1=(a,0); z2=(0,b);
z0=.5[z1,z3]=.5[z2,z4];
draw z1..z2..z3..z4..cycle;
drawarrow z0..z1;
drawarrow z0..z2;
label.top(btex \small 橫軸 $x$ etex, .5[z0,z1]);
label.lft(btex \small 縱軸 $y$ etex, .5[z0,z2]);
label.bot(btex \Large 許功蓋測試 etex,(0,-.7u));
endfig;
end;
這裡頭有兩張圖，都有使用到中文，所以我們要使用 b5mp.pl 來代替 mpost 來編譯：

b5mp.pl akai test-yi  % 使用 akai 字型，並產生 test-yi.1 及 test-yi.2
tex mproof test-yi.1 test-yi.2  % 產生 mproof.dvi
dvips mproof.dvi                % 產生 mproof.ps
dvipdfmx mproof.dvi             % 產生 mproof.pdf
編譯好的例子如下：

http://edt1023.sayya.org/tex/latex123/test-yi.mp
http://edt1023.sayya.org/tex/latex123/mproof.pdf
現在我們再來看看 LaTeX 文稿中要如何引用：

% example28.tex
\documentclass{article}
\usepackage{graphicx,CJK,mflogo}
\parindent=0pt
\ifx\pdfoutput\undefined
  \DeclareGraphicsRule{*}{eps}{*}{}
\else
  \DeclareGraphicsRule{*}{mps}{*}{}
\fi
\begin{document}
\begin{CJK}{Bg5}{hwmm}
這是一個 \MP\ 文稿中使用中文的例子，經由 {\tt b5mp.pl} 編譯後引入
\LaTeX\ 文稿當中。圖中的「太極陰陽魚」字樣是 \MP\ 文稿中就有，
不是這裡鍵入的。但其實圖檔裡頭並沒有真正的字型，而是引入文稿，
經 {\tt latex} 編譯後，才「合作」真正產生的。

\vspace{10ex}

\begin{figure}[h]
\centering
\includegraphics{test-yi.1}
\caption{太極生兩儀}
\end{figure}

\vspace{10ex}

\begin{figure}[h]
\centering
\includegraphics{test-yi.2}
\caption{英文字是數學斜體}
\end{figure}
\end{CJK}
\end{document}
編譯好的例子如下：

http://edt1023.sayya.org/tex/latex123/example28.tex
http://edt1023.sayya.org/tex/latex123/example28.pdf
9.5.7 更多的 MetaPost 的實例
這裡只是簡單的介紹了 MetaPost，實際要用的話，複雜一點的圖形，可能會不太足夠，Knuth 教授的 The Metafontbook，這應該最詳細的資料了，其中有些地方會和 MetaPost 不一樣，但整個結構上是相同的，可和系統上就有的 mpman.ps 這個 MetaPost 作者 John D. Hobby 寫的使用手冊相互參照就可以清楚不同的地方。

關於 MetaPost 更多的例子，也另請參考 André Heck 所寫的 Learning MetaPost by Doing 及 Urs Oswald、Vincent Zoonekynd 所舉的實例及其解說，examples.zip 檔是 metapost.html 網頁的原始碼，收錄在 CTAN 中：

http://remote.science.uva.nl/~heck/Courses/mptut.pdf
http://www.ursoswald.ch/metapost/tutorial.pdf
http://tex.loria.fr/prod-graph/zoonekynd/metapost/metapost.html
ftp://ctan.unsw.edu.au/tex-archive/info/metapost/examples.zip
http://www.topology.org/tex/conc/mp/mp.zip
最後一個 mp.zip 是 Alan U. Kennington 所著 differential geometry reconstructed: a unified systematic framework 一書中使用 MetaPost 繪圖的實例原始碼。


9.6 圖形的引入
這裡我們使用 graphicx package 來說明，他會自動引入 graphics package，這兩個 package，主要是一些指令的參數用法不同，由於 graphicx 的參數用法彈性較大，而且也和 LaTeX 的一些參數的形式較符合，因此，我們就以 graphicx 來說明，引入巨集時就引用 graphicx 就可以了。這一節所說的是外來的圖檔及 MetaPost 圖檔，而非由 picture 環境或 PSTricks 巨集所繪製的圖檔。

9.6.1 引入外來圖檔的方法
講繪圖工具講了老半天，到底有了圖檔，要如何引進文稿裡頭呢？就是使用 graphicx package 的 \includegraphics 指令：

  ...
\usepackage{graphicx}
  ...
\begin{document}
  ...
\begin{figure}                       % 進入浮動環境
\includegraphics[選項參數]{圖檔名稱}
  ...
\caption{這裡加入圖的標題}           % 圖號會自動編號
\label{這裡加入引用圖檔時的文字標誌} % 一定要在 caption 之後
\end{figure}
  ...
這樣就行了，就這麼簡單！不使用浮動環境也是可以的。通常目前的 graphicx 巨集會自動判斷圖檔格式，所以延伸檔名可以不必寫上。但如果引入的圖檔是 MetaPost 所產生的，那要附上延伸檔名，通常是數目字，例如 some-graphic.1，但這在 pdflatex 可能會有誤認檔案格式的情形發生，所以，要讓他知道這是 MetaPost 所產生的 mps 圖檔。因此，如果文稿中有引用 MetaPost 的圖檔，最保險的方式是：

\documentclass{article}
\usepackage{graphicx}
\ifx\pdfoutput\undefined
  \DeclareGraphicsRule{*}{eps}{*}{}
\else
  \DeclareGraphicsRule{*}{mps}{*}{}
\fi
\begin{document}
  ...
\includegraphics{mpost-image.1}
  ...
\end{document}
有一個 ifpdf 巨集，做的也是同樣的事情。這樣的話，使用 pdflatex 編譯時會把認不得的圖檔，當做是 mps；而使用 latex 編譯時，會把認不得的圖檔，當做是 eps。另外一個方法，就是把 *.1 改延伸檔名為 *.mps，這樣 latex/pdflatex 都會認得他。

也可以在引用 graphicx 時加入檔案格式選項參數，指定圖檔格式，但這裡不建議這麼做，這樣有可能會使用文稿的彈性降低，如果不想改來改去，比較理想的方式是去修改 graphicx 的相關設定檔，但一般使用者恐怕也是搞不清楚這些設定檔要如何編修，因此還是使用條件式的判斷來暫時解決這個問題。

如果圖檔中有 jpeg/png 圖檔，這在 latex/dvips 是無法處理的，可使用 convert 把他轉成 eps 格式。在這種情形下，如果要讓 latex/pdflatex 都能正常運作的話，可能要準備兩種格式（eps/pdf）的圖檔了，然後，圖檔名稱不指定延伸檔名，讓執行程式各取所需。

有時使用圖檔時如果會有無法判斷 BoundingBox 值的情形，在這種情形下，可以使用 dvipdfm 所附的 ebb 這支小工具來產生必要的 BoundingBox 值。

9.6.2 includegraphics 指令的選項參數
我們還沒談到 \includegraphics 選項參數的部份。這個選項參數很多，功能很強大。這些選項參數可以有多個，各選項間以逗點來分隔，他的值的設定是使用等號（請注意，我們這裡談的是 graphicx 巨集，而不是 graphics，這在參數使用上不同）。

bb
設定圖檔的邊界（bounding box），含四個值，每個值以空白隔開。例如 bb=98 98 468 430，這個意思就是左下角的座標是 (98, 98)，而右上角座標是 (468, 430)，這個參考標準是可被印出紙張的左下角為 (0, 0)。請注意，如果沒有指定單位的話，那預設是 bp。而且，這個設定在 pdflatex 會不被接受，此時請改使用 trim 選項參數。
通常，這是會加上 clip 參數，作用是在修剪引入的圖檔的四周，但不是很好控制，所以建議圖檔由圖形處理或轉換程式去處理過後再引入會比較好控制。不加 clip 參數，加個星號 \includegraphics* 作用是一樣的。

一般如果是 eps/ps 檔，可以使用編輯器去修改他的 BoundingBox 值，無需用到這些不好控制的參數，如何抓到座標值呢？使用 gv 或 gsview 把圖檔載入後，將游標置於圖中所要的位置，這些軟體就會顯示所在處的座標，然後就可以依自己需要去修改他了。

clip
修剪圖的四周指定的邊緣。
trim
作用和 bb 一樣，也是四個參數，但這裡指的是要去除的部份長度值，而非相對於左下角的相對座標。這個參數可以用在 pdflatex。例如：
\includegraphics[trim=7 7 7 7, clip]{some}
這會除去 some 這個圖檔的四周 7bp 的寬度。請注意，圖檔盡量不要加延伸檔名，讓系統自己去判斷，這樣文稿會比較有彈性。

angle
旋轉的角度。旋轉指的是逆時針的方向轉的，除非使用負數的角度。
orgin
旋轉的中心點。
width
這是指圖形的寬度，會自動伸縮調整，長度亦會等比例調整。
height
這是指圖形的高度，會自動伸縮調整，寬度亦會等比例調整。
totalheight
這是指圖形的總高度，即 height 再加上 depth 的值。會自動伸縮調整，寬度亦會等比例調整。
scale
按一定比例縮放，這沒有單位，這是縮放倍數。
9.6.3 指定圖檔的搜尋路徑
如果圖檔很多，一個比較方便的方法就是在目前工作目錄下，新開一個子目錄來專門置放圖檔，這樣在文件的維護上也會比較好維護。他的語法如下：

\graphicspath{{路徑一}{路徑二}{路徑三}...}
\graphicspath{{images/}}  % 縱使只有一個子目錄，也不可省略大括號
\graphicspath{{:images:}} % Mac 系統的表示法
LaTeX 系統預設找圖檔的路徑是 TeX 預設會去找的路徑及目前的工作目錄（通常目前的工作目錄會先找）。或者，也可以修改 TEXINPUTS 變數的值（會較有效率，也較省記憶體），例如，以 unix-like 系統下的 sh shell 為例：

TEXINPUTS = "images/:" ; export TEXINPUTS
這樣會首先搜尋目前工作目錄下的 images 這個子目錄，找不到的話，才會去 TeX 預設的搜尋目錄去找，這樣一來就會很有效率，而且會較省記憶體。所以，這個方法比較建議使用。

當然，也可以直接在 \includegraphics{} 的參數裡頭就直接把路徑寫進去，但這是最不建議的方法，不管效率或是文稿可攜性都會很差。


9.6.4 圖文的旋轉
我們常常會需要某些圖文在特別的情況下旋轉一下，\rotatebox 這個指令，其實我們前面舉的例子當中就曾使用過，我們現在來看看詳細的使用方法：

\rotatebox[選項參數]{角度}{圖文物件}

角度和 \includegraphics 的 angle 選項參數一樣，但使用方法則簡化了，直接寫上數值即可，當然預設是逆時針方向旋轉。選項參數的部份可以有三個小選項：

origin
設定旋轉中心點的位置，可以使用 lrctbB 或其中兩個的組合，其中 B 代表的是基線（baseline），其他的依其英文字母就可理解他的意義，如 t 是 top，r 是 right，c 是 center。預設的位置是左下角，文字的話，則是左下角的參考點（reference point），旋轉就是以此點所構成的的軸心線來轉的。
x, y
這是以左下角為原點，直接設座標，來表示 origin 所能表現的更精確中心點位置。
units
設定旋轉的特殊弧度。其中 units=-360，這樣會把預設的逆時針旋轉，變成順時針旋轉。
旋轉不限於簡單的圖文物件，甚至一整個表格、圖形環境都可以拿來轉。要注意的是，編譯成 *.dvi 檔的話，有可能 dvi viewer 會不支援旋轉效果的解讀，此時要把他由 dvips 來轉成 ps 檔，或直接使用 pdflatex 編譯成 pdf 檔，再來預視。

9.6.5 圖文的縮放及延展
\scalebox{水平縮放倍數}[垂直縮放倍數]{圖文物件}
垂直縮放倍數可以省略，省略時代表等於水平縮放倍數。
\reflectbox{圖文物件}
這其實是 \scalebox{-1}[1]{圖文物件} 的意思，會得到鏡射的效果。
\resizebox{寬度}{高度}{圖文物件}
\resizebox*{寬度}{總高度}{圖文物件}
這是在改變原圖文物件的大小。寬高使用 ! 代替的話，會依另一個值做同比例的改變。如果加個星號，如 \resizebox*{}{}{}，他的作用是會把深度（depth，基線以下的稱為深度，基線以上的稱為高度 height，兩者之和稱為總高度，totalheight）也考慮進去，否則只考慮高度，但深度不一定會有，這時 height 就等於 totalheight。基線、深度等術語的意義，請複習一下第 3.3.1 小節，頁 [*]。
我們在表格及圖形的章節裡花了比重不少的篇幅，主要的用意是想打破 LaTeX 所能使用領域的刻板印象，個人還覺得這些內容實在還不夠，但要硬塞入這篇入門級的文件，已經不恰當，時間、能力允許的話，希望將來有機會另外專文來做更詳細一點的介紹。