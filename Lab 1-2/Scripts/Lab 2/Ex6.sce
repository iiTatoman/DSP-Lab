clc; clear; clf;
n  = -1:3;
x1 = [0 0 1 3 -2]       // x1(n) padded to n = -1..3
x2 = [0 1 2 3 0]        // x2(n) padded to n = -1..3
y  = x1 + x2

subplot(3,1,1);
plot2d3(n, x1);
title("x1(n)"); xlabel("n"); ylabel("x1(n)");
a = gca();
a.x_ticks = tlist(["ticks","locations","labels"], -2:4, string(-2:4));
a.y_ticks = tlist(["ticks","locations","labels"], -2:2:6, string(-2:2:6));
a.tight_limits = "on";
a.data_bounds = [-2, -3; 4, 7];

subplot(3,1,2);
plot2d3(n, x2);
title("x2(n)"); xlabel("n"); ylabel("x2(n)");
a = gca();
a.x_ticks = tlist(["ticks","locations","labels"], -2:4, string(-2:4));
a.y_ticks = tlist(["ticks","locations","labels"], -2:2:6, string(-2:2:6));
a.tight_limits = "on";
a.data_bounds = [-2, -3; 4, 7];

subplot(3,1,3);
plot2d3(n, y);
title("y(n) = x1(n) + x2(n)"); xlabel("n"); ylabel("y(n)");
a = gca();
a.x_ticks = tlist(["ticks","locations","labels"], -2:4, string(-2:4));
a.y_ticks = tlist(["ticks","locations","labels"], -2:2:6, string(-2:2:6));
a.tight_limits = "on";
a.data_bounds = [-2, -3; 4, 7];
