\ProvidesClass{kclthesis}[2016/02/13 KCL MSc Thesis Class by Sebastian Zillessen and Andre Mueller]
\NeedsTeXFormat{LaTeX2e}

\newif\ifkclthesis@isdraft
\newif\ifkclthesis@kclharvardbib
\DeclareOption{isdraft}{\kclthesis@isdrafttrue}
\DeclareOption{kclharvardbib}{\kclthesis@kclharvardbibtrue}

\ProcessOptions*% process options it the order the user provides them

\LoadClass[11pt,a4paper]{article}

\ifkclthesis@isdraft
	\RequirePackage{draftwatermark}
	\SetWatermarkText{DRAFT}
	\SetWatermarkScale{8}
	\RequirePackage[textsize=tiny,figwidth=8cm]{todonotes}
	%\overfullrule=1mm
\else
	\RequirePackage[disable]{todonotes}
\fi


\ifkclthesis@kclharvardbib
	\RequirePackage[numbers]{natbib}
	\RequirePackage[UKenglish]{isodate}
\fi


% Mathfonts
\RequirePackage{amsmath, amsfonts, amsthm, amssymb}
\RequirePackage{wasysym}


%Additional Packages
\RequirePackage{color}
\RequirePackage[nottoc]{tocbibind}
\RequirePackage[colorlinks = true,
            linkcolor = blue,
            urlcolor  = blue,
            citecolor = blue,
            anchorcolor = blue,
            breaklinks=true]{hyperref}
\RequirePackage{breakurl}
\RequirePackage{fancyhdr}
\RequirePackage{subfigure}
\RequirePackage{rotating}
\RequirePackage[nameinlink,noabbrev]{cleveref}



% reset glossaries per section

% Cover Page
\RequirePackage{graphicx}
\RequirePackage[paper=a4paper]{geometry}
\RequirePackage{setspace}
\RequirePackage{framed}
\RequirePackage{tikz}
\RequirePackage[toc, acronym]{glossaries}
\RequirePackage{float}
\RequirePackage{usecases}
\RequirePackage{fancyvrb}
\RequirePackage{pdflscape}
\RequirePackage{colortbl}
\RequirePackage{enumitem}
\RequirePackage{pdfpages}
\RequirePackage{multirow}
\RequirePackage{algorithm}
\RequirePackage[noend]{algpseudocode}

\usetikzlibrary{arrows}
\usetikzlibrary{calc}

%%%% VARIABLES
\newcommand*{\modulecode}[1]{\gdef\@modulecode{#1}}
\newcommand*{\@modulecode}{\red{Missing Module Code}}
\newcommand*{\department}[1]{\gdef\@department{#1}}
\newcommand*{\@department}{\red{Missing Department}}
\newcommand*{\submissiontitle}[1]{\gdef\@submissiontitle{#1}}
\newcommand*{\@submissiontitle}{\red{Missing Submission title}}
\newcommand*{\studentnumber}[1]{\gdef\@studentnumber{#1}}
\newcommand*{\@studentnumber}{\red{Missing Studentnumber}}
\newcommand*{\programme}[1]{\gdef\@programme{#1}}
\newcommand*{\@programme}{\red{Missing Program}}
\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}}
\newcommand*{\@supervisor}{\red{Missing supervisor}}
\newcommand*{\cosupervisor}[1]{\gdef\@cosupervisor{#1}}
\newcommand*{\wordcount}[1]{\gdef\@wordcount{#1}}
\newcommand*{\@wordcount}{\red{Missing wordcount}}
\newcommand*{\signdate}[1]{\gdef\@signdate{#1}}
\newcommand*{\@signdate}{\today}


\newfloat{as}{hbtp}{lop}
\floatname{as}{AS}
\newcommand{\asautorefname}{AS}
\crefname{as}{AS}{AS}
\Crefname{as}{AS}{AS}



\newcommand{\low}[1]{{\tiny $_{#1}$}}
\newcommand{\tbd}[1]{\todo{TBD}{\color{gray} #1}}

\tikzstyle{node}=[]
\tikzstyle{dummy}=[inner sep=0,outer sep=0]
\tikzstyle{main}=[circle, draw]
\tikzstyle{n_fill_green}=[main,fill=green!20]
\tikzstyle{n_fill_red}=[main,fill=red!20]
\tikzstyle{n_fill_gray}=[main,fill=gray!20]
\tikzstyle{box}=[rectangle, draw]
\tikzstyle{small}=[main, inner sep=1pt,minimum size=20pt]






% MACRO 
\linespread{1.5}
\newfam\msbfam
\def\Bbb#1{\fam\msbfam\relax#1}


\theoremstyle{definition}
\newtheorem{theorem}{Theorem}[section]
\newtheorem{exa}{Example}[section]
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}

\newtheorem{definition}[theorem]{Definition}
\newtheorem{remark}[theorem]{Remark}
\newtheorem{notation}[theorem]{Notation}
\newtheorem{assumption}[theorem]{Assumption}
\newtheorem{conjecture}[theorem]{Conjecture}

\newcommand{\remarkautorefname}{Remark}
\newcommand{\definitionautorefname}{Definition}
\newcommand{\notationautorefname}{Notation}
\newcommand{\assumptionautorefname}{Assumption}
\newcommand{\algorithmautorefname}{Algorithm}

\newcommand{\ind}{1\hspace{-2.1mm}{1}} %Indicator Function
\newcommand{\I}{\mathtt{i}}
\newcommand{\E}{\mathrm{e}}
\newcommand{\RR}{\mathbb{R}}
\newcommand{\sgn}{\mathrm{sgn}}
\newcommand{\atanh}{\mathrm{arctanh}}
\newcommand{\R}{\mathcal{R}}
\renewcommand{\S}{\mathcal{S}}
\newcommand{\D}{\mathcal{D}}
\renewcommand{\O}{\mathcal{O}}
\newcommand{\A}{\mathcal{A}}
\newcommand{\M}{\mathcal{M}}
\newcommand{\C}{\mathcal{C}}
\newcommand{\X}{\mathcal{X}}

\def\equalDistrib{\,{\buildrel \Delta \over =}\,}
\numberwithin{equation}{section}
\def\blue#1{\textcolor{blue}{#1}}
\def\red#1{\textcolor{red}{#1}}


% New Comment for todonotes
\newcommand{\insertref}[1]{\todo[color=green!40]{RefMissing: #1}}
\newcommand{\explainindetail}[1]{\todo[color=red!40]{Explain: #1}}
\newcommand{\askfeedback}[1]{\todo[color=blue!40]{Feedback Required: #1}}



\fancyhead{}
\fancyfoot[]{}
\pagestyle{fancy} 
%\fancyhead{\sffamily\small \thepage}
%\fancyhead{\sffamily\small \nouppercase{\rightmark}}
\fancyhead[RO,LE]{\sffamily\small \thepage}
\fancyhead[LO,RE]{\sffamily\small \nouppercase{\rightmark}}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.0pt}


\renewcommand*{\maketitle}{
\begin{titlepage}

\begin{minipage}{0.5\textwidth}
\begin{flushleft}
\textbf{Faculty of Natural and\\
	Mathematical Sciences\\}
\small{\@department}
\end{flushleft}
\end{minipage}%
\begin{minipage}{0.25\textwidth}
\hspace{5cm}
\end{minipage}%
\begin{minipage}{0.25\textwidth}
	\begin{flushright}
		\includegraphics[width=3.25cm]{img/kcl}
	\end{flushright}
\end{minipage}
\vspace{1cm}

\doublespacing{
\begin{minipage}{\textwidth}
	\begin{center}
		\textbf{\@modulecode \\ \@submissiontitle}
	\end{center}
\end{minipage}

\vspace{0.5cm}

\begin{minipage}{0.3\textwidth}
	\begin{flushleft}
	\textbf{Name:\\
		Student Number:\\
		Degree Programme:\\
		Project Title:\\ 
		Supervisor:\\
		Scientific Assistant:\\
	 	Word Count:\\
	 	}
	\end{flushleft}
\end{minipage}%
\begin{minipage}{0.7\textwidth}
	\begin{flushleft}
		\@author \\ 
		\@studentnumber \\ 
		\@programme \\ 
		\@title \\ 
		\@supervisor \\ 
		\@cosupervisor\\
		\@wordcount\\
	\end{flushleft}
\end{minipage}
}
\vspace{1cm}

\begin{minipage}{\textwidth}
	\begin{framed}
		\textbf{Plagiarism Statement}\\
		All work submitted as part of the requirements for any examination or assessment must be expressed in your own words and incorporates your own ideas and judgements. Plagiarism is the taking and using of another person’s thoughts, words, judgements, ideas, etc., as your own without any indication that they are those of another person.\\
		Plagiarism is a serious examination offence. An allegation of plagiarism can result in action being taken under the \textit{B3 Misconduct Regulations}. 
	\end{framed}


I acknowledge that I have read and understood the above information and that the work I am submitting is my own. 
\end{minipage}

\vspace{1.0cm}

\begin{minipage}{0.5\textwidth}
\begin{flushleft}
	\textbf{Signature:}
\end{flushleft}
\end{minipage}%
\begin{minipage}{0.5\textwidth}
	\begin{flushleft}
		\textbf{Date:} \@signdate
	\end{flushleft}
\end{minipage}

\end{titlepage}
}
\newcommand*{\maketitleTwo}{

% Second Cover Page

\begin{titlepage}
\thispagestyle{empty}
\null\vskip0.2in%

\begin{center}
\@department \\ 
King's College London \\
WC2R 2LS London \\ 
United Kingdom
\end{center}


\vspace{1.5cm}

\begin{center}
\LARGE{{\bf 
\@title
}}\\
\vspace{0.2cm}
\vskip\bigskipamount % or other desired dimension
\leaders\vrule width \textwidth\vskip0.4pt % or other desired thickness
\vskip\bigskipamount % ditto
\nointerlineskip
\@submissiontitle
\end{center}

\vspace{0.2cm}

\begin{center}
{\bf \@author}\\
Student Number: \@studentnumber\\
Course: \@programme
\end{center}

\vspace{1.2cm}
\begin{center}
{\bf Supervisor:} \@supervisor \\
{\bf Scientific Assistant:} \@cosupervisor\\
\end{center}

\vspace{1cm}

\begin{figure}[!h]
\centering
\includegraphics[width=3.5cm]{img/kcl}
\end{figure}

\vspace{1.2cm}

\begin{center}
Thesis submitted as part of the requirements for the award of the MSc in Web Intelligence.\\
7CCSMPRJ - MSc Individual Project - 2016
\end{center}
\end{titlepage}
}

\onehalfspacing
\endinput
