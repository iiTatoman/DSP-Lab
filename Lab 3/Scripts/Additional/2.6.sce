clc;

function v = xsig(n)
    v = double(n >= 0 & n <= 3);
endfunction

function v = x2sig(n)
    v = xsig(n - 2);
endfunction

function y = sysA(f, n)
    y = f(n .^ 2);
endfunction

function y = sysB(f, n)
    y = f(n) - f(n - 1);
endfunction

function y = sysC(f, n)
    y = n .* f(n);
endfunction

function stemplot(n, v, col, t)
    plot2d3(n, v);  plot(n, v, col + "o");
    a = gca();  a.data_bounds = [min(n) - 1, min([v, 0]) - 1; max(n) + 1, max([v, 0]) + 1];
    a.x_ticks = tlist(["ticks","locations","labels"], n, string(n));
    xgrid();  title(t);  xlabel("n");
endfunction

function testTI(s, name, w)
    n  = -3:7;
    y  = s(xsig, n);
    yd = s(xsig, n - 2);
    y2 = s(x2sig, n);
    disp(name + ",  n = -3..7");
    disp("  y(n)   = " + sci2exp(y));
    disp("  y(n-2) = " + sci2exp(yd));
    disp("  y2(n)  = " + sci2exp(y2));
    disp("  y2(n) = y(n-2): " + string(and(y2 == yd)));
    scf(w);  clf();
    subplot(3, 1, 1);  stemplot(n, y, "b", name + ": y(n)");
    subplot(3, 1, 2);  stemplot(n, yd, "r", name + ": y(n-2)");
    subplot(3, 1, 3);  stemplot(n, y2, "g", name + ": y2(n) = T[x(n-2)]");
endfunction

n = -3:7;
disp("x(n)  = " + sci2exp(xsig(n)));
disp("x2(n) = " + sci2exp(x2sig(n)));
scf(0);  clf();
subplot(2, 1, 1);  stemplot(n, xsig(n), "b", "x(n)");
subplot(2, 1, 2);  stemplot(n, x2sig(n), "r", "x2(n) = x(n-2)");

testTI(sysA, "(b) y(n) = x(n^2)", 1);
testTI(sysB, "(c) y(n) = x(n) - x(n-1)", 2);
testTI(sysC, "(d) y(n) = n x(n)", 3);
