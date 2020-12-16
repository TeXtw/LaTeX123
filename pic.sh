#!/bin/sh
# Edward G.J Lee <edt1023@info.sayya.org>
# $Id: pic.sh,v 1.8 2004/02/29 15:05:21 edt1023 Exp $
#
bg5latex $1
dvips -Pcmz ${1%.tex}
ps2eps -l -f ${1%.tex}.ps
#epstopdf ${1%.tex}.epsi
#ebb ${1%.tex}.epsi
#convert -transparent white ${1%.tex}.eps ${1%.tex}.png
