clc;
function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    Nx = length(xn);  Nh = length(hn);
    yn = zeros(1, Nx + Nh - 1);
    for i = 1:Nx
        for j = 1:Nh
            yn(i + j - 1) = yn(i + j - 1) + xn(i) * hn(j);
        end
    end
    yorigin = xorigin + horigin - 1;

    nx = (1:Nx) - xorigin;
    nh = (1:Nh) - horigin;
    ny = (1:length(yn)) - yorigin;
    nmin = min([nx, nh, ny]) - 1;  nmax = max([nx, nh, ny]) + 1;
    vmin = min([xn, hn, yn, 0]) - 1;  vmax = max([xn, hn, yn, 0]) + 1;
    bounds = [nmin, vmin; nmax, vmax];
    ticks = tlist(["ticks","locations","labels"], nmin:nmax, string(nmin:nmax));

    clf();
    subplot(3, 1, 1);
    plot2d3(nx, xn);  plot(nx, xn, "bo");
    a = gca();  a.data_bounds = bounds;  a.x_ticks = ticks;
    xgrid();  title("x(n)");  xlabel("n");

    subplot(3, 1, 2);
    plot2d3(nh, hn);  plot(nh, hn, "go");
    a = gca();  a.data_bounds = bounds;  a.x_ticks = ticks;
    xgrid();  title("h(n)");  xlabel("n");

    subplot(3, 1, 3);
    plot2d3(ny, yn);  plot(ny, yn, "ro");
    a = gca();  a.data_bounds = bounds;  a.x_ticks = ticks;
    xgrid();  title("y(n) = x(n) * h(n)");  xlabel("n");
endfunction

scf(0);
[yn, yorigin] = convolution([1, 2, 3, 1], 1, [1, 2, 1, -1], 2);
disp("Test 1:", "yn = " + sci2exp(yn), "yorigin = " + string(yorigin));
disp("conv = " + sci2exp(conv([1, 2, 3, 1], [1, 2, 1, -1])));

scf(1);
[yn, yorigin] = convolution([1, -1], 2, [1, 2, 3], 1);
disp("Test 2:", "yn = " + sci2exp(yn), "yorigin = " + string(yorigin));
disp("conv = " + sci2exp(conv([1, -1], [1, 2, 3])));
