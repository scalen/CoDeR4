DOC = article
LTX = $(DOC).toc $(DOC).aux $(DOC).log
BIB = $(DOC).bbl $(DOC).blg
GLOS = glossary
INDX = index

document: $(BIB) $(GLOS) $(INDX)
	@echo Completeing document...;
	@pdflatex $(DOC).tex;# 1> /dev/null;
	@echo  \* Document complete!

$(BIB): $(LTX)
	@echo Creating reference list...;
	@-bibtex $(DOC);# 1> /dev/null;
	@echo  \* Reference list complete! Inserting...;
	@pdflatex $(DOC).tex;# 1> /dev/null;
	@echo  \* Reference list inserted!

$(GLOS): $(LTX)
	@echo Creating and inserting glossary...;
	@-makeindex -s $(DOC).ist -t $(DOC).glg -o $(DOC).gls $(DOC).glo;# 1> /dev/null;
	@echo  \* Glossary inserted!

$(INDX): $(LTX)
	

$(LTX): 
	@pdflatex $(DOC).tex;# 1> /dev/null

graphics: 


clean: cleanbibtex cleanglossary cleanlatex
	@echo  \* Directory clean!

cleanbibtex:
	@echo \* Cleaning temporary bibtex files...;
	@rm -f **/*.bbl *.bbl;
	@rm -f **/*.blg *.blg;
	@echo  \* Directory bibtex free!

cleanglossary:
	@echo \* Cleaning temporary glossary files...;
	@rm -f **/*.toc *.toc;
	@rm -f **/*.lof *.lof;
	@rm -f **/*.lot *.lot;
	@echo  \* Directory latex free!

cleanlatex:
	@echo \* Cleaning temporary latex files...;
	@rm -f **/*.aux *.aux;
	@rm -f **/*.log *.log;
	@rm -f **/*.out *.out;
	@rm -f **/*.spl *.spl;
	@echo  \* Directory latex free!

clobber: clean
	@echo \* Cleaning output pdf files...;
	@rm -f *.pdf;
	@echo  \* Directory pdf free!
