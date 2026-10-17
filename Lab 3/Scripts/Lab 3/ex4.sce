clc;
function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;
    nmin = min(n1(1), n2(1));
    nmax = max(n1($), n2($));
    L = nmax - nmin + 1;

    x1p = zeros(1, L);  x1p(n1 - nmin + 1) = x1n;
    x2p = zeros(1, L);  x2p(n2 - nmin + 1) = x2n;

    yn = x1p + x2p;
    yorigin = 1 - nmin;

    n = nmin:nmax;
    vmin = min([x1n, x2n, yn, 0]) - 1;  vmax = max([x1n, x2n, yn, 0]) + 1;
    bounds = [nmin - 1, vmin; nmax + 1, vmax];
    ticks = tlist(["ticks","locations","labels"], (nmin-1):(nmax+1), string((nmin-1):(nmax+1)));

    clf();
    subplot(3, 1, 1);
    plot2d3(n1, x1n);  plot(n1, x1n, "bo");
    a = gca();  a.data_bounds = bounds;  a.x_ticks = ticks;
    xgrid();  title("x1(n)");  xlabel("n");

    subplot(3, 1, 2);
    plot2d3(n2, x2n);  plot(n2, x2n, "go");
    a = gca();  a.data_bounds = bounds;  a.x_ticks = ticks;
    xgrid();  title("x2(n)");  xlabel("n");

    subplot(3, 1, 3);
    plot2d3(n, yn);  plot(n, yn, "ro");
    a = gca();  a.data_bounds = bounds;  a.x_ticks = ticks;
    xgrid();  title("y(n) = x1(n) + x2(n)");  xlabel("n");
endfunction

scf(0);
[yn, yorigin] = add([0, 1, 3, -2], 1, [1, 1, 2, 3], 2);
disp("Test 1:", "yn = " + sci2exp(yn), "yorigin = " + string(yorigin));

scf(1);
[yn, yorigin] = add([1, 2, 3], 1, [2, 2], 2);
disp("Test 2:", "yn = " + sci2exp(yn), "yorigin = " + string(yorigin));
