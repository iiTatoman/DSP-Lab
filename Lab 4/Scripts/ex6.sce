clear; clc;

x  = [1, 2, -3, 2, 1];
h  = [1, 0, -1];
Nx = length(x);  Nh = length(h);  Ny = Nx + Nh - 1;
nx = 0:Nx-1;  nh = 0:Nh-1;  ny = 0:Ny-1;

xf = x($:-1:1);
y1 = zeros(1, Ny);
for n = 0:Ny-1
    k  = (n - Nx + 1):n;
    hk = zeros(1, Nx);
    in = find(k >= 0 & k <= Nh - 1);
    hk(in) = h(k(in) + 1);
    y1(n + 1) = sum(hk .* xf);
    mprintf("n = %d, k = %2d..%d:  x(n-k) = %s,  h(k) = %s,  y(%d) = %2d\n", n, k(1), k($), sci2exp(xf), sci2exp(hk), n, y1(n + 1));
end
disp("Folding and shifting: y = " + sci2exp(y1));

H = zeros(Ny, Nx);
for j = 1:Nx
    H(j:j + Nh - 1, j) = h';
end
y2 = (H * x')';
disp("Convolution matrix H =", H);
disp("Matrix method:        y = " + sci2exp(y2));
disp("Built-in conv:        y = " + sci2exp(conv(x, h)));

Ex = sum(abs(x).^2);  Eh = sum(abs(h).^2);  Ey = sum(abs(y1).^2);
mprintf("Energy: Ex = %d, Eh = %d, Ey = %d\n", Ex, Eh, Ey);

function stem(n, v, col, t)
    plot2d3(n, v);  plot(n, v, col + "o");
    ax = gca();
    ax.data_bounds = [-1, min([v, 0]) - 1; 7, max([v, 0]) + 1];
    ax.x_ticks = tlist(["ticks", "locations", "labels"], -1:7, string(-1:7));
    xgrid();  title(t);  xlabel("n");
endfunction

scf(0);  clf();
subplot(2, 2, 1);  stem(nx, x, "b", "x(n)");
subplot(2, 2, 2);  stem(ny, y1, "r", "y(n) = x(n) * h(n)");
subplot(2, 2, 3);  stem(nx, abs(x).^2, "b", "|x(n)|^2,  Ex = " + string(Ex));
subplot(2, 2, 4);  stem(ny, abs(y1).^2, "r", "|y(n)|^2,  Ey = " + string(Ey));
