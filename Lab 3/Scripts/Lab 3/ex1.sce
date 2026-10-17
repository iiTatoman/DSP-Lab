clc;

function [yn, yorigin] = delay(xn, xorigin, k)
    if k <= 0 then
        error("delay: k must be > 0");
    end

    yn = xn;
    yorigin = xorigin - k;

    if yorigin < 1 then
        yn = [zeros(1, 1 - yorigin), xn];
        yorigin = 1;
    end

    nx = (1:length(xn)) - xorigin;
    ny = (1:length(yn)) - yorigin;
    nmin = min([nx, ny]) - 1;  nmax = max([nx, ny]) + 1;
    vmin = min([xn, yn, 0]) - 1;  vmax = max([xn, yn, 0]) + 1;

    clf();
    subplot(2, 1, 1);
    plot2d3(nx, xn);  plot(nx, xn, "bo");
    a = gca();  a.data_bounds = [nmin, vmin; nmax, vmax];
    a.x_ticks = tlist(["ticks","locations","labels"], nmin:nmax, string(nmin:nmax));
    xgrid();  title("x(n)");  xlabel("n");

    subplot(2, 1, 2);
    plot2d3(ny, yn);  plot(ny, yn, "ro");
    a = gca();  a.data_bounds = [nmin, vmin; nmax, vmax];
    a.x_ticks = tlist(["ticks","locations","labels"], nmin:nmax, string(nmin:nmax));
    xgrid();  title("y(n) = x(n - " + string(k) + ")");  xlabel("n");
endfunction

// Tests
scf(0);
[yn, yorigin] = delay([1, -2, 3, 6], 3, 1);
disp("Test 1:", "yn = " + sci2exp(yn), "yorigin = " + string(yorigin));

scf(1);
[yn, yorigin] = delay([1, 2, 3], 1, 3);
disp("Test 2:", "yn = " + sci2exp(yn), "yorigin = " + string(yorigin));
