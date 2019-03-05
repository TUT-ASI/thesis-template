% Template by:
%
%     Priit Ruberg 2015
%     Hannes Kinks 2016
%     Siavoosh Payandeh Azad 2018
%     Aleks-Daniel Jakimenko-Aleksejev 2018
%
% This template is in public domain.
%
% To the extent possible under law, people who dedicated this
% template to public domain have waived all copyright and related or
% neighboring rights to this template.
%
% If you want to contribute or want to report bugs, please
% file an issue on GitHub:
%     https://github.com/TUT-ASI/thesis-template/issues
% or simply send an email to siavoosh.azad@ttu.ee

\ProvidesClass{TalTechTemplate}[2018/05/16 TalTech Generic Template v1.0.2]
\LoadClass[a4paper, 12pt]{article}

% For homeworks and other reports
\DeclareOption{report}{}

% Bachelor's thesis
\DeclareOption{bachelor}{}

% Master's thesis
\DeclareOption{master}{}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Geometry of the page
\usepackage[
a4paper, includefoot, includehead,
top=2.5cm, bottom=2.5cm, left=3cm, right=3cm,
marginparsep = 0pt, marginparwidth = 0pt,
% showframe, % use this option if you want to see the frame
]{geometry}

% Languages
\usepackage[utf8]{inputenc} % UTF8 decoding
\usepackage[T1]{fontenc}    % for Estonian letters
\usepackage{iflang}         % checking the current language

\usepackage[estonian,english]{babel} % multilanguage setup
% Note: additional languages can be passed to babel
%       with \PassOptionsToPackage{someotherlang}{babel}

% Glossaries
\usepackage[nopostdot, nonumberlist, section=section]{glossaries}
\renewcommand*{\glsclearpage}{} % to prevent empty page before glossary
\makenoidxglossaries

% Paragraph setup
\setlength{\parskip}{12pt}
\setlength{\parindent}{0pt}

\usepackage{mathptmx} % for a Times-like font
\usepackage[iso]{datetime} % current date (note: uses ISO 8601 format)

\usepackage{titlesec} % for editing titles

\usepackage[titletoc, title]{appendix} % appendixes

% Total number of chapters/figures/tables
\usepackage{totcount}
\regtotcounter{table}
\regtotcounter{figure}
\regtotcounter{section}

% Captioning tables and figures, set font to 10, adds
% period to the end of table or figure
\usepackage[font=footnotesize, labelsep=period, textformat=period]{caption}

% Better link colors
\usepackage{hyperref}
\hypersetup{
  colorlinks,
  citecolor=black, filecolor=black,
  linkcolor=black, urlcolor=black,
}


% Tables

% Making the font in tables 11pt
\usepackage{etoolbox}
\BeforeBeginEnvironment{tabular}{\small }
\AfterEndEnvironment{tabular}{\normalsize}

\usepackage{array}
\usepackage{tabularx}
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}

\setlength{\tabcolsep}{5 pt}


% Setting the line spacing inside a table to 6pt before and
% after, since one line spacing is 12 pt
\renewcommand{\arraystretch}{1.5}


% For square itemized lists
\usepackage{amssymb}
\renewcommand{\labelitemi}{\tiny$\blacksquare$}

\usepackage{enumitem}
\setlist[1]{itemsep=6pt, parsep = 0pt, labelsep = 0.63 cm}


% Titles
\renewcommand{\contentsname}{\centering \bfseries%
  \IfLanguageName{english}{Table of Contents}{}%
  \IfLanguageName{estonian}{Sisukord}{}%
}
\renewcommand{\listfigurename}{\centering \bfseries%
  \IfLanguageName{english}{List of Figures}{}%
  \IfLanguageName{estonian}{Jooniste loetelu}{}%
}
\renewcommand{\listtablename}{\centering \bfseries%
  \IfLanguageName{english}{List of Tables}{}%
  \IfLanguageName{estonian}{Tabelite loetelu}{}%
}

\titlespacing*{\section}{0pt}{60pt}{6pt}
\titlespacing*{\subsection}{0pt}{12pt}{0pt}
\titlespacing*{\subsubsection}{0pt}{12pt}{0pt}

\setcounter{secnumdepth}{4} % Levels


% Headers and footers
\usepackage{fancyhdr}

% Resetting footnote numbering in each page
\usepackage[perpage]{footmisc}

% Spacing of text
\usepackage{setspace}
\onehalfspacing % 1.5 spacing between lines of text


% Redefine section so that it would start every time on a new page
\let\stdsection\section
\renewcommand\section{\newpage\stdsection}


% Definitions
\newcommand*\mainlanguage[1]{\def\@mainlanguage{#1}}
\newcommand*\authorname[1]{\def\@authorname{#1}}
\newcommand*\worktitle[1]{\def\@worktitle{\bfseries\uppercase{#1}}}
\newcommand*\worktitleEst[1]{\def\@worktitleEst{\bfseries\uppercase{#1}}}
\newcommand*\supervisorname[1]{\def\@supervisorname{#1}}
\newcommand*\supervisortitle[1]{\def\@supervisortitle{#1}}
\newcommand*\cosupervisorname[1]{\def\@cosupervisorname{#1}}
\newcommand*\cosupervisortitle[1]{\def\@cosupervisortitle{#1}}
\newcommand*\programcode[1]{\def\@programcode{#1}}
\newcommand*\studentcode[1]{\def\@studentcode{#1}}

\newcommand*\school[1]{\def\@school{#1}}
\newcommand*\schoolEst[1]{\def\@schoolEst{#1}}
\newcommand*\department[1]{\def\@department{#1}}
\newcommand*\departmentEst[1]{\def\@departmentEst{#1}}

\newcommand*\abstractpage[1]{\def\@abstractpage{#1}}
\newcommand*\abstractpageEst[1]{\def\@abstractpageEst{#1}}

% Totals
% (No need to plurify in Estonian! Winner winner, kanadinner.)
\newcommand*\totalchapters[1]{\total{section}
  \ifnum\totvalue{section}=1{chapter}\else{chapters}\fi
}
\newcommand*\totalfigures[1]{\total{figure}
  \ifnum\totvalue{figure}=1{figure}\else{figures}\fi
}
\newcommand*\totaltables[1]{\total{table}
  \ifnum\totvalue{table}=1{table}\else{tables}\fi
}


% Title Page
\newcommand*{\maketitlepage}{
  \thispagestyle{fancy} % for header and footer
  \renewcommand{\headrulewidth}{0pt} % removes horizontal line from the header
  \renewcommand{\footrulewidth}{0pt} % removes horizontal line from the footer
  \headheight = 57pt % fancy header height
  \headsep = 0pt % less space between text and headers

  \chead{ % centered
    \IfLanguageName{english}{
      \uppercase{Tallinn University of Technology}\\
      \@school\\
      \@department%
    }{}%
    \IfLanguageName{estonian}{
      \uppercase{Tallinna tehnikaülikool}\\
      \@schoolEst\\
      \@departmentEst%
    }{}%
  }

  \vspace*{3 cm} % space before text and start of the page

  \begin{center}
    \@programcode\\[0cm]
    \@authorname ~\@studentcode\\[2cm]
    \IfLanguageName{english}{
      \begin{LARGE}\@worktitle\\[2cm]\end{LARGE}
      % TODO todo what?
      Master's Thesis\\[3cm]
    }{}
    \IfLanguageName{estonian}{
      \begin{LARGE}\@worktitleEst\\[2cm]\end{LARGE}
      % TODO
      Magistritöö\\[3cm]
    }{}
  \end{center}

  \begin{flushright}
    \begin{tabularx}{0.5\textwidth}{rl}
      \IfLanguageName{english}{Supervisor}{}%
      \IfLanguageName{estonian}{Juhendaja}{}%
      :  & \@supervisorname \\
      \  & \@supervisortitle \\

      \@ifundefined{@cosupervisortitle}{}{%
        \IfLanguageName{english}{Co-Supervisor}{}%
        \IfLanguageName{estonian}{Kaasjuhendaja}{}%
        :  & \@cosupervisorname \\
        \  & \@cosupervisortitle \\
      }%
    \end{tabularx} \\[0cm]
  \end{flushright}

  \cfoot{Tallinn \the\year}
  \pagebreak
}


% Declaration
\newcommand*{\makedeclaration}{
  \section*{\centering
    \IfLanguageName{english}{Author's declaration of originality}{}%
    \IfLanguageName{estonian}{Autorideklaratsioon}{}%
  }

  \IfLanguageName{english}{
    I hereby certify that I am the sole author of this thesis. All the
    used materials, references to the literature and the work of others
    have been referred to. This thesis has not been presented for
    examination anywhere else.

    Author: \@authorname
  }{}

  \IfLanguageName{estonian}{
    Kinnitan, et olen koostanud antud lõputöö iseseisvalt ning seda ei
    ole kellegi teise poolt varem kaitsmisele esitatud. Kõik töö
    koostamisel kasutatud teiste autorite tööd, olulised seisukohad,
    kirjandusallikatest ja mujalt pärinevad andmed on töös viidatud.

    Autor: \@authorname
  }{}

  % \today
  \pagebreak
}


% Prologue (includes many compulsory pages)
\newcommand*{\prologue}[1]{
  \selectlanguage{\ \@mainlanguage}

  % ----------------------------- TITLE PAGE --------------------------------
  \maketitlepage

  % ----------------------------- TITLE PAGE (EST) --------------------------
  \IfLanguageName{estonian}{}{
    \foreignlanguage{estonian}{\maketitlepage}%
  }

  % ----------------------------- DECLARATION -------------------------------
  \makedeclaration

  % ----------------------------- ABSTRACT ----------------------------------
  % user-submitted abstracts
  #1

  % ----------------------------- ABBREVIATIONS -----------------------------
  {\titleformat{\section}[display]{\Large\bfseries\centering}{}{}{}
    \printnoidxglossary[title={%
      \IfLanguageName{english}{List of abbreviations and terms}{}%
      \IfLanguageName{estonian}{Lühendite ja mõistete sõnastik}{}%
    }]}

  % ----------------------------- TABLE OF CONTENTS -------------------------
  \singlespacing % TODO why?
  \tableofcontents
  \newpage

  % ----------------------------- LIST OF FIGURES ---------------------------
  \listoffigures
  \pagebreak

  % ----------------------------- LIST OF TABLES ----------------------------
  \listoftables
  \pagebreak
  \onehalfspacing
}


% Epilogue (bibliography and appendices)
\newcommand*{\epilogue}[1]{
  % Bibliography
  \setstretch{0} % tighter spacing between references
  \printbibliography[heading=bibintoc, title={%
    \IfLanguageName{english}{References}{}%
    \IfLanguageName{estonian}{Kasutatud kirjandus}{}%
  }]

  \label{EndOfMainPart}
  \addtocounter{section}{-1} % Introduction
  \addtocounter{section}{-1} % Summary
  \newpage

  \let\svaddcontentsline\addcontentsline
  \renewcommand\addcontentsline[3]{%
    \ifthenelse{\equal{##1}{lof}}{}%
    {\ifthenelse{\equal{##1}{lot}}{}{\svaddcontentsline{##1}{##2}{##3}}}}

  % Appendices
  \begin{appendices}
    % save and reset counters
    \newcounter{maintable}
    \setcounter{maintable}{\value{table}}
    \newcounter{mainfigure}
    \setcounter{mainfigure}{\value{figure}}
    \setcounter{table}{0}
    \setcounter{figure}{0}

    \titleformat{\section}{\bfseries\Large}{
      \IfLanguageName{english}{Lisa}{}
      \IfLanguageName{estonian}{Appendix}{}
      \thesection}{0.2em}{}
    \renewcommand{\thesection}{\arabic{section} --}

    % user-submitted appendices
    #1

    % restore counters
    \setcounter{table}{\themaintable}
    \setcounter{figure}{\themainfigure}
  \end{appendices}
}
