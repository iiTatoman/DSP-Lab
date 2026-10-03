clc; clear;
n = -2:1;
x = [1 -2 3 6]

// y1(n) = x(-n): reverse values, negate indices
n1 = -n($:-1:1)
y1 = x($:-1:1)

// y2(n) = x(n+3): same values, indices shifted left by 3
n2 = n - 3
y2 = x

// y3(n) = 2x(-n-2): fold, shift by -2, scale by 2
n3 = -n($:-1:1) - 2
y3 = 2 * x($:-1:1)

// plot1
scf(1); clf();
subplot(2,1,1);
plot2d3(n, x);
title("Original signal x(n)"); xlabel("n"); ylabel("x(n)");
a = gca();
a.x_ticks = tlist(["ticks","locations","labels"], -3:3, string(-3:3));
a.y_ticks = tlist(["ticks","locations","labels"], -3:3:6, string(-3:3:6));
a.tight_limits = "on";
a.data_bounds = [-3, -3; 3, 7];

subplot(2,1,2);
plot2d3(n1, y1);
title("y1(n) = x(-n)"); xlabel("n"); ylabel("y1(n)");
a = gca();
a.x_ticks = tlist(["ticks","locations","labels"], -3:3, string(-3:3));
a.y_ticks = tlist(["ticks","locations","labels"], -3:3:6, string(-3:3:6));
a.tight_limits = "on";
a.data_bounds = [-3, -3; 3, 7];

// plot2
scf(2); clf();
subplot(2,1,1);
plot2d3(n, x);
title("Original signal x(n)"); xlabel("n"); ylabel("x(n)");
a = gca();
a.x_ticks = tlist(["ticks","locations","labels"], -6:2, string(-6:2));
a.y_ticks = tlist(["ticks","locations","labels"], -3:3:6, string(-3:3:6));
a.tight_limits = "on";
a.data_bounds = [-6, -3; 2, 7];

subplot(2,1,2);
plot2d3(n2, y2);
title("y2(n) = x(n+3)"); xlabel("n"); ylabel("y2(n)");
a = gca();
a.x_ticks = tlist(["ticks","locations","labels"], -6:2, string(-6:2));
a.y_ticks = tlist(["ticks","locations","labels"], -3:3:6, string(-3:3:6));
a.tight_limits = "on";
a.data_bounds = [-6, -3; 2, 7];

// plot3
scf(3); clf();
subplot(2,1,1);
plot2d3(n, x);
title("Original signal x(n)"); xlabel("n"); ylabel("x(n)");
a = gca();
a.x_ticks = tlist(["ticks","locations","labels"], -4:2, string(-4:2));
a.y_ticks = tlist(["ticks","locations","labels"], -4:4:12, string(-4:4:12));
a.tight_limits = "on";
a.data_bounds = [-4, -5; 2, 13];

subplot(2,1,2);
plot2d3(n3, y3);
title("y3(n) = 2x(-n-2)"); xlabel("n"); ylabel("y3(n)");
a = gca();
a.x_ticks = tlist(["ticks","locations","labels"], -4:2, string(-4:2));
a.y_ticks = tlist(["ticks","locations","labels"], -4:4:12, string(-4:4:12));
a.tight_limits = "on";
a.data_bounds = [-4, -5; 2, 13];
