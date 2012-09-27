default: main.pdf

include figs/Makefile
LATEX=pdflatex --synctex=1 -halt-on-error 
FIGS=$(addsuffix .pdftex,$(addprefix figs/,$(FIGLIST)))
TEXS=abstract ack appone apptwo bibl dedquot graph ind intro minor mydefs preface results sfudefs titapp conc background next
TEXFILES=$(addsuffix .tex,$(addprefix texfiles/,$(TEXS)))
ENV=TEXINPUTS=./texfiles/:

main.pdf: main.tex $(TEXFILES) $(FIGS) myrefs.bib mydict.txt
	$(ENV) $(LATEX) $<
	bibtex $(@:.pdf=) > bibtex.log
	$(ENV) $(LATEX) $< > /dev/null
	./check $(@:.pdf=) $(TEXFILES)

clean:
	rm main.aux  main.bbl  main.blg  main.log main.synctex.gz main.lof main.lot *.aux
	make -C figs cleanfigs

fixdict:
	./addtodict $(TEXFILES)

