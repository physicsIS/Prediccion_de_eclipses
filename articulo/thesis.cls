% ------------------------------------
% Universidad de Costa Rica
% Facultad de Ingeniería
% Escuela de Ingeniería Química
% Esta plantilla fue tomada del curso (IE0499 - Proyecto Eléctrico) como ayuda para generar la clase.
%
% CLASE DE LATEX
% ------------------------------------

% Declaraciones iniciales
% -----------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{IQ_Thesis}[18/04/2017 Plantilla para reportes]

% Documento con espacios vacíos
\newif\ifvacio
\DeclareOption{vacio}{\vaciotrue}

% Cualquier otra opción se pasa a 'memoir'
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% Procesar las opciones
\ProcessOptions\relax

% Cargar la clase base ('article')
% --------------------------------

\LoadClass[12pt,a4paper,twoside]{article}

% Paquetes requeridos
% -------------------
% Nomenclatura
\RequirePackage[noprefix]{nomencl}

\makeatletter
\def\thenomenclature{%
  \mynomenclature{5}{\nomname}
\nompreamble
\list{}{%
\labelwidth\nom@tempdim
\leftmargin\labelwidth
\advance\leftmargin\labelsep
\itemsep\nomitemsep
\let\makelabel\nomlabel}}
\makeatother

\RequirePackage{ifthen}
\renewcommand\nomgroup[1]{%
  \ifthenelse{\equal{#1}{A}}{%
    \item[\textbf{Acrónimos}]}{%                A - Acronyms
  \ifthenelse{\equal{#1}{M}}{%
    \item[\textbf{Mayúsculas}]}{%           M - Capital
      \ifthenelse{\equal{#1}{N}}{%
    \item[\textbf{Minúsculas}]}{%           N - Non Capital
  \ifthenelse{\equal{#1}{G}}{%
    \item[\textbf{Griegas}]}{%           G - Greek
  \ifthenelse{\equal{#1}{S}}{%
    \item[\textbf{Superíndices}]}{%            S - Superscripts
  \ifthenelse{\equal{#1}{U}}{%
    \item[\textbf{Subíndices}]}{%              U - Subscripts
  \ifthenelse{\equal{#1}{X}}{%
    \item[\textbf{Otros}]}{%           X - Other Symbols
  {}}}}}}}}}
\renewcommand{\nomlabel}[1]{\hspace{1 em}#1}%{\hspace{1.5 em}#1}
\renewcommand*{\nompreamble}{\markboth{\nomname}{\nomname}}

\newcommand{\nomunit}[1]{%
  \renewcommand{\nomentryend}{\hspace*{\fill}#1}%
  }
\renewcommand{\nomname}{NOMENCLATURA}


\makenomenclature

%Secciones

% General
\RequirePackage[spanish, english]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lipsum}
\RequirePackage{array}
\usepackage{float}
\RequirePackage{multicol}
% Bibliografía
\renewcommand{\refname}{BIBLIOGRAFÍA}
\RequirePackage[authoryear,round,longnamesfirst]{natbib}
\renewcommand{\bibsection}{\textbf{BIBLIOGRAFÍA}}
% Unidades
\RequirePackage{tocloft}
\RequirePackage[separate-uncertainty=true]{siunitx}
\sisetup{%
  inter-unit-product=\ensuremath{{}\cdot{}},
  per-mode=symbol
  }%Con separador de punto y slash
  \sisetup{output-decimal-marker = {.}}%Punto como elemento decimal.
  % Figuras y Cuadros
\renewcommand{\cftfigfont}{\textbf{Figura} }
\renewcommand{\cfttabfont}{\textbf{Tabla} }
% Palabra 'Página' en índice
\addtocontents{toc}{\hfill \textit{Página} \par}
% Ambiente de muestra de cálculos
\newcounter{counter}[section]
\newenvironment{Sample}[1][]{\refstepcounter{counter}\par\medskip
   \noindent
   \textbf{C.\thecounter. #1} \bfseries}{\newline\medskip}
% Matemático
\RequirePackage{ucs}
\RequirePackage{amssymb,amsmath,bm,mathtools,amsthm}
\newcommand{\ihat}{\boldsymbol{\hat{\imath}}}
\newcommand{\jhat}{\boldsymbol{\hat{\jmath}}}
\newcommand{\khat}{\boldsymbol{\hat{k}}}

%Encabezado corrección
\RequirePackage{fancyhdr}
 
\pagestyle{fancy}
\fancyhf{}
\fancyhead[LE,RO]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\headwidth}{\textwidth}
\addtolength{\headheight}{\baselineskip}

% Páginas pares e impares
\RequirePackage{calc}%Calcula si el documento tiene un total de páginas pares o impares.

% Viñetas y encabezado de flotantes
\usepackage{pifont}%Fuentes para viñetas.
\RequirePackage[figurename=Figura, tablename= Tabla,labelsep=period]{caption} %Redefine el etiquetado de las figuras.

% Figuras
\DeclareCaptionStyle{figstyle}
 [format=hang,width=\textwidth,justification=centering,labelsep=period]
{format=hang,calcmargin={0pt,\widthof{\captionfont\captionlabelfont\figurename~\thefigure }},font=small,labelfont=bf,labelsep=period,width=\textwidth,justification=RaggedRight}
\captionsetup[figure]{style=figstyle}%Añade márgenes al etiquetado de figuras y añade un punto como elemento separador.

%Encabezados de flotantes
\RequirePackage{chngcntr}
\counterwithin{table}{section}
\renewcommand\thetable{\thesection.\arabic{table}}%Caption del cuadro seccionado.
\renewcommand\thefigure{\thesection.\arabic{figure}}%Caption del cuadro seccionado.

%Comandos de referenciado rápido
\newcommand{\Figref}[1]{ Figura~\ref{fig:#1}}
\newcommand{\Tabref}[1]{ Tabla~\ref{tab:#1}}
\newcommand{\eqnref}[1]{ ecuación~(\ref{eqn:#1})}

%Cuadros
\DeclareCaptionStyle{tabstyle}
[format=plain,width=\textwidth,justification=RaggedRight,labelsep=period]
{format=hang,calcmargin={0pt,\widthof{\captionfont\captionlabelfont\tablename~\thetable }},font=normal,labelfont=bf,labelsep=period,justification=RaggedRight,width=\textwidth,skip=-1pt}
\captionsetup[table]{style=tabstyle}%Añade márgenes al etiquetado de figuras y añade un punto como elemento separador.

%Rotación de flotantes
\RequirePackage{array}
%Nuevo tipo de alignment
\newcolumntype{W}{>{\centering\arraybackslash}X}%Para agilizar las columnas.
\newcolumntype{L}{>{\raggedleft\arraybackslash}X}%Para agilizar las columnas.
\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}
%Encabezado
\pagestyle{myheadings}%Añade la numeración a la derecha o a la izquierda dependiendo de la pariedad del documento.

%Hipervínculos
\usepackage[colorlinks=true,citecolor=black,linkcolor=black,urlcolor=blue,breaklinks=true]{hyperref}%Añade hipervínculos al PDF generado.

%Contadores para ecuaciones
\newcounter{defcounter}%Contador de las ecuaciones.
\setcounter{defcounter}{0}%Inicialización del contador de las ecuaciones.

%Ambiente de ecuaciones en muestra
\newenvironment{myequation}{%Nuevo ambiente de ecuaciones para la muestra de cálculos.
\addtocounter{equation}{-1}%Contador de las ecuaciones de la muestra de cálculos.
\refstepcounter{defcounter}%Referencia de los pasos del contador.
\renewcommand\theequation{C.\thedefcounter}%Forma en la que se desplegan las ecuaciones (C.1).
\begin{equation}}%Inicio del ambiente utilizado por myequation.
{\end{equation}}%Finalización del ambiente utilizado por myequation.

%Figuras flotantes
\RequirePackage[usenames, dvipsnames]{color}%Dar color al texto
%Columnas múltiples
\RequirePackage{multicol}%Convertir texto a doble columna de ser necesario.
%Tabulaciones autoajustadas
\RequirePackage{tabularx, longtable}%Realizar tablas que se ajusten al ancho del texto.
%Símbolo matemático
\RequirePackage{esint}%Símbolo de la integral cerrada.
%Unir celdas
\RequirePackage{multirow}%Se usa para combinar filas en los cuadros.

%Españolización
\addto\captionsenglish{\renewcommand\contentsname{ÍNDICE}}%Cambia index por índice.
\addto\captionsenglish{
\renewcommand\listtablename{ÍNDICE DE TABLAS}}%Cambia table index por índice de cuadros.
\addto\captionsenglish{
\renewcommand\listfigurename{ÍNDICE DE FIGURAS}}%Cambia figure index por índice de figuras.
\setlength{\cfttabnumwidth}{3.5em}
\setlength{\cftfignumwidth}{3.5em}

%Interlineado
\renewcommand{\baselinestretch}{1.5}%Interlineado a 1.5 pt.

%PÁGINAS EN BLANCO
\newcommand\blankpage{
    \newpage
    \null
    \thispagestyle{empty}%
    %\addtocounter{page}{0}%
    \newpage
}

%Texto por defecto
\RequirePackage{lipsum}%Ayuda a dar texto por defecto.
%Espaciado
\RequirePackage{setspace}%Permite dar espaciados.
%Fórmulas químicas
\RequirePackage{chemformula}%Paquete para fórmulas químicas.

% Nuevos comandos especiales
% --------------------------
%\newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1}}

%Viñeta de círculo vacío
\ifvacio
	\newcommand{\seleccionar}{\raisebox{4pt}{\circle{8}}}
\else
	\newcommand{\seleccionar}[1]{\raisebox{4pt}{\circle#1{8}}}
\fi




% Formato de la página y área de escritura
% ----------------------------------------
\usepackage{geometry}                         
	\geometry{right=25mm,left=35mm,top=35mm,bottom=25mm,headsep=1cm,footskip=1cm,nomarginpar}
    
% Textos predefinidos
\newcommand{\UCR}{\centering{\Huge{\textbf{\textsc{Universidad de Costa Rica}}}}}
\newcommand{\FI}{\centering{\LARGE{\textsc{Facultad de Ciencias Básicas}}\newline}}
\newcommand{\EIQ}{\centering{\LARGE{\textsc{Escuela de Física}}\newline}}
\newcommand{\IQ}[2]{\large{IQ0{#1}. Laboratorio de {#2}}}
\newcommand{\paper}{\large{\textit{\textsc{{Proyecto de graduación sometido a consideración de la escuela de Ingeniería Química como requisito final para optar por el grado de licenciatura en Ingeniería Química}}}}}
\newcommand{\reportnum}{\large{\textbf{\textit{\textsc{Anteproyecto de Investigación}}}}}
\newcommand{\reportname}[1]{\large{\textit{\textsc{{#1}}}}}
\newcommand{\por}{\textsc{por}}
\newcommand{\CURF}{\LARGE{\textsc{Ciudad Universitaria Rodrigo Facio}}\newline}
\newcommand{\experiment}{\textsc{Reporte X. Determinación XXX}}
\newcommand{\student}[1]{\textbf{{#1}}}
\newcommand{\profesor}[1]{\large{\textsc{Ing. {#1}}}}
\newcommand{\place}[2]{\textit{{#1}, {#2}.}}

%Para los subíndices y superíndices.
%\RequirePackage{fixltx2e}
\newcommand{\tsub}[1]{\textsubscript{#1}}
\newcommand{\tsup}[1]{\textsuperscript{#1}}

%SI con el punto multiplicatorio y slash divisorio.
\sisetup{%
  inter-unit-product=\ensuremath{{}\cdot{}},
  per-mode=symbol
  }

\RequirePackage{subfiles}
\RequirePackage{url}

\newcommand{\fref}[1]{la Figura~\ref{fig:#1}}
\newcommand{\tref}[1]{la Tabla~\ref{tab:#1}}
\newcommand{\eref}[1]{la ecuación~(\ref{eqn:#1})}
\usepackage{subfig}
\usepackage{commath}
\urlstyle{same}
\newcommand{\subfref}[1]{la Figura~\ref{subfig:#1}}
\setlength{\parindent}{0 mm}
\setlength{\parskip}{2 mm}
\setlength{\nomitemsep}{-\parsep}
\usepackage{easylist}
\newcommand{\uvec}[1]{\boldsymbol{\hat{\textbf{#1}}}}
\usepackage{xr} %Referencias de otro archivo .tex.
\renewcommand\qedsymbol{$\blacksquare$}
\overfullrule=1mm%Línea gruesa cuando se sale de los parámetros de página
\newcommand{\floor}[1]{\left\lfloor #1 \right\rfloor}
\newcommand{\ceil}[1]{\left\lceil #1 \right\rceil}

\RequirePackage{svg}
\usepackage{xcolor}
\usepackage{listings}

\lstdefinestyle{Python}{
    language        = Python,
    basicstyle      = \ttfamily,
    keywordstyle    = \color{blue},
    keywordstyle    = [2] \color{teal}, % just to check that it works
    stringstyle     = \color{green},
    commentstyle    = \color{red}\ttfamily
}
\lstset{
    frame       = single,
    numbers     = left,
    showspaces  = false,
    breaklines  = true,
    showstringspaces    = false,
    captionpos  = t,
    caption     = none
}
\renewcommand{\lstlistingname}{Algoritmo}

\lstset{ %
  language=R,                     % the language of the code
  basicstyle=\footnotesize,       % the size of the fonts that are used for the code
  numbers=left,                   % where to put the line-numbers
  numberstyle=\tiny\color{gray},  % the style that is used for the line-numbers
  stepnumber=1,                   % the step between two line-numbers. If it's 1, each line
                                  % will be numbered
  numbersep=5pt,                  % how far the line-numbers are from the code
  backgroundcolor=\color{white},  % choose the background color. You must add \usepackage{color}
  showspaces=false,               % show spaces adding particular underscores
  showstringspaces=false,         % underline spaces within strings
  showtabs=false,                 % show tabs within strings adding particular underscores
  frame=single,                   % adds a frame around the code
  rulecolor=\color{black},        % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. commens (green here))
  tabsize=2,                      % sets default tabsize to 2 spaces
  captionpos=t,                   % sets the caption-position to bottom
  breaklines=true,                % sets automatic line breaking
  breakatwhitespace=false,        % sets if automatic breaks should only happen at whitespace
  title=\lstname,                 % show the filename of files included with \lstinputlisting;
                                  % also try caption instead of title
  keywordstyle=\color{blue},      % keyword style
  commentstyle=\color{dkgreen},   % comment style
  stringstyle=\color{mauve},      % string literal style
  escapeinside={\%*}{*)},         % if you want to add a comment within your code
  morekeywords={*,...}            % if you want to add more keywords to the set
} 
%\renewcommand{\specialcell}[2][c]{%
%\begin{tabular}[#1]{@{}c@{}}#2\end{tabular}}
  
  \RequirePackage{graphicx}
  
  %\RequirePackage{subcaption}
  \RequirePackage{placeins}
  \RequirePackage{makecell}
  \renewcommand{\cftfigpresnum}{\bfseries}
  \renewcommand{\cfttabpresnum}{\bfseries}
  \usepackage{rotating}
\endinput
%%%%%%%%%