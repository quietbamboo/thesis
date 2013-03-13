SRC = abstract.tex ack.tex conc.tex intro.tex\
      bkg.tex related.tex thesis.tex appendix.tex\
      power.tex app.tex

thesis: thesis.ps thesis.pdf

all: thesis.ps thesis.pdf

pdf: thesis.pdf

thesis.ps: thesis.dvi
	#dvips -o thesis.ps -t letter thesis.dvi
	#dvips -P cmz -t letter -o thesis.ps thesis.dvi
	dvips -t letter -o thesis.ps thesis.dvi
	#dvips -Pdownload35 -t letter -o thesis.ps thesis.dvi

thesis.pdf: thesis.dvi
	#dvips -Ppdf -Pcmz -Pamz -t letter -D 600 -G1 thesis.dvi
	dvips -Ppdf -t letter -D 600 -G1 thesis.dvi
	ps2pdf14 thesis.ps thesis.pdf

thesis.dvi: $(SRC) thesis.blg
	latex thesis
	latex thesis

thesis.blg: thesis.bib $(SRC)
	latex thesis
	bibtex thesis
	latex thesis

clean: 
	\rm -f *.dvi *.aux *.ps *~ *.log *.blg *.bbl *.pdf *.eps *.out *.lot *.lof *.toc *.synctex.gz

