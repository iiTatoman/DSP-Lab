clc; clear; clf;

f  = 50;
T  = 1/f;
Fs = 300;
Ts = 1/Fs;
Delta = 0.1;

t  = linspace(0, 5*T, 1000);
xa = 3*sin(100*%pi*t);

n  = 0:29;
x  = 3*sin(100*%pi*n*Ts);

xq = Delta * fix(x / Delta);

subplot(3,1,1);
plot(t, xa, 'b-');
xtitle('Analog signal x_a(t) = 3sin(100πt), 5 periods', 't (s)', 'x_a(t)');
xgrid();

subplot(3,1,2);
plot2d3(n, x);
plot(n, x, 'ro');
xtitle('Sampled signal x(n), Fs = 300 Hz', 'n', 'x(n)');
xgrid();

subplot(3,1,3);
plot2d3(n, xq);
plot(n, xq, 'ks');
xtitle('Quantized signal x_q(n), Δ = 0.1 (truncation)', 'n', 'x_q(n)');
xgrid();
