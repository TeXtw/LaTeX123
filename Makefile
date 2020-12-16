# Makefile for compiling latex123.tex
# by Edward G.J. Lee <edt1023@info.sayya.org>
#
# $Id: Makefile,v 1.49 2004/03/07 12:06:52 edt1023 Exp $
#
DVI	= dvipdfmx
INDEX	= makeindex
BIB	= bibtex
PIC	= ./pic.sh
CJK	= bg5latex
LATEX	= latex
CONVERT	= bg5conv
MP	= mpost
B5MP	= ./b5mp.pl hwyk
RM	= rm -f
TAR	= tar zcvf
VER	= 0.1draft
DATE	= `date +%y%m%d`
L2H	= latex2html
L2HOPS	= -link 0 -split 3 -lcase_tags -image_type gif -transparent \
	  -show_section_number -html_version 4.0
OBJS	= story.cjk class.cjk preparation.cjk syntax.cjk start.cjk \
	  space.cjk package.cjk table.cjk graphic.cjk math.cjk \
	  abook.cjk theend.cjk fdl.cjk
EXAM	= example1.tex example2.tex example3.tex example4.tex \
	  example5.tex example6.tex example7.tex example8.tex \
	  example9.tex example10.tex example11.tex example12.tex \
	  example13.tex example14.tex test-graphpap.tex example15.tex \
	  example16.tex test-tables.tex example17.tex example18.tex \
	  example19.tex example20.tex example21.tex example22.tex \
	  example23.tex example24.tex example25.tex example26.tex \
	  example27.tex example28.tex
OBJMP	= cover2.1 test-yi.1 test-yi.2 baseline.1
REMOVE	= *.log *.aux *.toc *.lot *.lof *.out *.ilg *.idx *.ind *.dvi \
	  *.blg *.bbl *.glg *.glx *.glo *.gls *.cjk *.mx1 *.bak *.ps \
	  *-fig?.* *.b5mp *.mpx *.mpo mpgraph.mp mprun.mp mptrace.tmp \
	  mpxerr.tex tmp.inputs *.brf *.bmt


latex123.pdf: latex123.tex latex-flow.eps fntsize.eps layout-r.eps \
	cmath.eps cmath1.eps hyperref.cfg $(OBJS) $(OBJMP)
	$(CJK)   latex123.tex && \
	$(INDEX) latex123.idx && \
	$(CJK)   latex123.tex && \
	$(DVI)   latex123

#	$(BIB)   latex123 && \

%.cjk: %.tex
	$(CONVERT) < $< > $@

%.1 %.2: %.mp
	$(B5MP) $<

latex-flow.eps:
	$(PIC) latex-flow.tex

fntsize.eps:
	$(PIC) fntsize.tex

layout-r.eps:
	$(PIC) layout-r.tex

cmath.eps:
	$(PIC) cmath.tex

cmath1.eps:
	$(PIC) cmath1.tex

html:
	$(L2H) $(L2HOPS) latex123.tex

#tar:
#	$(TAR) latex123-$(VER).tar.gz *.tex *.mp *.sh fdl.tex Makefile \
#	ChangeLog README b5mp.pl

exam:
	for i in $(EXAM);do \
	bg5latex $$i ; bg5latex $$i ; \
	$(DVI) $${i%.tex} ; \
	done
	tex test-fonts.tex;\
	$(DVI) test-fonts.dvi
	gnuplot gnuplot-label.dem;\
	latex test-pstricks.tex;\
	dvips -o test-pstricks.ps test-pstricks.dvi;\
	ps2pdf test-pstricks.ps;\
	pdflatex -shell-escape test-pdftricks.tex;\
	mptopdf test-mpcolor.mp

clean:
	@$(RM) $(REMOVE)

.PHONY: clean html tar exam
