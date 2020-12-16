#!/usr/bin/env perl
#
# Process CJK Big-5 Traditional Chinese MetaPost file.
# Usage: b5mp.pl [fontname] your[.mp]
# Edward G.J. Lee <edt1023@info.sayya.org> 2003.09.19
# Inspire heavily from wycc's(wycc@iis.sinica.edu.tw) clatex.
#
# $Id: b5mp.pl,v 1.8 2004/02/20 14:26:46 edt1023 Exp $
#

=head1 NAME

b5mp.pl - Process CJK Big-5 Traditional Chinese MetaPost file.

=head1 SYNOPSIS

B<b5mp.pl> [I<fontname>] I<your>[I<.mp>]

The default font name is `aming'. For example,

C<b5mp.pl some.mp>

C<b5mp.pl akai some.mp>

=head1 DESCRIPTION

This tool will insert the LaTeX CJK Big-5 environment in the MetaPost
file and call mpost to compile it. You can use Big-5 Traditional
Chinese characters in your MetaPost label now.

=head1 RESTRICTIONS

It can be use in Big-5 encoding only. It's not difficult to add some
subroutine to support other encodings.

=head1 HISTORY

The C<trans_print> subroutine is modified from wycc's clatex.

=head1 SEE ALSO

mpost(1)

=head1 AUTHOR

Edward G.J. Lee <edt1023@info.sayya.org>
The author of trans_print() subroutine is wycc <wycc@iis.sinica.edu.tw>

=cut

$one = 161;
$two = 254;

if ( @ARGV == 1 ) {
  $main = $ARGV[0];
  $main =~ s/\.mp$//i;
  $font = 'aming';
  latex_header();
} elsif ( @ARGV == 2) {
  $font = $ARGV[0];
  $main = $ARGV[1];
  $main =~ s/\.mp$//i;
  latex_header();
} else {
  print "\n";
  print "Usage: b5mp.pl [fontname] your[.mp]\n";
  print "The default font name is `aming'.\n";
  print "\n";
  exit 1;
}

while(<INFILE>) {
  if (/^\s*\\begin\{CJK\}/) {
    unlink("$main.cmp");
    die "Already have LaTeX CJK environment in your MP file!\n";
  }
  # remove `end', `end;', `bye' and `bye;'
  last if (/^\s*(end|bye);?\b/);
  trans_print($_);
}
latex_tail();

die "$!\n" unless(rename("$main.mp", "$main.mp.orig"));
die "$!\n" unless(rename("$main.cmp", "$main.mp"));
die "$!\n" unless(close(MPOST));
die "$!\n" unless(close(INFILE));
system("mpost $main");
die "$!\n" unless(rename("$main.mp", "$main.b5mp"));
die "$!\n" unless(rename("$main.mp.orig", "$main.mp"));

sub trans_print {
  local($s) = @_;
  local($i,$c,$nc,$ordc,$ordc1);

  for($i=0;$i<length($s);$i++) {
    $c = substr($s,$i,1);
    $ordc = ord($c);
    if (($ordc>=$one)&&($ordc<=$two)) {
      $nc = substr($s,$i+1,1);
      if ($nc =~/[\\{}\^_]/) {
        $ordc1 = ord($nc);
        print MPOST "\\CJKchar{$ordc}{$ordc1}";
      }
      else {
        print MPOST $c,$nc;
      }
    $i++;
    }
    else {
      print MPOST $c;
    }
  }
}

sub latex_header {
  die "$!\n" unless(open(INFILE,"<$main.mp"));
  die "$!\n" unless(open(MPOST,">$main.cmp"));
  print MPOST <<EOD;
verbatimtex
%&latex
\\documentclass{article}
\\usepackage{CJK,amsmath,amssymb}
\\thispagestyle{empty}
\\begin{document}
EOD
  print MPOST '\begin{CJK}{Bg5}{' . "$font" . '}' . "\n";
  print MPOST "etex\n";
}

sub latex_tail {
  print MPOST <<EOD;
verbatimtex
\\end{CJK}
\\end{document}
etex
bye
EOD
}
