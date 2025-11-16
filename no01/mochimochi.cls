% Compile with XeLaTeX
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{MochiMochi}[2025/10/31 MochiMochi LaTeX class (XeLaTeX)]

% --- Engine check ----------------------------------------------------------
\RequirePackage{iftex}
\RequireXeTeX % XeLaTeX専用（LuaLaTeX/ pdfLaTeX ではエラー）

% --- Base class: bxjsarticle (XeLaTeX対応の和文クラス) ----------------------
% 受け取ったクラスオプションはそのまま bxjsarticle に渡す
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{bxjsarticle}}
\ProcessOptions\relax
\LoadClass[twocolumn,10pt]{bxjsarticle}

% --- Fonts for XeLaTeX -----------------------------------------------------
% ここは環境に合わせて自由に差し替えてください
\RequirePackage{fontspec}
\RequirePackage{xeCJK}

% 欧文既定
\setmainfont{TeX Gyre Termes}[
  Ligatures=TeX
]
\setsansfont{TeX Gyre Heros}
\setmonofont{TeX Gyre Cursor}

% --- CJK font setup --------------------------------------------------------
\IfFontExistsTF{Noto Serif CJK JP}{
  \setCJKmainfont{Noto Serif CJK JP}
}{
  \IfFontExistsTF{Hiragino Mincho ProN}{
    \setCJKmainfont{Hiragino Mincho ProN}
  }{
    \IfFontExistsTF{Yu Mincho}{
      \setCJKmainfont{Yu Mincho}
    }{
      \IfFontExistsTF{MS Mincho}{
        \setCJKmainfont{MS Mincho}
      }{
        \ClassWarning{MochiMochi}{No suitable CJK main font found; using package default.}
      }
    }
  }
}

\IfFontExistsTF{Noto Sans CJK JP}{
  \setCJKsansfont{Noto Sans CJK JP}
}{
  \IfFontExistsTF{Yu Gothic}{
    \setCJKsansfont{Yu Gothic}
  }{
    \IfFontExistsTF{Yu Gothic UI}{
      \setCJKsansfont{Yu Gothic UI}
    }{
      \IfFontExistsTF{Meiryo}{
        \setCJKsansfont{Meiryo}
      }{
        \IfFontExistsTF{MS Gothic}{
          \setCJKsansfont{MS Gothic}
        }{
          \ClassWarning{MochiMochi}{No suitable CJK sans font found; using package default.}
        }
      }
    }
  }
}

\IfFontExistsTF{Noto Sans Mono CJK JP}{
  \setCJKmonofont{Noto Sans Mono CJK JP}
}{
  \IfFontExistsTF{MS Gothic}{
    \setCJKmonofont{MS Gothic}
  }{
    \IfFontExistsTF{MS Mincho}{
      \setCJKmonofont{MS Mincho}
    }{
      \ClassWarning{MochiMochi}{No suitable CJK mono font found; using package default.}
    }
  }
}

% --- Packages --------------------------------------------------------------
% 余白
\RequirePackage{geometry}
\geometry{
    left=1.5cm,
    right=1.5cm,
    top=2.5cm,
    bottom=2.5cm,
    headsep=0.75cm
}
\setlength{\columnsep}{1.5cm}

% ページ番号のスタイル
\pagenumbering{arabic}

% 色
\RequirePackage{xcolor}
\definecolor{mycolor_1}{HTML}{006400}% ダークグリーン
\definecolor{mycolor_2}{HTML}{800000}% マロン

% 初めの文字をでかくする（ドロップキャップ）
\RequirePackage{lettrine}
\newcommand{\dropcapfont}{\color{mycolor_2}\bfseries\fontsize{30pt}{30pt}\selectfont}
\newcommand{\firstletter}[1]{%
  \lettrine[lines=2,lraise=0,findent=2pt,nindent=0em]{\dropcapfont #1}{}%
}

% 図版
\RequirePackage{graphicx}

% 箇条書き
\RequirePackage{enumitem}
\setlist{noitemsep,leftmargin=*}

% 数式
\RequirePackage{amsmath,amssymb,amsthm,mathtools}
\theoremstyle{definition}
\newtheorem{thm}{定理}
\newtheorem{defn}{定義}
\newtheorem{lem}{補題}
\newtheorem{prop}{命題}
\newtheorem{assum}{仮定}
\newtheorem{cor}{系}
\newtheorem{rem}{注意}
\newtheorem{eg}{例}

% セクション体裁
\RequirePackage[explicit]{titlesec}
\setcounter{secnumdepth}{5}

\titleformat{\section}
  {\color{mycolor_2}\sffamily\large\bfseries}
  {\thesection.}{0.5em}{#1}[]

\titleformat{name=\section,numberless}
  {\color{mycolor_2}\sffamily\large\bfseries}
  {}{0.5em}{#1}[]

\titleformat{\subsection}[block]
  {\bfseries\sffamily}
  {\thesubsection.}{0.5em}{#1}[]

% --- Title block -----------------------------------------------------------
\newcommand{\bookname}[1]{\def\@bookname{#1}}

\renewcommand{\@maketitle}{%
  \begingroup
  \parindent=0pt
  \vspace*{-\baselineskip}%
  \ifx\@bookname\undefined\else
    {\raggedright\bfseries\fontsize{12}{20}\selectfont \@bookname\par\vskip6pt}%
  \fi
  {\raggedright\bfseries\color{mycolor_1}\fontsize{22}{24}\selectfont \@title\par\vskip8pt}%
  {\raggedright\fontsize{17}{19}\selectfont \@author\par\vskip20pt}%
  \endgroup
}

% 目次（必要に応じて拡張可）
\newlength{\tocsep}

% 引用文献（ユーザ側で好きなパッケージを読み込む想定）
% 例: biblatex など

% -------------------- End of class --------------------
