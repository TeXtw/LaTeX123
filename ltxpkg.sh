#!/bin/sh
#
# A simple(and ugly) package query tool for LaTeX.
# by Edward G.J. Lee <edt1023@info.sayya.org> 2004/02/04
# 
# This code is Public Domain.
# $Id: ltxpkg.sh,v 1.10 2004/02/27 17:53:22 edt1023 Exp $
#
# TODO:
# 去除重複的 packages。
# 顯示 package 使用了哪些選項參數。
#
TMP="/tmp"
# just for fun! :)
if [ `uname` = Linux ]
then
  RAN0=`dd if=/dev/urandom count=2 2>/dev/null|od -tx4|awk 'NR==1 {print $2}'`
  RAN1=`dd if=/dev/urandom count=2 2>/dev/null|od -to4|awk 'NR==1 {print $2}'`
else
  RAN0=`date '+%s'`
  RAN1=$$
fi
TMPFILE0="$TMP/${RAN0}.${RAN1}"
TMPFILE1="$TMP/${RAN1}.${RAN0}"
if [ $# -ne 1 ]
then
  echo
  echo "Usage: `basename $0` package-name[.sty]"
  echo
  exit
fi
eval `echo $1 | awk -F. '{printf "FHEAD=%s;FTAIL=%s",\$1,\$2}'`
PKGNAME=${FHEAD}.sty
PKGPATH=`kpsewhich $PKGNAME`
if [ $? -ne 0 ]
then
  echo
  echo "Seems you don't install \`$1' package."
  echo
  exit
fi
# avoid TeX comments and \RequirePackage define.
# Looks ugly. :(
grep -v "^%" $PKGPATH | grep -v "\<\def\>" | grep -s "\RequirePackage" \
     > $TMPFILE0
if [ $? -ne 0 ]
then
  echo
  echo "The position of this package is at:"
  echo "$PKGPATH"
  echo
  echo "\`$PKGNAME' dose not preload any other package(s)."
  echo
  rm -f $TMPFILE0
  exit
else
  echo
  awk -F'{' '{print $NF}' $TMPFILE0 > $TMPFILE1
  echo "The position of this package is at:"
  echo "$PKGPATH"
  echo
  echo "The preloaded package(s) of \`$PKGNAME' is(are):"
  grep -v '\@' $TMPFILE1 | awk -F'}' '{print $1}'
  echo
  rm -f $TMPFILE0 $TMPFILE1
  exit
fi
