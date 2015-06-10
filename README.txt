3rd Year Project - Latex Template
---------------------------------
Usage
-----
	Main Document
	-------------
	N.B. THERE IS NO NEED TO EDIT THE CONTENTS OF THE template DIRECTORY !
	
	preamble.tex sets up the formatting of the document and the title page.  It also imports the top matter from personal_details.tex in the content folder.
	
	project_brief.tex is the template that defines the layout of the first document, the content is in these .tex files in the content folder:
	description.tex
	scope.tex
	goal.tex

	progress_report.tex is the template that defines the layout of the progress report, the content is in these .tex files in the content folder:
	[files]
	
	project.tex is the template that defines the layout of the final document, the content is defined in the .tex files in the content folder:
	abstract.tex
	acknowledgements.tex
	introduction.tex
	design.tex
	conclusions.tex
	
	Bibliography
	------------
	bibliography.bib contains the reference source for the project.  It will automatically include in the References section of the finished document any references for books you have cited in the rest of the document, and only those references.  As such it is probably good practice to write a bibitem (a bibliography item in the .bib file) for any resource you read that is of any academic value at all.  That way, if you want to cite it, all you have to do is write the cite in the document body and the reference will be included automatically.  Also, this file can act as an anotated bibliography, as any text placed outside of the
	@type{...
	...
	}
	structure is ignored by bibtex (the Latex bibliography compiler).

	Makefile
	--------
	N.B. THERE IS NO NEED TO EDIT THE makefile !

	To build the entire document (including bibliography, glossary, index, etc.) into a pdf just run the following on the command line from within the template directory:
	$ ./latexbuild.sh [document name]
	where [document name] is "project" if the document you are trying to produce is the final document (i.e. project.tex).

	To format any individual tex file in the content directory in the prescribed document format (whilst providing access to the bibliography and glossary) run the following on the command line from within the template directory:
	$ ./latexbuild.sh -t"[title]" [content document name]
	where [content document name] is "risk" of the section you are trying to produce is the Risk Analysis section (i.e. risk.tex) and [title] is any title you want to give the sub document (e.g. "Risk Analysis") (spaces are permitted only as long as quotes are used or the spaces are escaped).

	To remove remove any built pdf's, use
	$ make clobber
