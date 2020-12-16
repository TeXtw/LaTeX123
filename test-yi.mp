% $Id: test-yi.mp,v 1.4 2004/02/27 17:58:59 edt1023 Exp $
% test-yi.mp
beginfig(1);
u:=3cm;
path p;
p = (0,1u)..(1u,0)...(0,-1u);
fill p{dir(157)}..(0,0){dir(23)}..{dir(157)}cycle;
draw p..(-1u,0)..cycle;
fill (0,-.6u)..(0.1u,-.5u)..(0,-.4u)..(-.1u,-.5u)..cycle withcolor white;
fill (0,.6u)..(.1u,.5u)..(0,.4u)..(-.1u,.5u)..cycle;
label.bot(btex \Large ¥é¤Ó·¥³±¶§³½¹Ï etex,(0,-1.2u));
endfig;

beginfig(2);
a=.7in; b=.5in;
z0=(0,0); z1=(a,0); z2=(0,b);
z0=.5[z1,z3]=.5[z2,z4];
draw z1..z2..z3..z4..cycle;
drawarrow z0..z1;
drawarrow z0..z2;
label.top(btex \small ¾î¶b $x$ etex, .5[z0,z1]);
label.lft(btex \small Áa¶b $y$ etex, .5[z0,z2]);
label.bot(btex \Large ³\¥\»\´ú¸Õ etex,(0,-.7u));
endfig;
end;
