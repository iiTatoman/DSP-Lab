clear; clc;

// x(n) = 2d(n+2) - d(n+1) + 2d(n) - 3d(n-1) + 4d(n-2)
n  = -2:2;
xn = [2, -1, 2, -3, 4];

// X(z) = sum x(n) z^(-n)
z = poly(0, "z");
X = 2*z^2 - z + 2 - 3*z^(-1) + 4*z^(-2);
disp("X(z) =", X);

z0   = 1.5 + 0.5*%i;
Xdef = sum(xn .* z0 .^ (-n));
Xcf  = horner(X, z0);
disp("Definition at z0:", Xdef, "Closed form at z0:", Xcf);

// poles and zeros
zr = roots(X.num);
pr = roots(X.den);
disp("Zeros:", zr, "|zeros|:", abs(zr), "Finite poles:", pr);

scf(0); clf();
subplot(1, 2, 1);
plot2d3(n, xn);  plot(n, xn, "bo");
a = gca();  a.data_bounds = [-3, -4; 3, 5];
a.x_ticks = tlist(["ticks","locations","labels"], -3:3, string(-3:3));
xgrid();  title("x(n)");  xlabel("n");

subplot(1, 2, 2);
t = linspace(0, 2*%pi, 200);
plot(cos(t), sin(t), "k--");
plot(real(zr), imag(zr), "bo");
plot(real(pr), imag(pr), "rx");
a = gca();  a.isoview = "on";  a.data_bounds = [-1.6, -1.6; 1.6, 1.6];
xgrid();  title("Pole-zero plot of X(z)");  xlabel("Re(z)");  ylabel("Im(z)");
