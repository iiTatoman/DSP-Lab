clc; clear; clf;
n = -5:5;
msignal = bool2s(n >= 0)
plot2d3(n, msignal);
a = gca(); a.data_bounds = [-6, 0; 6, 1.2];
