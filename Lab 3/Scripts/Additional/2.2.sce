clc; clear;

function v = xsig(n)
    v = zeros(1, length(n));
    v(find(n >= -1 & n <= 2)) = 1;
    v(find(n == 3 | n == 4)) = 0.5;
endfunction

function stemplot(n, v, col, t)
    plot2d3(n, v);  plot(n, v, col + "o");
    a = gca();  a.data_bounds = [min(n) - 1, -0.75; max(n) + 1, 1.25];
    a.x_ticks = tlist(["ticks","locations","labels"], n, string(n));
    xgrid();  title(t);  xlabel("n");
endfunction

n  = -6:7;
x  = xsig(n);
xa = xsig(n - 2);
xb = xsig(4 - n);
xc = xsig(n + 2);
xd = xsig(n) .* double(2 - n >= 0);
xe = xsig(n - 1) .* double(n == 3);
xf = xsig(n .^ 2);
xg = (xsig(n) + xsig(-n)) / 2;
xh = (xsig(n) - xsig(-n)) / 2;

k = (n >= -4 & n <= 6);
disp("n = -4..6");
disp("x(n)             : " + sci2exp(x(k)));
disp("(a) x(n-2)       : " + sci2exp(xa(k)));
disp("(b) x(4-n)       : " + sci2exp(xb(k)));
disp("(c) x(n+2)       : " + sci2exp(xc(k)));
disp("(d) x(n)u(2-n)   : " + sci2exp(xd(k)));
disp("(e) x(n-1)d(n-3) : " + sci2exp(xe(k)));
disp("(f) x(n^2)       : " + sci2exp(xf(k)));
disp("(g) even part    : " + sci2exp(xg(k)));
disp("(h) odd part     : " + sci2exp(xh(k)));
disp("even + odd = x(n): " + string(and(xg + xh == x)));

scf(0);  clf();
subplot(4, 1, 1);  stemplot(n, x, "b", "x(n)");
subplot(4, 1, 2);  stemplot(n, xa, "r", "(a) x(n-2)");
subplot(4, 1, 3);  stemplot(n, xb, "r", "(b) x(4-n)");
subplot(4, 1, 4);  stemplot(n, xc, "r", "(c) x(n+2)");

scf(1);  clf();
subplot(3, 1, 1);  stemplot(n, xd, "g", "(d) x(n)u(2-n)");
subplot(3, 1, 2);  stemplot(n, xe, "g", "(e) x(n-1)d(n-3)");
subplot(3, 1, 3);  stemplot(n, xf, "g", "(f) x(n^2)");

scf(2);  clf();
subplot(3, 1, 1);  stemplot(n, x, "b", "x(n)");
subplot(3, 1, 2);  stemplot(n, xg, "m", "(g) even part");
subplot(3, 1, 3);  stemplot(n, xh, "m", "(h) odd part");
