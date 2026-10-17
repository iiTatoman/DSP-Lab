clc;

function stemplot(n, v, col, t)
    plot2d3(n, v);  plot(n, v, col + "o");
    a = gca();  a.data_bounds = [min(n) - 1, -3; max(n) + 1, 7];
    a.x_ticks = tlist(["ticks","locations","labels"], (min(n)-1):(max(n)+1), string((min(n)-1):(max(n)+1)));
    xgrid();  title(t);  xlabel("n");
endfunction

n  = -2:2;
x  = [2, 3, 4, 5, 6];
xf = x($:-1:1);
xe = (x + xf) / 2;
xo = (x - xf) / 2;

disp("x(n)  = " + sci2exp(x));
disp("x(-n) = " + sci2exp(xf));
disp("xe(n) = " + sci2exp(xe));
disp("xo(n) = " + sci2exp(xo));
disp("xe is even: " + string(and(xe == xe($:-1:1))));
disp("xo is odd:  " + string(and(xo == -xo($:-1:1))));
disp("xe + xo = x: " + string(and(xe + xo == x)));

s  = [1, 0, 1, 0, 1];
e2 = xe + s;
o2 = xo - s;
disp("Alternative split with s = " + sci2exp(s) + ":");
disp("e2 + o2 = x: " + string(and(e2 + o2 == x)) + ",  o2 = " + sci2exp(o2) + " is odd: " + string(and(o2 == -o2($:-1:1))));

scf(0);  clf();
subplot(3, 1, 1);  stemplot(n, x, "b", "x(n)");
subplot(3, 1, 2);  stemplot(n, xe, "m", "even part xe(n)");
subplot(3, 1, 3);  stemplot(n, xo, "r", "odd part xo(n)");
