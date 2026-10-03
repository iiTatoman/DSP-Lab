clc; clear;
Fs = 600;                            // sampling rate (Hz)
F1 = 240;  F2 = 360;                 // frequencies of xa(t) (Hz)

// (a) Nyquist rate and (b) folding frequency
FN    = 2*max(F1, F2)
Ffold = Fs/2

// (c) digital frequencies, as multiples of pi
w1_pi = 2*F1/Fs
w2_pi = 2*F2/Fs
w2_alias_pi = w2_pi - 2

// check that x(n) = -2 sin(0.8*pi*n)
n = 0:15;
x = sin(2*%pi*F1*n/Fs) + 3*sin(2*%pi*F2*n/Fs);
err = max(abs(x - (-2*sin(0.8*%pi*n))))

// Plots:
scf(1); clf();
t = linspace(0, 15/Fs, 1000);

subplot(2,1,1);
plot(t, sin(480*%pi*t) + 3*sin(720*%pi*t), 'b-');
plot2d3(n/Fs, x);
plot(n/Fs, x, 'ro');
title("Original xa(t) = sin(480 pi t) + 3sin(720 pi t), sampled at 600 Hz");
xlabel("t (s)"); ylabel("amplitude");

subplot(2,1,2);
plot(t, -2*sin(480*%pi*t), 'g-');
plot2d3(n/Fs, x);
plot(n/Fs, x, 'ro');
title("Reconstructed ya(t) = -2sin(480 pi t) through the same samples");
xlabel("t (s)"); ylabel("amplitude");
