\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sep}[class for sep competition]

% Document class settings
\LoadClass[10pt, twoside]{article}

% UTF-8 encoding and Polish language support
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[polish, english]{babel}
\RequirePackage{ifthen}
\RequirePackage{xstring}

\DeclareOption{eng}{\def\lang{eng}}
\DeclareOption{pl}{\def\lang{pl}}
\ExecuteOptions{eng} % Default to English if no option is given
\ProcessOptions\relax

\ifthenelse{\equal{\lang}{pl}}{
  \selectlanguage{polish}
}{
  \selectlanguage{english}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Page Layout Settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{geometry}
\geometry{
  % paperwidth=210mm,
  % paperheight=297mm,
  paperwidth=176mm,
  paperheight=250mm,
  top=2cm,
  bottom=2.3cm,
  left=2cm,
  right=2cm,
}

% Header and footer settings
\RequirePackage{fancyhdr}
\RequirePackage{tikz}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fonts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{times}     % Times New Roman font (main body)
\RequirePackage{helvet}    % Helvetica (header/footer)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Custom Fonts for Title Elements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\titlefont}{\fontsize{16}{16}\selectfont\bfseries}
\newcommand{\authorfont}{\fontsize{12}{12}\selectfont\bfseries}
\newcommand{\degreefont}{\fontsize{11}{11}\selectfont\itshape}
\newcommand{\supervisorfont}{\fontsize{12}{12}\selectfont\bfseries}
\newcommand{\departmentfont}{\fontsize{11}{11}\selectfont\itshape}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Header/Footer Dark Magic
% I hate myself for this, but 
% it's the only thing that works
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Manually set the font sizes for each word in the header and footer
\newcommand{\fancyheadtext}{%
  \ifthenelse{\equal{\lang}{eng}}{%
    \fancyhead[C]{%
      {\fontsize{11}{13}\selectfont D}{\fontsize{9}{11}\selectfont EPARTMENT} 
      {\fontsize{9}{11}\selectfont OF}
      {\fontsize{11}{13}\selectfont E}{\fontsize{9}{11}\selectfont LECTRONICS,}
      {\fontsize{11}{13}\selectfont P}{\fontsize{9}{11}\selectfont HOTONICS,}
      {\fontsize{11}{13}\selectfont A}{\fontsize{9}{11}\selectfont ND}
      {\fontsize{11}{13}\selectfont M}{\fontsize{9}{11}\selectfont ICROSYSTEMS}
    }
  }{%
    \fancyhead[C]{%
      {\fontsize{11}{13}\selectfont W}{\fontsize{9}{11}\selectfont YDZIAŁ}
      {\fontsize{11}{13}\selectfont E}{\fontsize{9}{11}\selectfont LEKTRONIKI,}
      {\fontsize{11}{13}\selectfont F}{\fontsize{9}{11}\selectfont OTONIKI I}
      {\fontsize{11}{13}\selectfont M}{\fontsize{9}{11}\selectfont IKROSYSTEMÓW}
    }
  }
}

\pagestyle{fancy}
\fancyhf{}
\fancyheadtext
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0.5pt}
\setlength{\headheight}{25pt}
\setlength{\headsep}{15pt}

\fancyfoot[LE]{%
  \makebox[0pt][l]{%
    \begin{minipage}[b]{\textwidth}
      \fontsize{7}{9}\selectfont\thepage
      \hfill
      {\fontsize{9}{11}\selectfont S}{\fontsize{7}{9}\selectfont TOWARZYSZENIE} 
      {\fontsize{9}{11}\selectfont E}{\fontsize{7}{9}\selectfont LEKTRYKÓW} 
      {\fontsize{9}{11}\selectfont P}{\fontsize{7}{9}\selectfont OLSKICH} 
      {\fontsize{9}{11}\selectfont W P}{\fontsize{7}{9}\selectfont OLITECHNICE} 
      {\fontsize{9}{11}\selectfont W}{\fontsize{7}{9}\selectfont ROCŁAWSKIEJ} 
      {\fontsize{9}{11}\selectfont 2024}
    \end{minipage}
  }
}

\fancyfoot[RO]{%
  \makebox[0pt][r]{%
    \begin{minipage}[b]{\textwidth}
      {\fontsize{9}{11}\selectfont S}{\fontsize{7}{9}\selectfont TOWARZYSZENIE} 
      {\fontsize{9}{11}\selectfont E}{\fontsize{7}{9}\selectfont LEKTRYKÓW} 
      {\fontsize{9}{11}\selectfont P}{\fontsize{7}{9}\selectfont OLSKICH} 
      {\fontsize{9}{11}\selectfont W P}{\fontsize{7}{9}\selectfont OLITECHNICE} 
      {\fontsize{9}{11}\selectfont W}{\fontsize{7}{9}\selectfont ROCŁAWSKIEJ} 
      {\fontsize{9}{11}\selectfont 2024}
      \hfill
      \fontsize{7}{9}\selectfont\thepage
    \end{minipage}
  }
}

\fancypagestyle{firstpage}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \fancyfoot[C]{%
    {\fontsize{9}{11}\selectfont S}{\fontsize{7}{9}\selectfont TOWARZYSZENIE} 
    {\fontsize{9}{11}\selectfont E}{\fontsize{7}{9}\selectfont LEKTRYKÓW} 
    {\fontsize{9}{11}\selectfont P}{\fontsize{7}{9}\selectfont OLSKICH} 
      {\fontsize{9}{11}\selectfont W P}{\fontsize{7}{9}\selectfont OLITECHNICE} 
    {\fontsize{9}{11}\selectfont W}{\fontsize{7}{9}\selectfont ROCŁAWSKIEJ} 
    {\fontsize{9}{11}\selectfont 2024}
    \hfill
    \fontsize{7}{9}\selectfont\thepage
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Section Fonts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{sectsty}
\sectionfont{\fontsize{14}{17}\selectfont\times}
\subsectionfont{\fontsize{13}{16}\selectfont\times}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Section Numbering and Spacing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titlesec}
\titleformat{\section}
  {\normalfont\Large\bfseries}
  {\thesection.}{0.5em}{}
\titleformat{\subsection}
  {\normalfont\large\bfseries}
  {\thesubsection}{0.25em}{}
\titleformat{\subsubsection}
  {\normalfont\normalsize\bfseries}
  {\thesubsubsection.}{0.2x5em}{}

% Adjust spacing for \section
\titlespacing{\section}{0pt}{4pt}{4pt}

% Adjust spacing for \subsection
\titlespacing{\subsection}{0pt}{4pt}{4pt}

% Adjust spacing for \subsubsection
\titlespacing{\subsubsection}{0pt}{2pt}{2pt}


\RequirePackage{amsmath}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Paragraph Settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{setspace}
\singlespacing
\RequirePackage{microtype}
% Set paragraph spacing to half-line space
\setlength{\parskip}{0.5\baselineskip}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Remove Paragraph Indentation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\parindent}{0pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Inline Title Commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\degreefield}[1]{\gdef\@degreefield{#1}}
\newcommand{\fieldofstudy}[1]{\gdef\@fieldofstudy{#1}}
\newcommand{\supervisor}[1]{\gdef\@supervisor{#1}}
\newcommand{\department}[1]{\gdef\@department{#1}}

\renewcommand{\maketitle}{
 \noindent
    \vspace{1.0cm}
    \begin{flushright}
        \textcolor{gray}{
            \fontsize{14}{14}\selectfont
           \ifthenelse{\equal{\lang}{eng}}{%
              \textls[100]{CHAPTER}  % Letter spacing (100 = 1 pt)
           }
           {
              \textls[100]{ROZDZIAŁ}  % Letter spacing (100 = 1 pt)
           }
            \fontsize{24}{24}\selectfont 1  % Chapter is currently "1" as in the template, can be changed here
        }
    \end{flushright}
    \vspace*{-0.95cm}
    \noindent\rule{\textwidth}{0.5pt}\\[0.15cm]  % Horizontal rule
    {\centering\LARGE\textbf{\@title}\par\vspace{0.15cm}}
    \noindent\rule{\textwidth}{0.5pt}\\[0.75cm]  % Horizontal rule
    {\raggedleft 
    {\hfill\textbf{\authorfont\@author}}\\[0.1cm]
    {\hfill\textit{\degreefont\@degreefield}}\\[0.5cm]
    {\hfill\textbf{\supervisorfont\@supervisor}}\\[0.1cm]
    {\hfill\textit{\departmentfont\@department}}\\[1.5cm]
    }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ensure Lists are Single Spaced
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{enumitem}
\setlist{nosep, before={\vspace{0.15\baselineskip}}, after={\vspace{0.15\baselineskip}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bilbiography Stuff
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[
    style=numeric,
    sorting=none,
    backend=biber
]{biblatex}

  \ifthenelse{\equal{\lang}{eng}}{%
    \DefineBibliographyStrings{english}{%
      bibliography = {Literature},
      }
  }
  {
    \DefineBibliographyStrings{english}{%
    bibliography = {Literatura},
    }
  }
% URL package with color options
\RequirePackage[colorlinks=true, urlcolor=blue]{hyperref}
% Set URL font style
\urlstyle{same} % This keeps the URL font consistent with the surrounding text
% Alternatively, use a custom style:
% \renewcommand\UrlFont{\ttfamily\small} % Example: small, teletype font

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Formatting Magic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{afterpage}

\AtBeginDocument{
  \thispagestyle{firstpage}
  \afterpage{\pagestyle{fancy}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PDF hyperdata and settings, also used for colouring of links
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\hypersetup{unicode,
                          % DOCUMENT DATA
   pdfauthor={author},
   pdftitle={title},
   pdfsubject={Master's thesis},
   pdfkeywords={keyword},
                          % DOCUMENT SETTINGS
   pdfpagemode=UseOutlines,   % opens document in outline mode
   pdfpagelayout=SinglePage,  % single page layout
   pdfstartview={Fit},        % start view
   pdfstartpage=1,            % start on the specified page
   bookmarksopen=true,        % expand bookmarks
   bookmarksopenlevel=1,      % to what level
   colorlinks=true,           % color links instead of frames
   breaklinks,                % allow breaking links
   citecolor=cyan,            % color for bibliography links, default green
   filecolor=red,             % color for local file links, default magenta
   linkcolor=blue,            % color for internal links, default red
   menucolor=green,           % color for Acrobat menu items, default red
   urlcolor=blue              % color for URLs, default cyan
}


\endinput