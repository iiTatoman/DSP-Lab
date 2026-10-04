clc; clear;
n = 0:47;

xb = 3*cos(5*n + %pi/6);
xc = 2*exp(%i*(n/6 - %pi));
xd = cos(n/8) .* cos(%pi*n/8);
xe = cos(%pi*n/2) - sin(%pi*n/8) + 3*cos(%pi*n/4 + %pi/3);

// compare samples 0..15 with samples 16..31
db = max(abs(xb(1:16) - xb(17:32)))
dc = max(abs(xc(1:16) - xc(17:32)))
dd = max(abs(xd(1:16) - xd(17:32)))
de = max(abs(xe(1:16) - xe(17:32)))   // ~0 -> repeats every 16 samples

// Plots
scf(1); clf("reset");
t = linspace(0, 3*2*%pi/5, 500);

subplot(3,2,1);
plot(t, 3*cos(5*t + %pi/6));
title("(a) xa(t) = 3cos(5t + pi/6)"); xlabel("t (s)"); ylabel("xa(t)");

subplot(3,2,2);
plot2d3(n, xb);
title("(b) 3cos(5n + pi/6)"); xlabel("n"); ylabel("x(n)");

subplot(3,2,3);
plot2d3(n, real(xc));
title("(c) Re{2exp[j(n/6 - pi)]}"); xlabel("n"); ylabel("Re x(n)");

subplot(3,2,4);
plot2d3(n, imag(xc));
title("(c) Im{2exp[j(n/6 - pi)]}"); xlabel("n"); ylabel("Im x(n)");

subplot(3,2,5);
plot2d3(n, xd);
title("(d) cos(n/8)cos(pi n/8)"); xlabel("n"); ylabel("x(n)");

subplot(3,2,6);
plot2d3(n, xe);
title("(e) N = 16"); xlabel("n"); ylabel("x(n)");
