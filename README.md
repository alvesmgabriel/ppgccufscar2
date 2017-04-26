# Modelo para trabalhos acadêmicos usando abnTeX2

**ppgccufscar2** é uma classe LaTeX voltada para a produção de trabalhos acadêmicos (dissertações e teses) no Programa de Pós-Graduação do Departamento de Ciência da Computação da UFSCar. Ela é baseada na suíte _abnTeX2_ bem como na classe <tt>ppgccufscar.cls</tt>, atualmente utilizada pelo Programa.

:exclamation: **Essa classe está em fase inicial de desenvolvimento e _não_ substitui os modelos disponibilizados pelo PPGCC-UFSCar.**

### Utilização
* É preciso instalar a suíte [abnTeX2](http://http://www.abntex.net.br/)
* É preciso copiar o arquivo <tt>ppgccufscar2.cls</tt> para o diretório em que será criado o documento
* A estrutura geral do documento (arquivo <tt>.tex</tt>) é:
```latex
\documentclass{ppgccufscar2}
% preâmbulo do documento .tex, inclui dados do documento como: título e orientador(es)

\begin{document}
% capa e folha de rosto
\imprimircapa
\imprimirfolhaderosto

% elementos pré-textuais (obrigatório)
\pretextual
% inclusão de epígrafe, agradecimentos, resumos, sumrio, etc

% elementos textuais (obrigatório)
\textual
% inclusão dos capítulos do trabalho

% elementos pós-textuais (obrigatório)
\postextual
% referências bibliográficas (arquivo .bib)
\bibliography{refs}

% inclusão de outros elementos pós-textuais
\end{document}
```

### Funcionalidades
Versão atual:
  * capa e folha de rosto de acordo com o modelo PPGCC-UFSCar;
  * comandos para inclusão de listas de figuras, tabelas e quadros;
  * comando para inclusão de sumário;
  * criação do estilo de capítulos (numerado e não-numerado) de acordo com modelo PPGCC-UFSCar;
  * estilo do sumário com hyperlinks;
  * citação de referências bibliográficas com hyperlinks e indicação de quantas vezes foi citada.

Próxima versão:
  * criação de comandos para inclusão de lista de algoritmos;
  * facilitar a inclusão de ficha catalográfica e de aprovação;
  * verificar comportamento da inclusão de glossário, anexos, apêndices e índice remissivo;
  * adequar estilo de legendas de acordo com modelo PPGCC-UFSCar;
  * elaborar manual para os usuários.
