clc; clear;
bitrate = 10000;  L = 1024;
F1 = 300;  F2 = 900;

// (a) sampling and folding frequency
bits  = log2(L);
Fs    = bitrate/bits;
Ffold = Fs/2;
mprintf("bits  = %d bits/sample\n", bits);
mprintf("Fs    = %d Hz\n", Fs);
mprintf("Ffold = %d Hz\n", Ffold);

// (b) Nyquist rate
FN = 2*max(F1, F2);
mprintf("FN    = %d Hz\n", FN);

// (c) normalized frequencies in x(n)
f1 = F1/Fs;
f2 = F2/Fs;
f2_alias = f2 - 1;
mprintf("f1 = %.1f,  f2 = %.1f,  f2_alias = %.1f\n", f1, f2, f2_alias);

// check that x(n) = 3cos(0.6*pi*n) + 2cos(0.2*pi*n)
n = 0:20;
x = 3*cos(2*%pi*F1*n/Fs) + 2*cos(2*%pi*F2*n/Fs);
err = max(abs(x - (3*cos(0.6*%pi*n) + 2*cos(0.2*%pi*n))));
mprintf("err   = %e\n", err);

// (d) resolution: find the range of xa(t) over one period (1/300 s)
t  = linspace(0, 1/F1, 10001);
xa = 3*cos(600*%pi*t) + 2*cos(1800*%pi*t);
xmax  = max(xa);
xmin  = min(xa);
Delta = (xmax - xmin)/(L - 1);
mprintf("xmax  = %g,  xmin = %g\n", xmax, xmin);
mprintf("Delta = %.5f  (= 10/1023)\n", Delta);

// Plots:
scf(1); clf();
tp = linspace(0, 20/Fs, 2000);

subplot(2,1,1);
plot(tp, 3*cos(600*%pi*tp) + 2*cos(1800*%pi*tp), 'b-');
plot2d3(n/Fs, x);
plot(n/Fs, x, 'ro');
title("Original xa(t) = 3cos(600 pi t) + 2cos(1800 pi t), sampled at 1000 Hz");
xlabel("t (s)"); ylabel("amplitude");

subplot(2,1,2);
plot(tp, 3*cos(600*%pi*tp) + 2*cos(200*%pi*tp), 'g-');
plot2d3(n/Fs, x);
plot(n/Fs, x, 'ro');
title("3cos(600 pi t) + 2cos(200 pi t): 900 Hz appears as 100 Hz");
xlabel("t (s)"); ylabel("amplitude");
