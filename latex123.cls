% --------------------------------------------------
% 01 類別宣告（Class Declaration）
% --------------------------------------------------

% 告知編譯器當前的 LaTeX 版本
% Must indicate what's the release of LaTeX we are using.
\NeedsTeXFormat{LaTeX2e}

% 定義類別名稱與敘述
% Define the name and description of class.
\ProvidesClass{latex123}[2020/12/01 v2.0 LaTeX123]

% --------------------------------------------------
% 02 基礎設定（Basic Settings）
% --------------------------------------------------

% [引入套件]
% Include required packages for basic settings.

\RequirePackage{kvdefinekeys, kvsetkeys, kvoptions}
\RequirePackage{iftex}
\RequirePackage{ifthen}

% [定義變數]
% Define essential variables.

% 變數: 路徑
% Variables: Path
\newcommand{\cls@path@font}{./fonts/english/}
\newcommand{\cls@path@cjkfont}{./fonts/chinese/}

% --------------------------------------------------
% 06 選項設定（Options Settings）
% --------------------------------------------------

% 繼承類別選項（將未定義的傳給基礎文檔）
% Option Declaration (pass tundefined options to father class)
\DeclareDefaultOption{
  \PassOptionsToClass{\CurrentOption}{report}
}

% 處理選項並載入基礎文檔
% Terminates the options processing and loads the basic class.
\LoadClass[a4paper, 12pt]{report}

% --------------------------------------------------
% 07 載入套件 (Include Packages)
% --------------------------------------------------

% [載入套件]

\RequirePackage[BoldFont,SlantFont]{xeCJK}
\RequirePackage{fontspec}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage[sf]{titlesec}
\RequirePackage{titletoc}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{tikz}

% [定義顏色]

\definecolor{steelblue}{rgb}{0.275, 0.510, 0.710}
\definecolor{lightpink}{rgb}{0.991, 0.711, 0.754}
\definecolor{darkblue}{rgb}{0.000, 0.000, 0.500}
\definecolor{darkgreen}{rgb}{0.000, 0.390, 0.000}
\definecolor{mygray}{gray}{0.92}
\definecolor{heavygray}{gray}{0.50}
\definecolor{lightgray}{gray}{0.80}

% --------------------------------------------------
% 08 自訂命令（Custom Commands）
% --------------------------------------------------

% [添加路徑]
\newcommand\appendgraphicspath[1]{
  \g@addto@macro\Ginput@path{#1}
}

% [標題格式]
% Header Format
\newcommand{\myheader}[1]{
  \textcolor{darkblue}{#1}
}

% [生成封面]
% Generate the cover page
%
\newcommand{\makecover}{
  \begin{titlepage}
    % 標題資訊
    \vfill
    \begin{flushright}
      \textcolor{steelblue}{
        \fontsize{36}{20pt}\selectfont
        \hwyk 大家來學 \textbf{{\LaTeX}}
      }
    \end{flushright}

    % 版本資訊
    \textcolor{lightpink}{\rule{\textwidth}{.256ex}}
    \begin{flushleft}
      Version 1.0 \\
      \today
    \end{flushleft}

    % 封面圖片
    \vfill
      \hspace*{3em}\includegraphics[scale=.75]{cover}
    \vfill

    % 作者資訊
    \begin{flushright}
      By Edward G.J.\ Lee 李果正 \\
      Email : \href{mailto:edt1023@info.sayya.org}{\ttfamily edt1023@info.sayya.org} \\
      本教學文件之製作，部份接受下列計劃補助： \\
      行政院研考會委辦 「政府機關資料文件交換之電子檔案格式應用研究」
    \end{flushright}
  \end{titlepage}
}

% [生成目錄]
% Generate table of contents page.
%
\renewcommand{\contentsname}{目錄}
\newcommand{\maketableofcontents}{
  % 目錄部份頁碼以羅馬數字計數
%   \cleardoublepage
%   \phantomsection
  \pagenumbering{roman}
  \setcounter{page}{1}
  \tableofcontents
  \newpage
}

% [正文開始]
% \mainmatter
%
\newcommand{\mainmatter}{
  % 正文部分頁碼以阿拉伯數字計數
  \cleardoublepage
  \pagenumbering{arabic}
  \setcounter{page}{1}
  % 調整段落間距離，置於 preamble 區會影響目錄行距，
  % 因此置於正文區
  \parskip=1.618ex
}

% --------------------------------------------------
% 10 套件設定 (Package Settings)
% --------------------------------------------------

% [圖表目錄]
\graphicspath{{./figures/}}

% [字體設定]
% - \setmainfont{}          	襯線字體
% - \setsansfont{}          	非襯字體
% - \setmonofont{}          	等寬字體
% - \setCJKmainfont{}			中文襯線字體
% - \setCJKsansfont{}			中文非襯字體
% - \setCJKmonofont{}			中文等寬字體
%

% \setmainfont{Times New Roman}[
%   Path = \latex123@path@font ,
%   Extension = .ttf ,
%   BoldFont = *-Bold ,
%   ItalicFont = *-Italic ,
%   BoldItalicFont = *-BoldItalic, ]

% 設定主要字體
\setCJKmainfont{HanWangMingMedium}[
  Path = \cls@path@cjkfont ,
  Extension = .ttf ,
  BoldFont = HanWangMingHeavy , ]

% 王漢宗中明體      \hwmm
\newCJKfontfamily{\hwmm}[
  Path = \cls@path@cjkfont ,
  Extension = .ttf , ]{HanWangMingMedium}

% 王漢宗特明體      \hwmh
\newCJKfontfamily{\hwmh}[
  Path = \cls@path@cjkfont ,
  Extension = .ttf , ]{HanWangMingHeavy}

% 王漢宗顏楷體      \hwyk
\newCJKfontfamily{\hwyk}[
  Path = \cls@path@cjkfont ,
  Extension = .ttf , ]{HanWangYanKai}

% [頁眉格式]
% 左章右節，每一頁皆相同。不使用 twoside 選項，則每一頁皆視為右頁。
\fancyhead[R]{\textsl{\footnotesize\textcolor{heavygray}\rightmark}}
\fancyhead[L]{\textsl{\footnotesize\textcolor{heavygray}\leftmark}}

% [標題格式]
% \titleformat{command}[shape]{format}{label}{sep}{before}[after]
% - command: 代表欲重新定義之標題階層，包含 \part, \chapter, \section, \paragraph
% - shape: 設定段落形狀，可選參數有 hang, block, display
% - format: 定義標題外觀，如：位置、字體大小粗細…
% - label: 定義標籤前綴標號
% - sep: 定義標號與標題內容間隔距離
% - before: 標題內容前增加文字
% - after: 標題內容後增加文字
\titlespacing{\chapter}{0pt}{0pt}{7ex}

% chapter
\titleformat
  {\chapter}[display]
  {\normalfont\LARGE\sffamily\hwyk}
  {\filleft\LARGE \myheader{第\ \thechapter\ 章}}
  {1ex}
  {\titlerule\vspace{.5ex}\filright\LARGE\myheader}
  [\vspace{.5ex} \titlerule]

% section
\titleformat
  {\section}[hang]
  {\Large\sf\hwyk}
  {\myheader\thesection}
  {1em}
  {\myheader}

% subsection
\titleformat
  {\subsection}[hang]
  {\large\sffamily\hwyk}
  {\myheader\thesubsection}
  {1em}
  {\myheader}

% subsubsection
\titleformat
  {\subsubsection}[hang]
  {\normalsize\sffamily\hwyk}
  {\myheader\thesubsubsection}
  {1em}
  {\myheader}

% [目錄格式]
%
\titlecontents
  {chapter}[2em]
  {\large\sf\hwyk\addvspace{-0.1em}}
  {\contentslabel{2em}}
  {}
  {\titlerule*[0.8pc]{.}\contentspage}

\titlecontents
  {section}[4em]
  {\small\addvspace{-0.2em}}
  {\contentslabel{3em}}
  {}
  {\titlerule*[0.8pc]{.}\contentspage}

\titlecontents
  {subsection}[6em]
  {\small\addvspace{-0.2em}}
  {\contentslabel{3em}}
  {}
  {\titlerule*[0.8pc]{.}\contentspage}

% --------------------------------------------------
% 10 其他設定 (Others)
% --------------------------------------------------

% [背景顏色]
\special{ pdf: bgcolor [ 1.00 0.98 0.95 ] }

% [調整字距]
\renewcommand{\CJKglue}{\hskip -0.3pt plus 0.08\baselineskip}

% [調整行距]
\linespread{1.382}

% [表格行距]
\renewcommand{\arraystretch}{1.2}

% [段落縮排]
\parindent=0pt  % 設置為 0 表示不縮排

%% 縮小 quote 為正常行距，並使用較小字體
\renewenvironment{quote}{
  \list{}{\topsep 0ex\parsep 0ex\setlength\leftmargin{1.5em}%
           \rightmargin\leftmargin}\item\relax\linespread{1.0}\small
}%
{\endlist}

% [腳注行距]
% 由於把行距加大，要把腳注的行距縮成預設值，此設定採自
% 吳聰敏教授的《cwTeX 排版系統》修訂二版一書，頁 143
\let\oldfootnote\footnote
\renewcommand\footnote[1]{\oldfootnote{\renewcommand\baselinestretch{1.0}%
\large\footnotesize\ignorespaces#1}}
\addtolength{\footnotesep}{3pt}

% [版面調整]
\addtolength{\textwidth}{1in}
\addtolength{\oddsidemargin}{-.5in}
\addtolength{\textheight}{1in}
\addtolength{\topmargin}{-.5in}