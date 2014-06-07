% Trieda pre diplomove prace. mailto:sk.szm@r.novotny
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{rnthesis}
              [2014/06/08 v1.1
 Robert Novotny 'Thesis' class]
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright
%
\if@compatibility\else
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\fi
\if@compatibility
  \renewcommand\@ptsize{0}
\else
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\fi
\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi
\if@compatibility\else
%
\newif\if@conteqnno
\@conteqnnofalse
\DeclareOption{conteqnno}{\@conteqnnotrue}
%
\fi
\if@compatibility
\else
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\fi
\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
%
\newif\if@thesisenglish
\@thesisenglishfalse
\DeclareOption{english}{\@thesisenglishtrue}
%
\newif\if@thesismargins
\@thesismarginsfalse
\DeclareOption{thesismargins}{\@thesismarginstrue}
%
\newif\if@thesislinespacing
\@thesislinespacingfalse
\DeclareOption{thesislinespacing}{\@thesislinespacingtrue}
%
\newif\if@thesischapterstyle
\@thesischapterstylefalse
\DeclareOption{thesischapterstyle}{\@thesischapterstyletrue}
%
\newif\if@usesections
\@usesectionsfalse
\DeclareOption{usesections}{\@usesectionstrue}
%
\newif\if@longabstracts
\@longabstractsfalse
\DeclareOption{longabstracts}{\@longabstractstrue}
%
\newif\if@showhonesty
\@showhonestyfalse
\DeclareOption{showhonesty}{\@showhonestytrue}
%
\newif\if@upjsfrontpage
\@upjsfrontpagefalse
\DeclareOption{upjsfrontpage}{\@upjsfrontpagetrue}
%
\newif\if@disablespecwarning
\@disablespecwarningfalse
\DeclareOption{disablespecwarning}{\@disablespecwarningtrue}
%
\ExecuteOptions{a4paper,12pt,oneside,onecolumn,final,openany}
\ProcessOptions
\input{size1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\if@thesismargins
  %Odporucane okraje: zlava 3,5 cm, sprava 2 cm,
  %zhora a zdola 2,5 cm
  \setlength{\hoffset}{-1in}
  \setlength{\evensidemargin}{2.1cm} %.1mm pre \marginparsep
  \setlength{\oddsidemargin}{3.6cm} % to iste ako \oddsidemargin
  \setlength{\textwidth}{15.3cm}%21cm - 2 (vonkajsi okraj) -  3.6 (vnutornz okraj) - bulh. konst
%  
  \setlength{\voffset}{-1in} % resetnime vrch stranky na 0pt
  \setlength{\topmargin}{2.5cm} 
  \setlength{\headheight}{0cm} % zahlavia nepouzivame
  \setlength{\headsep}{0cm} % zahlavia nepouzivame  
  \setlength{\footskip}{1.5cm}
  \setlength{\textheight}{24.69cm} % 29.69cm - 2.5cm (topmargin) - 1.5cm (footskip) - 1cm (footskip + toto = 2.5cm)
\fi
\if@thesislinespacing
  \def\baselinestretch{1.4}
\fi

\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
            \@chapapp\ \thechapter. \ %
        \fi
        ##1}}{}}%
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection. \ %
        \fi
        ##1}}}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
            \@chapapp\ \thechapter. \ %
        \fi
        ##1}}}}
\fi
%rok
\def\@rok{\ClassError{rnthesis}{\string\rok{} nebol definovany!}{Definujte v subore prikaz \string\rok !}}
\newcommand{\rok}[1]{\def\@rok{#1}}

%odbor
\def\@odbor{Informatika}
\newcommand{\odbor}[1]{\def\@odbor{#1}}

% Conditional macros: see http://www.physics.wm.edu/~norman/latexhints/conditional_macros.html
%studijny program
\let\@studprog=\relax
\newcommand{\studprog}[1]{\def\@studprog{#1}}


%podakovanie
% \def\@podakovanie{\@latex@error{Neboli zadane udaje pre \noexpand\podakovanie}\@ehc} 
\def\@podakovanie{\relax}
\newcommand{\podakovanie}[1]{\def\@podakovanie{#1}}

%vyhlasenie
\long\def\@vyhlasenie{
Vyhlasujem, \v{z}e som t\'uto diplomov\'u pr\'acu
vypracoval samostatne, na z\'aklade vedomost\'{\i}
z\'{\i}skan\'ych \v{s}t\'udiom a s pomocou uvedenej literat\'ury.
} 
\newcommand{\vyhlasenie}[1]{\long\def\@vyhlasenie{#1}}

%typ prace (bakalarska, diplomova)
\newcommand{\typprace}[1]{\def\@typprace{#1}}
%Toto by sme mohli urobit ako \def\@typprace{\ClassError}, ale chybova hlaska by bola velkymi
%pismenami kvoli \MakeUppercase v maketitle
\AtBeginDocument{%
\@ifundefined{@typprace}{%
		\ClassError{rnthesis}{Nedefinovany typ prace! Definujte v subore \string\typprace{}!}{Priklad: \string\typprace{bakalarska}}%
	}
	{\relax}}

%autor. \author je definovany v zakladnom LaTeXu, zodpoveda mu globalne makro \@author, predefinujeme ho z
%warningu na error
\def\@author{\@latex@error{Autor \noexpand\author nebol definovany}{Definujte \string\author, priklad: \noexpand\author{Jozef Mak}}} 

%miesto vydania
\def\@miesto{%
	\@latex@error{Miesto podania prace \noexpand\miesto nebolo definovane}{Definujte \string\miesto, priklad: \noexpand\miesto{Ko\v{s}ice}}% 
}%
\newcommand{\miesto}[1]{\def\@miesto{#1}}

%veduci
\def\@veduci{%
	\ClassError{rnthesis}{Nedefinovany veduci! Definujte v subore \string\veduci{}!}{Priklad: \string\veduci{doc. RNDr. Jozef Mak, DrSc.}}%
}
\newcommand{\veduci}[1]{\def\@veduci{#1}}

%konzultant
\let\@konzultant\relax
\newcommand{\konzultant}[1]{\def\@konzultant{#1}}

%pracovisko / katedra
\def\@pracovisko{\ClassError{rnthesis}{Pracovisko (\string\pracovisko) nebolo definovane.}{Definujte v subore \string\pracovisko{}! Priklad: \string\pracovisko{Ustav informatiky}}}
\newcommand{\pracovisko}[1]{\def\@pracovisko{#1}}

% abstrakty: definujeme anglicky AbstraCt a slovensky AbstraKt
\def\@abstrakt{\relax}
\long\def\abstrakt#1{\long\def\@abstrakt{#1}}

\def\@abstract{\relax}
\long\def\abstract#1{\long\def\@abstract{#1}}

%nadpisy pre Abstract a Abstrakt, straca sa moznost
%predefinovania v slovak.sty
\def\@abstractname{Abstract} %redefinovane z LaTeXu
\def\@abstraktname{Abstrakt}

%univerzita

%-------------\custom maketitle
\newcommand\m@ketitle{%
\begin{titlepage}
  \newpage
  \null  
  \begin{center}
  {\sffamily \Large
  \universityname\par
  \facultyname\par\vskip6pt
  }
  \par
  %\vspace*{8cm}
  \vfill  
  {
  	\baselineskip=30pt
  	{\huge \sffamily \bfseries \MakeUppercase{\@title}}\par\bigskip
  }  
  {\large \sffamily \bfseries \MakeUppercase{\@typprace} \MakeUppercase{\thesisname}}\par
  \vspace*{1.4cm}  
  %\par 
  \vfill
  \begin{flushleft}%
  \sffamily
  \bfseries
  \begin{tabbing}
  	MMMMMMMMMMMMM\= \kill
  	\ifx\@studprog\relax
  		\relax
  	\else
	    \studyprogrammename: \> \@studprog\\%pozor! sme v tabbing, akcenty su \a'!
	\fi
    \fieldofstudyname: \> \@odbor\\%
    \institutename: \> \@pracovisko\\%
    \tutorname: \> \@veduci\\%
    \ifx\@konzultant\relax
    	\relax
    \else
	    \counsellorname: \> \@konzultant
	\fi
  \end{tabbing}
  \par
  \if@upjsfrontpage
    \vspace*{3cm}
    {\@miesto\ \@rok \hfill\break \@author}
  \else
    \vspace*{1cm}
    {\@miesto\ \@rok \hfill \@author}    
  \fi
  \end{flushleft}
  \end{center}
\end{titlepage} 
\newpage
% a dalsia strana ide pre vyhlasenie
\if@showhonesty
\if@twoside\newpage\thispagestyle{empty}\null\fi % intentionally left blank to maintain odd pages
\newpage\thispagestyle{empty}
\par
\null
\vfill
\begin{center}
\begin{minipage}{12cm}
\centerline{{\large\bfseries Vyhl\'asenie}}\par\bigskip
\@vyhlasenie
\par
\bigskip
\null\hfill
\hbox{%
  \vbox{%
    \hbox to5cm {\leaders\hrule\hfil}\par
    \hbox to5cm{\hfil\@author\hfil}
  }%
}  
\end{minipage}
\end{center}
\fi %\if@showhonesty
% dalsia strana ide pre podakovanie
\if\@podakovanie\relax%
  \@latex@warning{Je slusne uviest (\noexpand\podakovanie)}%
\else%
  \if@twoside\newpage\thispagestyle{empty}\null\fi % intentionally left blank to maintain odd pages
  \newpage\thispagestyle{empty}
  \par
  \null
  \vfill
  \begin{center}
  \begin{minipage}{12cm}
  \centerline{{\large\bfseries \thanksname}}\par\bigskip
  \@podakovanie
  \par
  \end{minipage}
  \end{center}
  \vskip2cm
\fi
% dalsia strana pre zadanie, vypiseme boilerplate varovanie
\if@disablespecwarning\relax
\else 
  \if@twoside\newpage\thispagestyle{empty}\null\fi % intentionally left blank to maintain odd pages
  \newpage\thispagestyle{empty}  
  \par
  \null
  \vfill
  \begin{center}
  \begin{minipage}{12cm}
  \flushleft
  {\LARGE\bf Namiesto tejto strany vlo\v{z}te zadanie z informa\v{c}n\'{e}ho syst\'{e}mu podp\'{\i}san\'{e} ved\'{u}cim \'{u}stavu!}\end{minipage}
  \end{center}
  \vfill
\fi
% dalsia strana pre abstrakt, treba doimplementovat situaciu, ked chyba
\if@twoside\newpage\thispagestyle{empty}\null\fi % intentionally left blank to maintain odd pages
\newpage%
% disable page numbering for abstracts
\pagestyle{empty}  
\par
\null
%set margin length for abstra[ck]ts
\newlength{\@abstractmargin}
\setlength{\@abstractmargin}{1.7cm}
%nasleduje slovensky ,,abstract"
\centerline{{\large\bfseries \@abstraktname}}\par\bigskip
\begin{list}{}{%
    \setlength{\topsep}{0pt}%
    \setlength{\leftmargin}{\@abstractmargin}%
    \setlength{\rightmargin}{\@abstractmargin}%
    \setlength{\listparindent}{\parindent}%
    \setlength{\itemindent}{\parindent}%
    \setlength{\parsep}{\parskip}%
  }%
  \item[]\@abstrakt
\end{list}
\par
\vspace{3cm}
\if@longabstracts\newpage\fi
%nasleduje anglicky ,,abstract"
\centerline{{\large\bfseries \@abstractname}}\par\bigskip
\begin{list}{}{%
    \setlength{\topsep}{0pt}%
    \setlength{\leftmargin}{\@abstractmargin}%
    \setlength{\rightmargin}{\@abstractmargin}%
    \setlength{\listparindent}{\parindent}%
    \setlength{\itemindent}{\parindent}%
    \setlength{\parsep}{\parskip}%
  }%
  \item[]\@abstract
\end{list}
\vfill
% restore page numbering
\thispagestyle{empty} % ... but leave last page without page number
\pagestyle{plain}  
}
%---------end custom maketitle
% check babel presence
\AtBeginDocument{%
	% \let vezme aktualne definovane \bibname v uplne expandovanej podobe. Kedze poradie v AtBeginDocument
	% je podla poradia loadovania (trieda ma prednost pred stylom babel), 
	% po naloadovani babelu sa hodnota \thesisbibname uz nezmeni (bude to hodnota
	% definovana v \bibname nizsie, Zoznam pouzitej literatury).
	% Ak babel nie je naloadovany, \thesisbibname bude expanziou \bibname, ktora sa moze s loadovanim
	% dalsich packagov menit.
	\@ifpackageloaded{babel}{%
		\iflanguage{slovak}{\let\thesisbibname\bibname\message{\thesisbibname}}{\def\thesisbibname{\bibname}}
	}{%
		%package slovak is deprecated, you are supposed to use babel.sty
		\@ifpackageloaded{slovak}{\let\thesisbibname\bibname}{\def\thesisbibname{\bibname}}
	}
}
%
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    }
  \if@titlepage
  \let\maketitle=\m@ketitle
\else
  \let\maketitle=\m@ketitle
\fi
\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{2}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@arabic\c@chapter}
\if@usesections
  \renewcommand \thesection {\@arabic\c@section}
\else
  \renewcommand \thesection {\thechapter.\@arabic\c@section}
\fi
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}
\newcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{plain}%
  \@tempswafalse
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \huge\bfseries \partname~\thepart
       \par
       \vskip 20\p@
     \fi
     \Huge \bfseries #2\par}%
    \@endpart}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries #1\par}%
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
               \if@openright
                \null
                \thispagestyle{empty}%
                \newpage
               \fi
              \fi
              \if@tempswa
                \twocolumn
              \fi}
\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \@makechapterhead{#2}%
                    \@afterheading
                    }
                    
%----------------------redefine \chapter and \chapter*
\if@thesischapterstyle
\newlength{\textwidthni}
%\@makechapterhead used on numbered chapters (see classes.dtx)
\def\@makechapterhead#1{%
  \hbox to \textwidth{%
  \leaders\hrule height8pt depth-7pt \hfil \ \ \Huge{\textbf{\thechapter}}
  \leaders\hrule height8pt depth-7pt \hskip1cm
  }
  \par
  \vskip3\bigskipamount minus 24pt %
  {%
    \textwidthni = \textwidth
    \advance\textwidthni by -\parindent
    \parbox{\textwidthni}{%
      \baselineskip=1.7\baselineskip
      \rightskip = 0pt plus 1fill
      \exhyphenpenalty=10000
      \hyphenpenalty=10000
      {\huge \bfseries #1}
    }%
  }%
  \par
  \vskip6\bigskipamount  
}
\def\@schapter#1{
                   \@makeschapterhead{#1}%
                   \@afterheading
                }
%\@makeschapterhead used on unnumbered chapters
\def\@makeschapterhead#1{%
  \hbox to \textwidth{%
  \leaders\hrule height8pt depth-7pt \hfil
  }
  \par
  \bigskip
  \bigskip  
  {%        
    \textwidthni = \textwidth
    \advance\textwidthni by -\parindent
    \parbox{\textwidthni}{%
      \baselineskip=1.7\baselineskip
      \rightskip = 0pt plus 1fill
      \exhyphenpenalty=10000
      \hyphenpenalty=10000
      {\huge \bfseries #1}
    }%
  }%
  \par
  \vskip6\bigskipamount  
}
\else%thesischapterstyle is off, use declaration from book.cls
\def\@makechapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      %\if@mainmatter %ignore mainmatter
        \huge\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 20\p@
      %\fi
    \fi
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \vskip 40\p@
  }}
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
    \vskip 40\p@
  }}
\fi
\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\Large\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\large\bfseries}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}
\setlength\leftmargini  {2.5em}
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\setlength\leftmarginv  {1em}
\setlength\leftmarginvi {1em}
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\if@compatibility
\newenvironment{titlepage}
    {%
      \@restonecolfalse\newpage
      \thispagestyle{empty}%
      \setcounter{page}\z@
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
\newenvironment{titlepage}
    {%
      \@restonecolfalse\newpage
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi
\newcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
%reset equation counter if necessary
\if@conteqnno%
  \renewcommand\theequation
    {\@arabic\c@equation}
\else%
  \renewcommand\theequation
    {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
  \@addtoreset{equation}{chapter}
\fi  
\newcounter{figure}
\if@usesections
  \renewcommand\thefigure{\@arabic\c@figure}
\else
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\fi
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}[chapter]
\if@usesections
  \renewcommand\thetable{\@arabic\c@table}
\else
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\fi

\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{2}
\if@usesections
    \newcommand\tableofcontents{%
        \@restonecolfalse
        \section*{\contentsname
            \@mkboth{%
               \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
        \@starttoc{toc}%
        \if@restonecol\twocolumn\fi
        }
 \else
    \newcommand\tableofcontents{%
         \@restonecolfalse
         \chapter*{\contentsname
             \@mkboth{%
                \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
         \@starttoc{toc}%
         \if@restonecol\twocolumn\fi
         }
\fi
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \begingroup
      \parindent \z@
      \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \newdimen\p@rindent \p@rindent=\parindent %save original \parindent
      \parindent \z@ 
      \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima      
      \hskip -\leftskip
      \hskip\p@rindent %emulate positive \parindent
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
\newcommand\listoffigures{%
    \@restonecolfalse
    \chapter*{\listfigurename
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \@restonecolfalse
    \chapter*{\listtablename
      \@mkboth{%
          \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }
%%%
%prikaz pre vygenerovanie znacky v thebibliography (tu: cislo v tvare [1], cisla
%sa beru z countera enumiv)
\renewcommand*{\@biblabel}[1]{[#1]} 
%prikaz pre vygenerovanie odkazu na citaciu (tu: cislo/text v tvare [F\"are, 1998])
\renewcommand*{\@cite}[1]{[#1]} 
%toto sa vykona, ak je v \bibitem zadany volitelny argument (v podstate
%"nevypisuj obsah volitelneho argumentu, namiesto neho ponechaj standardne
%cislovanie"
\def\@lbibitem[#1]#2{\item\if@filesw
      {\let\protect\noexpand
       \immediate
       \write\@auxout{\string\bibcite{#2}{#1}}}\fi\ignorespaces} 

%toto sa vykona, ak v \bibitem nie je zadany volitelny argument 
%(tu sa nic nezmenilo)
\def\@bibitem#1{\item\if@filesw \immediate\write\@auxout
       {\string\bibcite{#1}{\the\value{\@listctr}}}\fi\ignorespaces}        
%%%
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\chapter*{\thesisbibname
        \@mkboth{\MakeUppercase\thesisbibname}{\MakeUppercase\thesisbibname}}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\@restonecoltrue
                \columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{Obsah}
\newcommand\listfigurename{Zoznam obr\'azkov}
\newcommand\listtablename{Zoznam tabuliek}
\newcommand\bibname{Zoznam pou\v{z}itej literat\'{u}ry} 
\newcommand\indexname{Index}
\newcommand\figurename{Obr\'{a}zok} %XXX OVERIT
\newcommand\tablename{Tabu\v{l}ka}
\newcommand\partname{\v{C}as\v{t}}
\newcommand\chaptername{Kapitola}
\newcommand\appendixname{Dodatok}
\newcommand\universityname{Univerzita Pavla Jozefa \v{S}af\'arika v Ko\v{s}iciach}
\newcommand\facultyname{Pr\'{\i}rodovedeck\'a fakulta}
\newcommand\thesisname{pr\'aca}
\newcommand\studyprogrammename{\v{S}tudijn\a'{y} program}
\newcommand\fieldofstudyname{\v{S}tudijn\a'{y} odbor}
\newcommand\institutename{\v{S}koliace pracovisko}
\newcommand\tutorname{Ved\a'{u}ci z\a'{a}vere\v{c}nej pr\a'{a}ce}
\newcommand\counsellorname{Konzultant}
\newcommand\thanksname{Po\v{d}akovanie}
\if@thesisenglish
	\renewcommand\universityname{P. J. Safarik University}
	\renewcommand\facultyname{Faculty of Science}
	\renewcommand\thesisname{thesis}
	\renewcommand\studyprogrammename{Study programme}
	\renewcommand\fieldofstudyname{Field of Study}
	\renewcommand\institutename{Institute}
	\renewcommand\tutorname{Tutor}
	\renewcommand\counsellorname{Counsellor}
	\renewcommand\thanksname{Thanks}
\fi
%zakazane, uz je definovane v casti prikazov k Abstraktu --RN
%  \newcommand\abstractname{Abstract}


\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{plain}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\onecolumn
%-------------------------------------------------------
\endinput
%%
%% End of file `rnthesis.cls'.
