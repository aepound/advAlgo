


PROJECT= hw1_Pound.pdf
LTXOUT= hw1.pdf

FIGURES=prob1a.eps prob1b.eps
PDFFIGS=prob1a.pdf prob1b.pdf
SCRIPT=hw1.m
TABLES=prob1a.tex prob1b.tex
MATOUT= $(FIGURES) $(PDFFIGS) $(TABLES)


PROJECT: $(LTXOUT)
		 cp $(LTXOUT) hw1_Pound.pdf

$(LTXOUT): $(MATOUT)
		pdflatex hw1.tex

$(MATOUT): $(SCRIPT)
		 matlab -r "$(basename $(SCRIPT)); exit"

#$(PDFFIGS): $(FIGURES)
#		 ps2pdf -EPSCrop $(FIGURES)


clean: 
	   rm -f *.eps *.pdf
	   rm -f $(TABLES)






