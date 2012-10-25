default: main.pdf slides.pdf handout.pdf 4in1.pdf

include figs/Makefile
LATEX=pdflatex --synctex=1 -halt-on-error 
FIGS=$(addsuffix .pdftex,$(addprefix figs/,$(FIGLIST)))
TEXS=main abstract ack appone apptwo bibl dedquot graph ind intro minor mydefs preface results sfudefs titapp conc background next
TEXFILES=$(addsuffix .tex,$(addprefix texfiles/,$(TEXS)))
ENV=TEXINPUTS=./texfiles/:
SLIDES=texfiles/slides.tex

main.pdf: $(TEXFILES) $(FIGS) myrefs.bib mydict.txt
	$(ENV) $(LATEX) $<
	bibtex $(@:.pdf=) > bibtex.log
	$(ENV) $(LATEX) $< > /dev/null
	./check $(@:.pdf=) $(TEXFILES)

slides.pdf: $(SLIDES) $(FIGS)
	$(ENV) $(LATEX) $<

handout.pdf: $(SLIDES) $(FIGS)
	$(ENV) $(LATEX) -jobname handout "\def\handout{}\input{$<}"

4in1.pdf: handout.pdf 
	$(ENV) $(LATEX) -jobname 4in1 "\
\documentclass[a4paper]{article}\
\usepackage{pdfpages}\
\begin{document}\
\includepdf[pages=1-last,nup=2x2,landscape=true,frame=true,\
            noautoscale=false,scale=1,delta=5mm 5mm]{$<}\
\end{document}"

clean:
	rm main.aux  main.bbl  main.blg  main.log main.synctex.gz main.lof main.lot *.aux
	make -C figs cleanfigs

fixdict:
	./addtodict $(TEXFILES)

