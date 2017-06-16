%%
%% Customizações do abnTeX2 (http://abnTeX2.googlecode.com) para a 
%% 		Programa de Pós-Graduação em Ciência da Computação da
%% 		Universidade Federal de São Carlos
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is Gabriel M. Alves, alvesmgabriel@gmail.com
%%
%% Further information about abnTeX2 are available on http://abntex2.googlecode.com/
%%

%% A classe 'ppgccufscar2' pode ser considerada uma segunda versão da classe 'ppgccufscar'.
%% A principal mudança foi a adaptação à suíte abnTeX2 que atende as várias normas da
%% Associação Brasileira de Normas Técnicas (ABNT) e, portanto, é uma customização
%% da referida suíte.
%% Mais informações em http://www.abntex.net.br/
%%
%% Autores da 'primeira versão' (ppgccufscar):
%%	Profa. Sandra Fabbri, Prof. Márcio, Daniel Beck e Daniel Bruno
%% 
%% Ultima atualização: 25-04-2017
%% Data de criação...: 30-03-2017

% ------------------------------------------------------------------------------
% Define a classe 'ppgccfuscar2' com base na classe 'abntex2' e
% define valores padrões
%TODO: Verificar uma maneira de traduzir para outros idiomas.

% Cria a classe 'ppgccufscar2'
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ppgccufscar2}[2017/04/01 v2.0 PPGCC UFSCar Dissertations and Thesis]

% Repassa todos os parâmetros desconhecidos por esta classe
% para a classe 'abntex2'. Deve-se carrega-la depois desses comandos.
% Isso é importante para que o usuario possa passar comandos
% diretamente para a classe abntex2.
\DeclareOption* { \PassOptionsToClass {\CurrentOption} {abntex2} }

% Opções 'padrões' da classe 'ppgccufscar2'
\PassOptionsToClass{
	% -- opções da classe abntex2 --
	sumario=tradicional,	% Utiliza o sumário tradicional, ao invés da norma ABNT NBR 6027:2012
	% -- opções da classe memoir --
	12pt, 			% Tamanho da fonte para todo o documento
	openright,		% capítulos começam em pág ímpar (insere página vazia caso preciso). Não faz sentido para 'oneside'
	oneside,		% Para impressão somente no anverso.
	a4paper, 		% Tamanho do papel
	% -- opções do pacote babel --
	brazil 			% o último idioma é o principal do documento (neste caso é único, não inserir mais para evitar warnings)
}{abntex2}

% -----------------------------------------------------------------------------
% Opções da classe 'ppgccufscar'
% Não identifiquei como a classe 'ppgccufscar' atribuia o título de 'Doutor'
% quando se usava a opção 'quali' para qualificação de doutorado. Para o caso de
% qualificação de mestrado é compressível, pois o valor padrão de \PPGtipotitulo é
% 'Mestre' e usar a opção 'quali' não o alterava. Por conta disso, criei duas
% variações de 'quali': qualim (p/ mestrado) e qualit (p/ doutorado).
% Obs.: Não dá para usar \tipotrabalho, pois a classe 'abntex2' não foi carregada neste ponto.

% Tipo da monografia e referido titulo
% Modo de usar:
%	mestrado (padrão):	\documentclass{ppgccufscar}
%	quali mestrado...:	\documentclass[qualim]{ppgccufscar}	
%	quali doutorado..:	\documentclass[qualit]{ppgccufscar}	
%	doutorado........:	\documentclass[tese]{ppgccufscar}

% -- Mestrado. Valor padrão
\providecommand{\PPGtipodoc}{Disserta\c{c}\~ao}
\providecommand{\PPGtipotitulo}{Mestre}

% -- Qualificação de mestrado: opção 'qualim'. Não possui titulação
\DeclareOption{qualim}{\renewcommand{\PPGtipodoc}{Qualifica\c{c}\~ao}}

% -- Qualificação de mestrado: opção 'qualit'. Título: Doutor
\DeclareOption{qualit}{\renewcommand{\PPGtipodoc}{Qualifica\c{c}\~ao}\renewcommand{\PPGtipotitulo}{Doutor}}

% -- Doutorado: opção 'tese'. Título: Doutor
\DeclareOption{tese}{\renewcommand{\PPGtipodoc}{Tese}\renewcommand{\PPGtipotitulo}{Doutor}}

% -----------------------------------------------------------------------------
% Carrega a classe 'abntex2' que será a base da classe 'ppgccufscar2'
\ProcessOptions\relax
\LoadClass{abntex2}

% ------------------------------------------------------------------------------
% Pacotes requeridos para a classe 'ppgccufscar2'. Usa-se o 'requirepackage' ao inves
% do 'usepackage', pois ele garante que o pacote será carregado uma única vez.

% ---
% Pacotes fundamentais 
% ---
% Pacote 'times' está obsoleto, ao invés disso usar 'mathptmx' (ver: http://www.ctan.org/pkg/times)
% Atualização: ao usar o 'mathptmx' a configuração da capa ficou diferente utilizando os mesmos
%	parâmetros estabelecidos em 'ppgccufscar'
\RequirePackage{times}				% Usa a fonte Times New Roman
%TODO: Incluir verificação de qual compilador está em uso (Manual abntex2, p. 14)
\RequirePackage[T1]{fontenc}		% Selecao de codigos de fonte.
\RequirePackage[utf8]{inputenc}		% Codificacao do documento (conversão automática dos acentos)
% -- fim TODO
\RequirePackage{indentfirst}		% Indenta o primeiro parágrafo de cada seção.
\RequirePackage{color}				% Controle das cores
\RequirePackage{graphicx}			% Inclusão de gráficos
\RequirePackage{microtype} 			% para melhorias de justificação
\RequirePackage{lastpage}			% Usado para obter a última página do arquivo e montar a ficha catalográfica
% ---

% ---
% Pacotes de citações
% ---
\RequirePackage[brazilian,hyperpageref]{backref}	 % Paginas com as citações na bibl
\RequirePackage[alf,           % estilo alfabético (autor, data)
			bibjustif,         % aplica o formato justificado às referências
			abnt-etal-cite=2,  % usa o et. al. para trabalhos com MAIS de dois autores
			abnt-and-type=e,   % usa o 'e' ao invés do '&', como em "Fonseca e Soares"
			abnt-etal-list=0   % lista todos os autores nas referências, senão apresenta 'et.al.'
			]{abntex2cite}	   % Citações padrão ABNT
			
% ---
% Pacotes adicionais
% ---
\RequirePackage{makeidx}					% Produzir índice remissivo de palavras
\RequirePackage{multicol}
\RequirePackage{multirow}
%TODO: criar variável booleana indicando se deve, ou não, carregar o pacote
%\RequirePackage[style=index]{glossaries}	% Gerar o glossário
%\makeglossaries

% -----------------------------------------------------------------------------
% Comandos gerais

% Comando para definir a area de concentracao, p.ex.: Eng. Software, IA, PIS, etc
\providecommand{\PPGareaconcentracao}{}
\newcommand{\areaconcentracao}[1]{\renewcommand{\PPGareaconcentracao}{#1}}

% comando para inserir sumário no documento
\newcommand{\inserirsumario}{
	\pdfbookmark[0]{\contentsname}{toc}
	\tableofcontents*
	\cleardoublepage
}

% comando para inserir lista de quadros
\newcommand{\inserirlistadequadros}{
	\pdfbookmark[0]{\listofquadrosname}{loq}
	\listofquadros*
	\cleardoublepage
}

% comando para inserir lista de tabelas
\newcommand{\inserirlistadetabelas}{
	\pdfbookmark[0]{\listtablename}{lot}
	\listoftables*
	\cleardoublepage
}

% comando para inserir lista de figuras
\newcommand{\inserirlistadefiguras}{
	\pdfbookmark[0]{\listfigurename}{lof}
	\listoffigures*
	\cleardoublepage	
}

% -----------------------------------------------------------------------------
% Comandos de dados

% -- Define nome padrão da instituição
\instituicao{Universidade Federal de S\~ao Carlos}

% -- Detalhes da instituição
\providecommand{\ABNTinstituicaodetalhe}{Centro de Ci\^encias Exatas e de Tecnologia\par
	Programa de P\'os-Gradua\c{c}\~ao Em Ci\^encia da Computa\c{c}\~ao}

% -- Define local padrão
\local{S\~ao Carlos -- SP}

% -- Define o preambulo utilizado na folha de rosto
\preambulo{\PPGtipodoc\ apresentada ao Programa de P\'os-Gradua\c{c}\~ao em Ci\^encia da Computa\c{c}\~ao da Universidade Federal de S\~ao Carlos, como parte dos requisitos para a obten\c{c}\~ao do t\'{\i}tulo de \PPGtipotitulo\ em Ci\^encia da Computa\c{c}\~ao, \'area de concentra\c{c}\~ao: \PPGareaconcentracao.}

% redefine o título que antes era 'Lista de abreviaturas e siglas'
\renewcommand{\listadesiglasname}{Lista de siglas}

% redefine o título que antes era 'Lista de ilustrações' (precisa do \addto\captionsbrazil)
\addto\captionsbrazil{
	\renewcommand{\listfigurename}{Lista de figuras}
}
% -----------------------------------------------------------------------------
% Configurações gerais
% Essa seção é baseada no modelo acessado em https://github.com/cfgnunes/latex-cefetmg

% Retira o espaço extra desnecessário nas frases
\frenchspacing

% Configurações do pacote backref usado sem a opção hyperpageref de backref
\renewcommand{\backrefpagesname}{Citado na(s) p\'agina(s):~}

% Texto padrão antes do número das páginas
\renewcommand{\backref}{}

% Define as listas de item compactas (sem espaçamento entre os itens)
%\setlist{noitemsep, topsep=0pt, parsep=0pt, partopsep=0pt}

% Define os textos da citação
\renewcommand*{\backrefalt}[4]{%
	\ifcase #1
	Nenhuma cita\c{c}\~ao no texto.
	\or
	Citado na p\'agina #2.
	\else
	Citado #1 vezes nas p\'aginas #2.
	\fi
}

% -------
% Espaçamentos entre linhas e parágrafos 
% O tamanho do parágrafo é dado por:
\setlength{\parindent}{1.3cm}

% Controle do espaçamento entre um parágrafo e outro:
\setlength{\parskip}{0.2cm}  % tente também \onelineskip

% Configuração das margens
% Obs.: Os comandos abaixo são da classe Memoir. Para alcançar o valor
%	estabelecido das margens: esquerda e superior = 3cm;
%	direita e inferior = 2cm; na prática foi preciso ajudar os valores
%	empiricamente como indicado abaixo. É preciso compreender melhor
%	a classe Memoir a fim de ajustar o valor objetivamente.
\setlrmarginsandblock{2.6cm}{1.6cm}{*}
\setulmarginsandblock{2.7cm}{1.7cm}{*}
\checkandfixthelayout

% ------------------------------------------------------------------------------
% Configurações de aparência do PDF final

% alterando o aspecto da cor azul
\definecolor{blue}{RGB}{41,5,195}

% informações padrão do PDF
% a pessoa pode chamar o comando \hypersetup em seu arquivo tex e adicionar
% outras informações como:
%	pdftitle: titulo,
%	pdfauthor: autor,
%	pdfsubject: assunto e,
%	pdfkeywords: palavras-chaves separadas por vírgula
\hypersetup{
	pdfcreator={LaTeX with ppgccufscar2 and abnTeX2},
	colorlinks=true,       		% false: boxed links; true: colored links
	linkcolor=blue,          	% color of internal links
	citecolor=blue,        		% color of links to bibliography
	filecolor=magenta,      	% color of file links
	urlcolor=blue,
	bookmarksdepth=4
}


% ------------------------------------------------------------------------------
% Fontes e formatos
% Redefine a configuração de fontes e formatos de acordo com o modelo
% estabelecido pelo PPGCC-UFSCar

\renewcommand{\ABNTEXchapterfont}{\bfseries}								% título de capítulo
\newcommand{\formatoinstituicao}{\sffamily\bfseries\Large\MakeUppercase}	% \instituicao
\newcommand{\formatoinstituicaodetalhe}{\sffamily\MakeUppercase}			% \ABNTinstituicaodetalhe
\newcommand{\formatotitulo}{\sffamily\LARGE\bfseries\MakeUppercase}			% título do trabalho
\newcommand{\formatoautor}{\large\scshape\bfseries}							% autor do trabalho
\newcommand{\formatoorientador}{\large\scshape\bfseries}					% orientador
\newcommand{\formatodatalocal}{\large}										% data e local
% \captionanemfont e \captiontitlefont são comandos da classe Memoir.
% Aqui altero-os para formatar as legendas em negrito.
\captionnamefont{\bfseries}													% rótulo da legenda (Figura, Tabela, etc)
\captiontitlefont{\bfseries}												% corpo da legenda (descrição)

% ------------------------------------------------------------------------------
% Estilo da primeira página do capítulo (baseado em 'ppgccufscar')
% O motivo de reescrever o estilo do capítulo está no fato de que a classe
% Memoir, base da classe abntex2, entra em conflito com o pacote 'fancyhdr'
% utilizado na versão anterior da 'ppgccufscar' juntamente com o pacote 'fncychap'.
% Portanto, ao reescrever deixei de importar os referidos pacotes que causavam conflito.

% linha usada para separar o titulo da capitulo do texto
\newcommand{\sectionline}{
	\rule[-13pt]{\linewidth}{1pt}\\
	\rule{\linewidth}{3pt}\\
	\rule[25pt]{\linewidth}{1pt}
}

% Crio estilo 'ecdc' (Estilo de Capitulo do DC)
\makechapterstyle{ecdc} {
	% formatação do rótulo do capítulo, p.ex.: "Capítulo 1".
	% \chapnumfont: define a formatação para o número obtido pela macro \thechapter
	\renewcommand{\chapnumfont}{\fontsize{36pt}{38pt}\selectfont\bfseries\raggedleft}
	% \chapnamefont: define a formatação para o texto do rótulo obtido pela macro \@chapapp (ex: 'Capítulo')
	% eu poderia ter usado o \chapnumfont, mas resolvi redefinir \chapnamefont a fim de facilitar a leitura
	\renewcommand{\chapnamefont}{\fontsize{36pt}{38pt}\selectfont\bfseries\raggedleft}
	% imprime o rótulo do capítulo obtido por \@chapapp
	\renewcommand\printchaptername{\chapnamefont \@chapapp}
	% imprime o número do capítulo. '\thechapter' é o valor do rótulo, p. ex.: 'Capítulo 1'
	\renewcommand\printchapternum{\chapnumfont \thechapter}
	% ajusta a distância entre o rótulo e o texto do capitulo	
	%TODO: ajustar conforme estabelecido em 'ppgccufscar', pois a distância está menor.
	\renewcommand\afterchapternum{\par}

	% formatação do título do capítulo, conforme 'ppgccufscar', ou seja:
	% alinhado à esquerda (raggedleft), grande (LARGE), fonte (bfseries), versalete (scshape)
	% obs.: retirei \raggedleft e o titulo 'referencias' voltou a ficar centralizado enquanto que
	%	que os demais titulos (numerados) permaneceram alinhados à esquerda.
	\renewcommand{\chaptitlefont}{\LARGE\scshape\bfseries}
	% imprime o titulo do capitulo
	\renewcommand\printchaptertitle[1]{\chaptitlefont ##1}
	% ajusta posição e imprime a linha
	\renewcommand{\afterchaptertitle}{\\[-20pt]\normalsize\sectionline\par\nobreak}	
	
	% formatação do capítulo não numerado
	% Obs2.: Não foi preciso alterar o \afterchaptertitle
	% Obs.: O capitulo é centralizado, e altero o comando \afterchaptertitle.
	%	Preciso verificar se \vspace{1cm} é suficiente.
	%	\renewcommand{\afterchaptertitle}{\par\vspace{1cm}}
	\renewcommand{\printchapternonum}{\centering}	
}
% Aplico o estilo de capitulo criado.
\chapterstyle{ecdc}

% -----------------------------------------------------------------------------
% Sumário

% Insere o travessão no sumário
\renewcommand{\cftchapteraftersnum}{\hfill\textendash\hfill}

% Insere espaço entre os itens do sumário de diferentes capítulos
\setlength{\cftbeforechapterskip}{1.0em \@plus\p@}

% altera a formatação dos capitulos
% obs.: há um problema em colocar a fonte em caixa alta (uppercase) utilizando
%	hyperref (hyperlinks). Não consegui resolver, por isso uso o \scshape
%	por enquanto. Ver página 158 do manual da classe Memoir.
%TODO: Alterar o formato dos capitulos, no sumario, para caixa alta
\renewcommand{\cftchapterfont}{\large\bfseries\scshape}

% insere a palavra 'Capítulo' antes do número
\renewcommand*{\cftchaptername}{Cap\'itulo\space}


% ------------------------------------------------------------------------------
% Capa (item obrigatório, trata-se da capa externa do trabalho)
% Redefine o comando \imprimircapa conforme configurações estabelecidas em 'ppgccufscar'
% * Retirei o ambiente capa, por isso inclui o \cleardoublepage. Não sei o motivo de \titlingpage
%TODO: Incluir verificação se os campos estão preenchidos, como no caso de co-orientador? 

\makeatletter
\renewcommand{\imprimircapa}{
	\begin{capa}
		\begin{center}
	
			% imprime instituição e o detalhe da instituição
			{\formatoinstituicao\imprimirinstituicao\par}
			{\formatoinstituicaodetalhe\ABNTinstituicaodetalhe\par}
			\vfill\vfill
			
			% imprime o titulo do trabalho
			{\formatotitulo\imprimirtitulo\par}
			\vfill
	
			% imprime o nome do autor	
			{\formatoautor\imprimirautor}
			\vfill
	
			% imprime o orientador do trabalho e co-orientador, se houver
			{\formatoorientador\imprimirorientadorRotulo~ \imprimirorientador}
			% se a macro \orientador não estive vazia (verifico isso mandando imprimi-la, \imprimircorientador)
			\abntex@ifnotempty{\imprimircoorientador}{
				{\par\formatoorientador\imprimircoorientadorRotulo~ \imprimircoorientador}
			}
			\vspace*{1cm}
			\vfill\vfill\vfill
		
			% imprime o local e data
			\begin{SingleSpacing}
				\setlength{\parskip}{.3cm}
				{\formatodatalocal\imprimirlocal}\par
				{\formatodatalocal\imprimirdata}
			\end{SingleSpacing}
			\vspace*{1cm}
		\end{center}
	\end{capa}
	
}
\makeatother

% ------------------------------------------------------------------------------
% Folha de rosto (item obrigatório, trata-se da capa interna do trabalho)
% Redefine o comando \folhaderosotocontent conforme configurações estabelecidas em 'ppgccufscar'
% Ela é baseada na 'capa' definida acima.

\makeatletter
\renewcommand{\folhaderostocontent}{
	\begin{center}
		% imprime instituição e o detalhe da instituição
		{\formatoinstituicao\imprimirinstituicao\par}
		{\formatoinstituicaodetalhe\ABNTinstituicaodetalhe\par}
		\vfill\vfill
		
		% imprime o titulo do trabalho
		{\formatotitulo\imprimirtitulo\par}
		\vfill
		
		% imprime o nome do autor	
		{\formatoautor\imprimirautor}
		\vfill
	\end{center}
	
	% imprime o preâmbulo da folha de rosto (é o que diferencia da capa)
	% segundo modelo 'ppgccufscar' não é impresso o nome dos co-orientadores nesta página, se houver.
	\vspace{.8cm}
	\noindent\hspace*{0.45\textwidth}
	% O valor -3mm é empirico
	\begin{minipage}{.55\textwidth - 3mm}
		\begin{SingleSpacing}
			{\imprimirpreambulo}\par
			{\imprimirorientadorRotulo~ \imprimirorientador}
		\end{SingleSpacing}
	\end{minipage}
	\vspace{.8cm}
	\vfill\vfill\vfill
	\center
	
	% imprime o local e data
	\begin{SingleSpacing}
		\setlength{\parskip}{.3cm}
		{\formatodatalocal\imprimirlocal}\par
		{\formatodatalocal\imprimirdata}
	\end{SingleSpacing}
	\vspace*{1cm}
}
\makeatother

% ------------------------------------------------------------------------------ 
% Cria o ambiente QUADRO
% Fonte: https://github.com/abntex/abntex2/wiki/HowToCriarNovoAmbienteListing

\newcommand{\quadroname}{Quadro}
\newcommand{\listofquadrosname}{Lista de quadros}

\newfloat[chapter]{quadro}{loq}{\quadroname}
\newlistof{listofquadros}{loq}{\listofquadrosname}
\newlistentry{quadro}{loq}{0}

% configurações para atender às regras da ABNT
\counterwithout{quadro}{chapter}
\renewcommand{\cftquadroname}{\quadroname\space} 
\renewcommand*{\cftquadroaftersnum}{\hfill--\hfill}
