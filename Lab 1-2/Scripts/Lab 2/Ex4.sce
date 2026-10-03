clc; clear; clf;
n = -5:5;
ur = n .* bool2s(n >= 0)
plot2d3(n, ur);
a = gca(); a.data_bounds = [-6, 0; 6, 6];
