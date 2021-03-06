\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UT}[2011/04/18 v1.0 Modified beamer class]

\LoadClassWithOptions{beamer}

\RequirePackage{relsize}
\RequirePackage[absolute,overlay]{textpos}

\RequirePackage{ifthen}
\newboolean{sectiontoc}
\setboolean{sectiontoc}{true} % default to true

\RequirePackage{pgfpages}
\RequirePackage{verbatim}

%Set the default fonts to Arial
\renewcommand{\rmdefault}{phv} 		% Arial
\renewcommand{\sfdefault}{phv} 		% Arial

%\usetheme{Warsaw} % deze stond uit
\TPGrid[3mm,9mm]{10}{5}

\def\taal#1{\gdef\@taal{#1}}				% EN NL	NOT YET IMPLEMENTED
\def\background#1{\gdef\@background{#1}}	% {1..4}	
\def\banner#1{\gdef\@banner{#1}}			% {1..5} 	WORKING ON THE BANNER

\setbeamertemplate{navigation symbols}{}

%Set the default fonts to Arial
\renewcommand{\rmdefault}{phv} 		% Arial
\renewcommand{\sfdefault}{phv} 		% Arial
          
%Define the colors and text size of the title page
\setbeamercolor{normal text}{fg=black}
\setbeamercolor{structure}{fg=black}

\setbeamersize{text margin left=16mm} 				%add space to the margin
\setbeamertemplate{navigation symbols}{} 			%no nav symbols


\newcommand{\makecontentsslide}{
   \begin{frame}
   \frametitle{Contents}
   \tableofcontents
   \end{frame}
}

\newcommand{\maketitleslide}{
	\usebackgroundtemplate{\includegraphics[height=\paperheight,width=\paperwidth]{img/back\@background\@taal}}

	\begin{frame}<beamer>[plain]

		\begin{textblock}{5.2}(2.6,1.83)
			\color{white}
			\fontfamily{phv}\fontseries{bc}\fontshape{n}\selectfont 
			{\Large \inserttitle} \\
			\fontfamily{phv}\fontseries{bc}\fontshape{n}\selectfont \smaller
\begin{table}
\centering
\begin{tabular}{l r}
			\insertsubtitle&\insertauthor
\end{tabular}
\end{table}

		\end{textblock}
		
		\begin{textblock}{5.2}(2.6,2.5)
			\color{white}
		\end{textblock}
		

	\end{frame}
	\color{black}
	\usebackgroundtemplate{}
}
%% Extra
\useoutertheme{infolines} % I like to have section name in the top
\setbeamertemplate{headline}[infolines theme]
 {%
}

%%Defines the frametitle
\setbeamertemplate{frametitle}{
	\vspace{20px}
	\hspace*{-0.005\paperwidth} \vbox{\insertframetitle}\par
\begin{textblock}{9}(1,0.7)
	~\hrule
	\end{textblock}
%	\vspace{10px}
%	\hrule
%	\vspace{10px}
}

\setbeamertemplate{footline}
{
  \hbox{%
  \begin{beamercolorbox}[wd=0.38\textwidth, dp=7pt]{title in foot} 
    \hspace{13mm} \parbox{1cm}{\includegraphics[height=0.7cm]{img/UT\@taal} 
  } 
  \end{beamercolorbox}
   \begin{beamercolorbox}[wd=.40\paperwidth,ht=2.25ex,dp=1ex,center]{section in head/foot}%
    \usebeamerfont{title in head/foot}\vspace{-1mm} \insertshorttitle
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=.22\paperwidth,ht=2.25ex,dp=1ex,right]{date in head/foot}%
    \usebeamerfont{title in head/foot}\vspace{-1mm}
    \insertdate \  \ \insertframenumber{} / \inserttotalframenumber\hspace*{2ex} 
  \end{beamercolorbox}}%
  \vskip0pt%
}


\AtBeginSection[]
{
\ifthenelse{\boolean{sectiontoc}}{
  \begin{frame}<beamer>{Overview}
  	\usebackgroundtemplate{\includegraphics[width=0.1\paperwidth,height=\paperheight]{img/side2}}
    \tableofcontents[currentsection,currentsubsection]
  \end{frame}
}
}
\newcommand{\sectionNoTOC}[1]{
  \setboolean{sectiontoc}{false}
  \section{#1}
  \setboolean{sectiontoc}{true}
}
\setbeamersize{text margin left=16mm,text margin right=5mm}