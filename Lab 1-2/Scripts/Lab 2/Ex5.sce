clc; clear; clf;
n  = -1:1;
x  = [1 3 -2]
xf = x($:-1:1)          // folded signal x(-n)
xe = (x + xf) / 2       // even component
xo = (x - xf) / 2       // odd component

subplot(3,1,1);
plot2d3(n, x);
title("Original signal x(n)"); xlabel("n"); ylabel("x(n)");
a = gca(); a.data_bounds = [-2, -2.5; 2, 3.5];
a.x_ticks = tlist(["ticks","locations","labels"], -2:2, string(-2:2));
a.y_ticks = tlist(["ticks","locations","labels"], -2:3, string(-2:3));

subplot(3,1,2);
plot2d3(n, xo);
title("Odd component xo(n)"); xlabel("n"); ylabel("xo(n)");
a = gca(); a.data_bounds = [-2, -2.5; 2, 3.5];
a.x_ticks = tlist(["ticks","locations","labels"], -2:2, string(-2:2));
a.y_ticks = tlist(["ticks","locations","labels"], -2:3, string(-2:3));

subplot(3,1,3);
plot2d3(n, xe);
title("Even component xe(n)"); xlabel("n"); ylabel("xe(n)");
a = gca(); a.data_bounds = [-2, -2.5; 2, 3.5];
a.x_ticks = tlist(["ticks","locations","labels"], -2:2, string(-2:2));
a.y_ticks = tlist(["ticks","locations","labels"], -2:3, string(-2:3));
