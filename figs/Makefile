FIGLIST= hom approxible ds p4 dp4 ps4 dps3 psk wr1 wr2 wr3 wr4 Wr0 Wr1 Wr2 Wr3 sample rba rbak2 polar shade2 n5 m5 c6

MAG = -m 1.3

LIST1= approxible hom sample n5 c6
DLIST1=$(addsuffix .pdftex, $(LIST1)) $(addsuffix .pdf, $(LIST1)) 
ELIST1=$(addprefix figs/,$(DLIST1))
$(ELIST1) $(DLIST1): override MAG = -m 0.7

LIST2=ds
DLIST2=$(addsuffix .pdftex, $(LIST2)) $(addsuffix .pdf, $(LIST2)) 
ELIST2=$(addprefix figs/,$(DLIST2))
$(ELIST2) $(DLIST2): override MAG = -m 1.4


LIST3=p4
DLIST3=$(addsuffix .pdftex, $(LIST3)) $(addsuffix .pdf, $(LIST3)) 
ELIST3=$(addprefix figs/,$(DLIST3))
$(ELIST3) $(DLIST3): override MAG = -m 1.1

LIST4=shade2 rba
DLIST4=$(addsuffix .pdftex, $(LIST4)) $(addsuffix .pdf, $(LIST4)) 
ELIST4=$(addprefix figs/,$(DLIST4))
$(ELIST4) $(DLIST4): override MAG = -m 2

FIGS=$(addsuffix .fig, $(FIGLIST))
PDFS=$(addsuffix .pdf, $(FIGLIST))
PDFTEXS=$(addsuffix .pdftex, $(FIGLIST))

figs: $(PDFTEXS)

%.pdftex %.pdf: %.fig
	fig2dev -L pdftex_t $(MAG) -p $(<:.fig=.pdf) $< $(<:.fig=.pdftex) 
	fig2dev -L pdftex $(MAG) -p dummy $< $(<:.fig=.pdf)
	
cleanfigs: 
	rm $(PDFS) $(PDFTEXS)
