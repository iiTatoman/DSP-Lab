clear; clc;

M = 200;  N = 300;
[x, y] = meshgrid(linspace(-3, 3, N), linspace(-3, 3, M));
Z = 3*(1 - x).^2 .* exp(-x.^2 - (y + 1).^2) ..
  - 10*(x/5 - x.^3 - y.^5) .* exp(-x.^2 - y.^2) ..
  - exp(-(x + 1).^2 - y.^2) / 3;
I = round(60 + 65 * (Z - min(Z)) / (max(Z) - min(Z)));
[c, r] = meshgrid(1:N, 1:M);
I(modulo(c, 30) == 0 | modulo(r, 30) == 0) = 50;
mprintf("Image size: %d x %d\n", M, N);

[idx, h] = dsearch(I(:), 0:255, "d");

cdf = cumsum(h) / (M * N);
Ieq = matrix(round(255 * cdf(I(:) + 1)), M, N);
[idx, heq] = dsearch(Ieq(:), 0:255, "d");
mprintf("Before equalization: levels %d..%d, std = %.1f\n", min(I), max(I), stdev(I));
mprintf("After  equalization: levels %d..%d, std = %.1f\n", min(Ieq), max(Ieq), stdev(Ieq));

n = -6:6;
g = exp(-n.^2 / (2 * 2^2));
g = g / sum(g);
Ib = conv2(g', g, I, "same");
mprintf("Blur: 1-D Gaussian kernel of length %d, sigma = 2\n", length(g));

d = sqrt((c - N/2).^2 + (r - M/2).^2);
W = double(abs(d - 60) < 6);
a = 0.4;
Iw = (1 - a*W) .* I + a * 255 * W;
mprintf("Watermark: ring of %d pixels, strength = %.1f\n", sum(W), a);

function showgray(A, t)
    Matplot(round(A) + 1);
    ax = gca();  ax.isoview = "on";  ax.axes_visible = ["off", "off", "off"];
    title(t);
endfunction

function showhist(h, t)
    bar(0:255, h);
    ax = gca();
    ax.x_ticks = tlist(["ticks", "locations", "labels"], 0:50:250, string(0:50:250));
    title(t);  xlabel("gray level");
endfunction

f = scf(0);  clf();  f.color_map = gray(256);
subplot(2, 2, 1);  showgray(I, "Original");
subplot(2, 2, 2);  showgray(Ieq, "Equalized");
subplot(2, 2, 3);  showhist(h, "Histogram of the original");
subplot(2, 2, 4);  showhist(heq, "Histogram after equalization");

f = scf(1);  clf();  f.color_map = gray(256);
subplot(1, 3, 1);  showgray(I, "Original");
subplot(1, 3, 2);  showgray(Ib, "Gaussian blur");
subplot(1, 3, 3);  showgray(Iw, "Visible watermark");
