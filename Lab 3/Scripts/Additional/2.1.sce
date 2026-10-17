clc;

function v = xsig(n)
    v = zeros(1, length(n));
    k = find(n >= -3 & n <= -1);
    v(k) = 1 + n(k) / 3;
    v(find(n >= 0 & n <= 3)) = 1;
endfunction

function s = fmt(v)
    s = sci2exp(round(v * 1000) / 1000);
endfunction

function stemplot(n, v, col, t)
    plot2d3(n, v);  plot(n, v, col + "o");
    a = gca();  a.data_bounds = [min(n) - 1, -0.5; max(n) + 1, 1.5];
    a.x_ticks = tlist(["ticks","locations","labels"], n, string(n));
    xgrid();  title(t);  xlabel("n");
endfunction

n  = -8:8;
x  = xsig(n);
y1 = xsig(-(n - 4));
y2 = xsig(-n - 4);
y3 = xsig(-n + 4);
xe = (1/3) * double(n == -2) + (2/3) * double(n == -1) + double(n >= 0) - double(n >= 4);

disp("(a)  x(n),     n = -3..3: " + fmt(x(n >= -3 & n <= 3)));
disp("(b1) y1(n),    n = 0..7:  " + fmt(y1(n >= 0 & n <= 7)));
disp("(b2) y2(n),    n = -7..0: " + fmt(y2(n >= -7 & n <= 0)));
disp("(c)  x(-n+4),  n = 0..7:  " + fmt(y3(n >= 0 & n <= 7)));
disp("(d)  y1 = x(-n+4): " + string(and(y1 == y3)) + ",  y2 = x(-n+4): " + string(and(y2 == y3)));
disp("(e)  delta/step form = x(n): " + string(max(abs(x - xe)) < 1e-12));

scf(0);  clf();
subplot(2, 1, 1);  stemplot(n, x, "b", "(a) x(n)");
subplot(2, 1, 2);  stemplot(n, xe, "m", "(e) 1/3 d(n+2) + 2/3 d(n+1) + u(n) - u(n-4)");

scf(1);  clf();
subplot(3, 1, 1);  stemplot(n, y1, "r", "(b1) fold, then delay by 4");
subplot(3, 1, 2);  stemplot(n, y2, "g", "(b2) delay by 4, then fold");
subplot(3, 1, 3);  stemplot(n, y3, "k", "(c) x(-n+4)");
