%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Identify, Process Options, and Load Class
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{soton}[2018/04/05 v1.0]
\gdef\baseclass{book}

%%%%%%%%%%%%%%%%%%%%%
% Available options:
%
% sotonformat:  use 11pt font and 1.5-spacing for main text, margins as in the guidelines
% print:        disable link colouring
% final:        disable the "to do" command

\newif\if@sotonformat\@sotonformatfalse
\newif\if@print\@printfalse
\newif\if@final\@finalfalse

\DeclareOption{sotonformat}{\@sotonformattrue}
\DeclareOption{print}{\@printtrue}
\DeclareOption{final}{\@finaltrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}
\ExecuteOptions{a4paper, twoside, openright}
\ProcessOptions\relax

\if@sotonformat
  \PassOptionsToClass{11pt}{\baseclass}
  \PassOptionsToPackage{inner=1.5in, outer=1in, top=1in, bottom=1in}{geometry}
  \PassOptionsToPackage{onehalfspacing}{setspace}
\fi

\LoadClass{\baseclass}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Essential Packages
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[l2tabu, orthodox]{nag}  % Issues warnings if deprecated packages are used
\RequirePackage{float}  % in order to force figure placement with option [H]
\RequirePackage{geometry}
\RequirePackage{mathtools,amsfonts,amssymb}
\RequirePackage{parskip}  % Leave some space between paragraphs instead of indenting a new paragraph
\RequirePackage[usenames,dvipsnames,svgnames,x11names]{xcolor}
\PassOptionsToPackage{hyphens}{url}  % hyperref loads the url package
\RequirePackage{hyperref}
\RequirePackage[english]{babel}
\RequirePackage[utf8x]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{microtype}
\RequirePackage[numbers,sort&compress]{natbib}
\RequirePackage{bookmark}
\RequirePackage{xspace}  % Used in the definition of the \etc custom command
\RequirePackage{setspace}  % Loads \singlespacing, \onehalfspacing, \doublespacing
\RequirePackage{graphicx}
\RequirePackage[labelfont=bf]{caption}  % make "Figure x.x" be printed in bold face
\RequirePackage{fancyhdr}  %  Style page headers and footers
\RequirePackage{sectsty}  % Style titles for chapters, sections etc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Styling
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Headers and Footers
\setlength{\headheight}{14pt}
\fancyhead{} % Clear all header fields
\fancyhead[RE]{\itshape\nouppercase\leftmark}
\fancyhead[LO]{\itshape\nouppercase\rightmark}
\fancyhead[RO,LE]{\thepage}
\fancyfoot{}

% Chapters, Sections, etc.
\partfont{\normalfont\scshape\underline}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% New Commands
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Add a chapter title to the table of contents and to the bookmarks
\newcommand*\TOCchapter[1]{
  \phantomsection{}
  \addcontentsline{toc}{chapter}{#1}
}

% Add a table of contents
\newcommand*\addTOC{
  \begingroup
  \singlespacing
  \renewcommand{\contentsname}{Table of Contents}
  \TOCchapter{\contentsname}
  \tableofcontents
  \cleardoublepage{}
  \endgroup
}

% Add a list of figures and a list of tables
\newcommand*\addFiguresTables{
  \begingroup
  \singlespacing
  \TOCchapter{List of Figures and Tables}
  \listoffigures
  \listoftables
  \cleardoublepage{}
  \endgroup
}

% For meta data
\newcommand*\university[1]{\gdef\@university{#1}}
\newcommand*\faculty[1]{\gdef\@faculty{#1}}
\newcommand*\department[1]{\gdef\@department{#1}}

% To do commands
\newcommand*\todo[1]{
\if@final
  {}
\else
  {\color{red}(#1)}
\fi
}

\newcommand*\todomaybe[1]{
\if@final
  {}
\else
  {\color{blue}(#1)}
\fi
}

% Abbreviations: e.g., i.e., etc.
\newcommand*\eg{e.g.\@\xspace}
\newcommand*\ie{i.e.\@\xspace}
\newcommand*\etc{\@ifnextchar{.}{etc}{etc.\@\xspace}}

% Maths operators
\DeclareMathOperator{\sech}{sech}
\DeclareMathOperator{\csch}{csch}
\DeclareMathOperator{\arcsec}{arcsec}
\DeclareMathOperator{\arccot}{arcCot}
\DeclareMathOperator{\arccsc}{arcCsc}
\DeclareMathOperator{\arccosh}{arcCosh}
\DeclareMathOperator{\arcsinh}{arcsinh}
\DeclareMathOperator{\arctanh}{arctanh}
\DeclareMathOperator{\arcsech}{arcsech}
\DeclareMathOperator{\arccsch}{arcCsch}
\DeclareMathOperator{\arccoth}{arcCoth}

\DeclareMathOperator{\tr}{tr}
\DeclareMathOperator{\id}{id}
\DeclareMathOperator{\diag}{diag}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Configuration
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Meta data
\author{Name Surname}
\title{Title}
\date{Month Year}
\university{University of Southampton}
\faculty{Faculty of Physical Sciences and Engineering}
\department{Physics and Astronomy}

% Bookmarks
\bookmarksetup{
  open,
  numbered,
  addtohook={% CHANGE THE LEVELS DEPENDING ON WHETHER CHAPTER OR SECTION IS THE LOWEST LEVEL
    \ifnum\bookmarkget{level}=-1 %
      \bookmarksetup{bold}%
    \fi%
    \ifnum\bookmarkget{level}>0 %
      \bookmarksetup{italic}%
    \fi
  },
}

% Hyperlinks
\hypersetup{
  colorlinks=true,
  allcolors=#fff,
  bookmarksopen=true,
  bookmarksopenlevel=0
}

\if@print
  \hypersetup{hidelinks}
\fi

% Allow long equations to be continued to the next page
\allowdisplaybreaks{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Document Structure
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [x] Title and subtitle
% [x] Abstract
% [x] List of contents
% [x] List of tables, illustrations etc.
% [-] List of accompanying material, if any
% [x] Author's declaration
% [x] Acknowledgements
% [-] Definitions, abbreviations used
% [x] Introduction
% [x] Main text, divided into chapters, sections etc.
% [x] Conclusion
% [x] Appendices
% [-] Glossary
% [x] List of references/Bibliography
% [-] Index

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Title Page
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\maketitle{
  \TOCchapter{Title Page}
  \hypersetup{pdftitle={\@title}}
  \hypersetup{pdfauthor={\@author}}
  \thispagestyle{empty}

  \begin{titlepage}
    \begin{center}
      \setlength{\parskip}{0pt}
      {\Large\textbf{\@university}\par}
            {\large Faculty of {\@faculty}\par \par}
      {\large School of Electronics and Computer Science\par \par}
      \vfill
      {\huge \bfseries \@title \par}
      \bigskip
      \bigskip
      \bigskip
      {\LARGE by \par}
      {\LARGE \textbf{\@author \par}}
      \bigskip
      {\Large \@date \par}
      \vfill
      {\LARGE \textbf{Supervisor: Dr Reza Rezazadeh}}
      {\LARGE \textbf{Second Examiner: Dr Stuart Boden \par}}
      \vfill
      {\Large Dissertation for the degree of of MSc. Computer Science \par}
      \bigskip
      \bigskip
      \bigskip
      \bigskip
    \end{center}
  \end{titlepage}

  \cleardoublepage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Abstract
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\abstract[1]{
  \TOCchapter{Abstract}
  \chapter*{Abstract}
  {\singlespacing\normalsize #1}
  \cleardoublepage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Acknowledgements
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\acknowledgements[1]{
  \TOCchapter{Acknowledgements}
  \chapter*{Acknowledgements}
  {\singlespacing\normalsize #1}
  \cleardoublepage
}

% (The End)
