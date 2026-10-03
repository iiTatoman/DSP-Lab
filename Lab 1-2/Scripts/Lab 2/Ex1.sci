clc; clear; clf;

// min, max, bool2s
x = [3 -1 7 0 5]
[m, k] = min(x)
[M, K] = max(x)
b = bool2s(x > 2)

// deff
deff("y = f(n)", "y = n.^2")
f(1:5)

// plot2d3, subplot, title, xlabel, ylabel
n = 0:10;
subplot(2,1,1);
plot2d3(n, f(n));
plot(n, f(n), 'ro');
title("Stem plot of f(n) = n^2");
xlabel("n"); ylabel("f(n)");
a = gca(); a.data_bounds = [-1, 0; 11, 110];

subplot(2,1,2);
e = bool2s(modulo(n,2) == 0);
plot2d3(n, e);
plot(n, e, 'ro');
title("bool2s: 1 for even n, 0 for odd n");
xlabel("n"); ylabel("value");
a = gca(); a.data_bounds = [-1, 0; 11, 1.2];
