This article makes use of the following latex packages:

amsmath
amsfonts
amssymb
amsthm
amscd
hyperref
subfig
import

To build the article using pdflatex and bibtex, simply run:

$ make

To remove temporary files produced by pdflatex and bibtex, run:

$ make clean

You may also build the paper manually by running a combination of:

$ pdflatex article.tex

or equivalent compiling program, and:

$ bibtex article