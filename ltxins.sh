#!/bin/sh
#
# A simple(and ugly) for compiling LaTeX package source.
# by Edward G.J. Lee <edt1023@info.sayya.org> 2004/02/04
#
# This code is Public Domain.
# $Id: ltxins.sh,v 1.2 2004/02/04 14:41:53 edt1023 Exp $
#
FNAME=`basename $1`
eval `echo $FNAME | awk -F. '{printf "FHEAD=%s;FTAIL=%s",\$1,\$2}'`
if [ -f ${FHEAD}.ins ]
then
  latex ${FHEAD}.ins
fi
latex ${FHEAD}.dtx
latex ${FHEAD}.dtx
makeindex -s gind.ist -o ${FHEAD}.ind ${FHEAD}.idx
makeindex -s gglo.ist -o ${FHEAD}.gls ${FHEAD}.glo
latex ${FHEAD}.dtx
latex ${FHEAD}.dtx
dvipdfmx ${FHEAD}
rm -f *.aux *.toc *.log *.dvi *.cjk *.out *.brf *.idx \
      *.ind *.lof *.lot *.ilg *.exa *.bbl *.blg *.cp \
      *.cps *.fn *.fns *.ky *.kys *.pg *.pgs *.tp *.tps \
      *.vr *.vrs *.ac *.acs *.at *.ats *.cv *.cvs *.ms \
      *.mss *.ov *.ovs *.pr *.prs *.tmp *.ev *.evs *.cm \
      *.cms *.op *.ops *.tr *.trs *.glo *.tui *.tuo
#xpdf ${FHEAD}.pdf
