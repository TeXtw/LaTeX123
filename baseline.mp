% $Id: baseline.mp,v 1.2 2004/02/20 14:27:57 edt1023 Exp $
% baseline.mp
%prologues := 2;
beginfig(1)
path a[]; u = 1cm;
z1 = (0, 0);
z2 = (3.45u, 0);
z3 = (3.45u, 6u);
z4 = (0, 6u);
z5 = (0, 1.6u);
z6 = (3.45u, 1.5u);
z7 = (0, 1.5u);
z8 = (9u, 1.5u);
z9 = (0, 4.2u);
z10= (9u, 4.2u);
a0 = z1--z2--z3--z4--cycle;
a1 = z7--z8;
a2 = z9--z10;
filldraw a0 withcolor 0.9white;
draw a0; draw a1;draw a2;
drawdblarrow (0, -.2u)--(3.45u, -.2u);
drawdblarrow (-0.2u, 1.6u)--(-.2u, 6u);
label.lft(btex cap height etex, (-.2u, 5u));
drawdblarrow (-0.4u, 1.6u)--(-.4u, 4.2u);
label.lft(btex x-height etex, (-.4u, 3u));
drawdblarrow (3.6u, 0)--(3.6u, 1.4u);
label.rt(btex depth etex, (3.6u, .7u));
label.bot(btex width etex, (1.7u, -.2u));
label.top(btex baseline etex, (8u, 1.5u));
label.top(btex mean line etex, (8u, 4.2u));
dotlabel.lft(btex reference point etex, (0, 1.5u));
label.rt(btex \font\lcmr=cmr10 at 180pt\lcmr yZ etex, (0, 3u));
endfig
end
