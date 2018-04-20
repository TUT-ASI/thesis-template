% Thesis template by:
%
%     Priit Ruberg 2015
%     Hannes Kinks 2016
%     Siavoosh Payandeh Azad 2018
%     Aleks-Daniel Jakimenko-Aleksejev 2018
%
% This template is in public domain.
%
% To the extent possible under law, the person who dedicated this
% template to public domain has waived all copyright and related or
% neighboring rights to this template.
%
% If you want to contribute or want to report bugs, please
% file an issue on GitHub:
%     https://github.com/TUT-ASI/thesis-template/issues
% or simply send an email to siavoosh.azad@ttu.ee

\ProvidesClass{MasterThesisTUT}[7/9/2018 custom thesis class]
% \documentclass[a4paper, 12pt]{article}
\LoadClass[a4paper, 12pt]{article}

\usepackage[a4paper, top=2.5cm, bottom=2.5cm, left=3cm, right=3cm,
% ↓ Geometry of the page
marginparsep = 0pt, marginparwidth = 0pt, includefoot, includehead]{geometry}
% if you want to see the frame use this option: showframe

% paragraph setup
\setlength{\parskip}{12pt}
\setlength{\parindent}{0pt}

\usepackage{times} % for the font

\usepackage[perpage]{footmisc} % for resetting footnotes numbering in each page!

\usepackage{titlesec} % for editing titles

\usepackage[utf8]{inputenc} % UTF8 decoding
\usepackage[T1]{fontenc}    % for using Estonian and Russian letters

\usepackage[titletoc, title]{appendix}

% ↓ Used for captioning tables and figures, set font to 10, Adds
% ↓ period to the end of table or figure
\usepackage[font=footnotesize, labelsep=period, textformat= period]{caption}

% -------------------------------------------
% Formatting the Tables
% -------------------------------------------
% for making the font in the table 11pt
\usepackage{etoolbox}
\BeforeBeginEnvironment{tabular}{\small }
\AfterEndEnvironment{tabular}{\normalsize}

\usepackage{array}

% \newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}

\setlength{\tabcolsep}{5 pt}
% ↓ for setting the line spacing inside a table to 6pt before and
% ↓ after, since one line spacing is 12 pt
\renewcommand{\arraystretch}{1.5}

% --------------------------------------------
% Formatting the Lists
% --------------------------------------------

\usepackage{amssymb}                            % For square itemized lists
\renewcommand{\labelitemi}{\tiny$\blacksquare$} % For square itemized lists

\usepackage{enumitem}
\setlist[1]{itemsep=6pt, parsep = 0pt, labelsep = 0.63 cm}

% --------------------------------------------
% Formatting the titles
% --------------------------------------------
\renewcommand{\contentsname}{\centering \bfseries Table of contents}
\renewcommand{\listfigurename}{\centering \bfseries List of figures}
\renewcommand{\listtablename}{\centering \bfseries List of tables}

\titlespacing*{\section}{0pt}{60pt}{6pt}
\titlespacing*{\subsection}{0pt}{12pt}{0pt}
\titlespacing*{\subsubsection}{0pt}{12pt}{0pt}

% --------------------------------------------
\setcounter{secnumdepth}{4} % Levels

\usepackage{fancyhdr} % Usage of headers and footers

\usepackage{setspace} % Used for spacing of text
\onehalfspacing % 1,5 spacing between lines of text

% redefine section so that it would start every time on a new page
\let\stdsection\section
\renewcommand\section{\newpage\stdsection}

% --------------- definitions ---------------
\newcommand*{\authorname}[1]{\def\nameofauthor{#1}}
\newcommand*{\thesistitle}[1]{\def\titleofthesis{#1}}
\newcommand*{\estonianthesistitle}[1]{\def\estoniantitleofthesis{#1}}
\newcommand*{\supervisorname}[1]{\def\nameofsupervisor{#1}}
\newcommand*{\cosupervisorname}[1]{\def\nameofcosupervisor{#1}}
\newcommand*{\programcode}[1]{\def\codeofprogram{#1}}
\newcommand*{\studentcode}[1]{\def\codeofstudent{#1}}
\newcommand*{\school}[1]{\def\school{#1}}
\newcommand*{\department}[1]{\def\department{#1}}
\newcommand*{\estonianschool}[1]{\def\estonianschool{#1}}
\newcommand*{\estoniandepartment}[1]{\def\estoniandepartment{#1}}

% ------------------------------
% Title Page English
% ------------------------------

\newcommand{\maketitlepage}{
  \thispagestyle{fancy}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \headheight = 57pt
  \headsep = 0pt

  \chead{
    \textsc{\begin{Large}
        Tallinn University of Technology\\
      \end{Large} }
    \school\\
    \department
  }
  \vspace*{7 cm}

  \begin{center}
    \codeofprogram\\[0cm]
    \nameofauthor ~\codeofstudent\\
    \begin{LARGE}
      \textsc{\titleofthesis\\} % TODO bold and uppercase
    \end{LARGE}
    Master Thesis\\[2cm]
  \end{center}

  % TODO “Supervisor” and “Co-Supervisor” should be right-aligned
  \begin{flushright}
    Supervisor: \nameofsupervisor \\
    Co-Supervisor: \nameofcosupervisor \\[0cm]
  \end{flushright}

  \cfoot{Tallinn \the\year}
  \pagebreak
}

% ------------------------------
% Title Page Estonian
% ------------------------------
\newcommand{\maketitlepageeesti}{
  \thispagestyle{fancy} % for header and footer
  \renewcommand{\headrulewidth}{0pt} % removes horizontal line from the header
  \renewcommand{\footrulewidth}{0pt} % removes horizontal line from the footer
  \headheight = 57pt % Paneb paika päise laiuse (vastavalt kompilaatori soovitusele)
  \headsep = 0pt % less space between text and headers
  % \footskip = 10pt % Jaluse ruum

  \chead{ % Paigutab järgneva teksti päises keskele
    \textsc{\begin{Large} % uppercase big text
        Tallinna tehnikaülikool\\
      \end{Large} }
    \estonianschool\\
    \estoniandepartment
  }

  \vspace*{7 cm} % space before text and start of the page

  \begin{center} % centered text
    \codeofprogram\\[0cm]
    \nameofauthor ~\codeofstudent\\
    \begin{LARGE}
      \textsc{\estoniantitleofthesis\\}
      % \textsc{Implementing neuroevolution on reprogrammable hardware\\}
    \end{LARGE}
    Magistritöö\\[2cm]
  \end{center}

  \begin{flushright} % text on the right
    Juhendaja: \nameofsupervisor\\

    Kaasjuhendaja: \nameofcosupervisor\\[0cm]

  \end{flushright}

  \cfoot{Tallinn \the\year} % Footer with location & year
  % \renewcommand{\headrulewidth}{0pt} % removes horizontal line from header
  \pagebreak % page end
}
