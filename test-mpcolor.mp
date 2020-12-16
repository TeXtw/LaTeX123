% $Id: test-mpcolor.mp,v 1.1 2004/02/18 15:30:38 edt1023 Exp $
% test-mpcolor.mp
beginfig(1);
defaultscale := 12pt/fontsize(defaultfont); % 使用 12 點字
u := 1cm;
path sqr;
sqr := unitsquare scaled u;
for i=0 upto 10:  % for loop 迴圈，請注意這裡是冒號
  label.top(decimal(i/10), ((i+1/2)*u,1u));
  fill sqr shifted (i*u, 0) withcolor i*0.1red;
  fill sqr shifted (i*u, -1.2u) withcolor i*0.1green;
  fill sqr shifted (i*u, -2.4u) withcolor i*0.1blue;
  fill sqr shifted (i*u, -3.6u) withcolor i*0.1white;
endfor;
label.lft("red", (0,.6u));
label.lft("green", (0,-.6u));
label.lft("blue", (0,-2u));
label.lft("gray", (0,-3u));
endfig;
bye
