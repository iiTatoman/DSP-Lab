clear; clc;

x = [1, 2, -3, 2, 1];
h = [1, 0, -1, -1, 1];
N = length(x);  M = length(h);
nv = 0:N-1;
hp = [h, zeros(1, N - M)];

y1 = zeros(1, N);
for n = 0:N-1
    xs = x(pmodulo(n - (0:M-1), N) + 1);
    y1(n + 1) = sum(h .* xs);
    mprintf("n = %d:  x((n-k) mod %d) = %s,  h(k) = %s,  y(%d) = %2d\n", n, N, sci2exp(xs), sci2exp(h), n, y1(n + 1));
end
disp("Folding and shifting: y = " + sci2exp(y1));

C = zeros(N, N);
for i = 0:N-1
    for j = 0:N-1
        C(i + 1, j + 1) = hp(pmodulo(i - j, N) + 1);
    end
end
y2 = (C * x')';
disp("Circulant matrix C =", C);
disp("Matrix method:        y = " + sci2exp(y2));

yl = conv(x, h);
yw = zeros(1, N);
for i = 1:length(yl)
    yw(pmodulo(i - 1, N) + 1) = yw(pmodulo(i - 1, N) + 1) + yl(i);
end
disp("Linear convolution:   " + sci2exp(yl));
disp("Linear, wrapped mod N: y = " + sci2exp(yw));
disp("Via the DFT:          y = " + sci2exp(round(real(ifft(fft(x) .* fft(hp))))));

Ex = sum(abs(x).^2);  Eh = sum(abs(h).^2);  Ey = sum(abs(y1).^2);
mprintf("Energy: Ex = %d, Eh = %d, Ey = %d\n", Ex, Eh, Ey);

function stem(n, v, col, t)
    plot2d3(n, v);  plot(n, v, col + "o");
    ax = gca();
    ax.data_bounds = [-1, min([v, 0]) - 1; 5, max([v, 0]) + 1];
    ax.x_ticks = tlist(["ticks", "locations", "labels"], -1:5, string(-1:5));
    xgrid();  title(t);  xlabel("n");
endfunction

scf(0);  clf();
subplot(2, 2, 1);  stem(nv, x, "b", "x(n)");
subplot(2, 2, 2);  stem(nv, y1, "r", "y(n), 5-point circular convolution");
subplot(2, 2, 3);  stem(nv, abs(x).^2, "b", "|x(n)|^2,  Ex = " + string(Ex));
subplot(2, 2, 4);  stem(nv, abs(y1).^2, "r", "|y(n)|^2,  Ey = " + string(Ey));
