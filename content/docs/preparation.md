---
title: 第 02 章：行前準備
type: docs
---

# 2. 行前準備

使用 {{< katex >}}\TeX/\LaTeX{{< /katex >}} 系統，剛開始，比較麻煩的是安裝問題。不過，以現在的作業系統而言，幾乎較流行的作業系統都有現成包好的 {{< katex >}}\TeX{{< /katex >}} 系統套件可以安裝，例如 Un*x 系統的 teTeX、Windows 系統的 MiKTeX 及 fpTeX。另外，也有 [TeX Live CD](http://tug.org/texlive/) 可以供下載、購買，這是 [TUG ({{< katex >}}\TeX{{< /katex >}} User Group)](http://www.tug.org/)[^TUG]製作的各種作業系統的可執行檔，使用上相當方便。

目前所謂的 {{< katex >}}\TeX{{< /katex >}} 套件，是把原來的 {{< katex >}}\TeX{{< /katex >}} 排版引擎本身，加上 {{< katex >}}\LaTeX{{< /katex >}} 及其他相關的巨集，再加上字型軟體（Metafont）、繪圖程式（MetaPost）、字型檔……等等，所組合成的一整個可實際運作的排版系統。因此，什麼是 TeX？會因使用的場合不同而有不同的意義，一般純指指令本身的時候，就單純寫成小寫的 `tex`，此時所用的巨集，預設就是 Knuth 教授所寫的 plain {{< katex >}}\TeX{{< /katex >}}。寫成 {{< katex >}}\TeX{{< /katex >}} 時，一般是指整個系統而言。這在 {{< katex >}}\LaTeX{{< /katex >}} 巨集亦同，`latex` 指的是指令，{{< katex >}}\LaTeX{{< /katex >}} 指的是整個巨集系統。

## 2.1 Unix-like 系統

一般 Unix-like 系統都是安裝 teTeX 套件，凡是和 tetex 字樣相關的 packages 都安裝起來，目前 GNU/Linux 各種 distribution 及 FreeBSD 都有現成的 packages 供安裝使用。如果是沒有提供這個套件的作業系統，可能得自行編譯了，原始碼在：

- http://www.tug.org/teTeX
- ftp://cam.ctan.org/tex-archive/systems/unix/teTeX
- ftp://tug.ctan.org/tex-archive/systems/unix/teTeX
- ftp://dante.ctan.org/tex-archive/systems/unix/teTeX

## 2.2 MS Windows 系統

最常使用的 free 版本，大概就是 MiKTeX 及 fpTeX，其中，後者等於是 Un*x 中的 teTeX 的 Windows 移植版本。

- http://www.miktex.org/
- http://www.fptex.org/

安裝的話都自動化了，應該可以很方便的安裝起來。

### 2.2.1 cygwin 環境

這是 Windows 系統下的一個 Un*x 環境（正確的說，是 Linux-like），有了這個環境就可以使用 Unix-like 的界面，也可以編譯 Unix-like 中的程式，當然也就可以安裝 Unix-like 系統的 teTeX 套件了，有人習慣了 Unix-like 的操作環境，但又常需要在 Windows 平台下作業，這是個不錯的選擇。

- http://sources.redhat.com/cygwin
- http://sources.redhat.com/cygwin/setup.exe

只要先下載 `setup.exe` 這個可執行檔，然後執行後按著指示就可以完成安裝，當然，網路要連線。至於 teTeX 相關的套件，安裝好 `cygwin` 就會安裝，至於中文 CJK 套件，感謝 seventeen 的製作，請參考：

- http://seventeen.mit.edu/blog/17/archives/000141.html

## 2.3 Mac OS X 系統

個人對 Mac OS X 並不熟悉，所以僅提供個人知道的 distribution。但 Mac OS X 亦可以安裝 Un*x 系統上的 teTeX 系統，也可以在其上自行編譯。

參考文件：
[文件]MacOS 10.2.4安裝teTeX
http://www.rna.nl/tex.html
http://www.cs.wright.edu/~jslater/mac-tex/mac-tex-intro/mac-tex-intro.pdf
TeXShop
http://www.uoregon.edu/~koch/texshop/texshop.html
iTeXMac
http://itexmac.sourceforge.net/

## 2.4 商業維護的 TeX/LaTeX 系統

上面所提到的都是 free 的版本，縱使是 TeX Live CD，雖也可以讓非 TUG 會員訂購，但他們的 iso 是可以自由下載，不一定要花錢買。當然，這裡是鼓勵大家加入會員或花點小錢購買，也算是贊助他們繼續維護好品質的 {{< katex >}}\TeX{{< /katex >}} 系統。另外，亦有商業維護的 {{< katex >}}\TeX/\LaTeX{{< /katex >}} 系統，雖然要花錢，但功能上可能會比較符合特別的需要，而且有比較完整的售後服務方案：

- TrueTeX	http://www.truetex.com/	Windows
- TurboTeX	http://www.truetex.com/	Un*x, DOS, Windows
- Y&Y TeX	http://www.YandY.com/	Windows
- pcTeX	http://www.pctex.com/	Windows
- VTeX	http://www.micropress-inc.com/	Windows, Linux, OS/2
- Scientific Word	http://www.sciword.demon.co.uk	Windows
- Textures	http://www.bluesky.com/	Macintosh
- OzTeX	http://www.trevorrow.com/oztex/	Mac OS X
- Scientific Assistant	http://www.advanced-science.com/	Mac OS X

## 2.5 選個順手的編輯器

{{< katex >}}\TeX/\LaTeX{{< /katex >}} 本身並不內附編輯器，這和許多排版軟體不一樣，他只專注在排版的過程，原始文稿是如何產生的並不插手干涉，這樣子的自由度很大，每個人都可以選用適合他自己的編輯器，但和目前一般的幕前排版系統比較的話，會讓初接觸的朋友不知所措，因為他不曉得要如何使用 {{< katex >}}\TeX/\LaTeX{{< /katex >}} 來「編輯」原始文稿！

當然，有些 {{< katex >}}\TeX/\LaTeX{{< /katex >}} 的發行版本，乾脆就弄了個編輯器，把編輯器和排版系統本身連接起來，這樣是很方便，但有很大的可能又得花時間學習另一種不熟悉的編輯器操作。本文的說明，不準備被編輯器給綁住，你愛用什麼編輯器就用什麼編輯器，讓我們專心在排版過程本身吧！

以下僅簡單介紹和中文相容的編輯器。當然，只要使用順手的編輯器都可以拿來用。原則上，剛開始接觸 {{< katex >}}\LaTeX{{< /katex >}}，個人是建議從命令列開始瞭解起，等整個流程有個概念後再來使用一些方便的編輯器上的巨集及按鈕設定，不然，有時編輯器上的設定有問題時，會不知道從何改起。至於編輯器的操作，請自行參考各編輯器的說明文件或網路上的教學文件，這裡就不多談了。

### 2.5.1 Vim

這有各種平台的版本可以下載：
http://www.vim.org/
可以配合 vim-latex suite 來使用：

http://vim-latex.sourceforge.net/

### 2.5.2 GNU Emacs/XEmacs

這也是有各種平台的版本，也可以配合 [AUCTeX](http://www.gnu.org/software/auctex/) 來使用，相當方便，這也是 Knuth 教授本身所愛用的編輯器：

http://www.gnu.org/software/emacs/emacs.html
http://www.xemacs.org

### 2.5.3 NEdit

這也可以配合 AUCTeX 來使用，但只有 Un*x 系統的版本：

http://nedit.org

### 2.5.4 WinEdt

這是 shareware，只有 Windows 版本：

http://home.istar.ca/~winedt

### 2.5.5 UltraEdit

這也是 shareware，也是只有 Windows 版本。

http://www.ultraedit.com

### 2.5.6 Kile

這是很方便的 {{< katex >}}\LaTeX{{< /katex >}} 圖形界面整合環境，還可叫出繪圖軟體來繪圖，如果其他作業系統也有安裝 Qt/KDE 的話，也是可以編譯安裝使用：

http://kile.sourceforge.net/

[^TUG]: 加入會員的話，只要些許會費，則可以獲得 TeX Live CD 及年報資訊的寄發。