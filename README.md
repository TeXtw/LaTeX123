
## 編譯需求（Requirement）

1. 你需要安裝 TeX/LaTeX 排版系統，並且需要安裝 CJK 巨集套件及其字型，另外需要 `LaTeX2HTML`，你可以參考以下連結。  
You need TeX/LaTeX install on your system. And need CJK package/fonts and `LaTeX2HTML`. You can refer to the links below.

    http://edt1023.sayya.org/tex/mycjk.html
    http://MathNet.math.tku.edu.tw/~edt1023/tex/mycjk.html

2. 你可以在以下網頁找到最新版本的 CJK 巨集套件  
You can find the new version of CJK package on the link below.

    http://cjk.ffii.org/

3. 你可以在以下站點找到一些有用的中文字型  
You can find some useful free Chinese fonts from the CLE Project.

    ftp://cle.linux.org.tw/pub/fonts/

4. 我們使用 Roland Bless 的 `ps2eps` 來將 `.ps` 檔轉成 `.eps` 檔  
And need Roland Bless's `ps2eps` to convert `.ps` to `.eps`.

    http://www.ipv6.tm.uka.de/~bless/ps2eps

5. 我們使用 ImageMagick(convert) 來轉換圖檔格式  
We use ImageMagick(convert) to convert the format of images.

    http://www.imagemagick.org/

6. 原始碼中有一個 `gnuplot` 的例子，因此你會需要 `gnuplot`  
There has a `gnuplot` example, so you will need `gnuplot`.

    http://www.gnuplot.info/

## 文件編譯（Compile）

```
make         -  建立 latex123.pdf
                build latex123.pdf
make exam    -  建立 pdf 格式的實例。
                build pdf format of examples
make html    -  建立 HTML 格式版本(需要 LaTeX2HTML)
                build HTML version(need LaTeX2HTML)
make htmltar -  建立 HTML tarball
                build HTML tarball.(broken)
make tar     -  建立原始碼 tarball
                build source tarball.(broken)
make clean
```

你可以忽略編譯時的錯誤訊息。

由於中文的搜尋、拷頁的功能，我使用 `dvipdfmx` 來產生 PDF 格式檔。如果你要使用 `pdflatex/dvips` 來編譯這個原始碼，請修改 `Makefile` 及 `latex123.tex` 來適合你的需求。

You can ignore the error messages.

I use `dvipdfmx` to produce PDF file, because of the search & copy of Chinese text. If you want use `pdflatex/dvips`, please change the `Makefile` and `latex123.tex` to fit your need.


## 聯絡作者（Contact）

```
Edward G.J. Lee
李果正
edt1023@info.sayya.org
edt1023@MathNet.math.tku.edu.tw
```