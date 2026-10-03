clc; clear;
n = 0:16;

// Case 1: Fs = 8 Hz, T/Tp = 3/8 (rational)
T1 = 1/8;
x1 = cos(2*%pi*3*n*T1);
diff1 = max(abs(x1(1:8) - x1(9:16)))

// Case 2: Fs = 2*pi Hz, T/Tp = 3/(2*pi) (irrational)
T2 = 1/(2*%pi);
x2 = cos(2*%pi*3*n*T2);
diff2 = max(abs(x2(1:8) - x2(9:16)))

// Plots:
scf(1); clf();
subplot(2,1,1);
t1 = linspace(0, 16*T1, 1000);
plot(t1, cos(2*%pi*3*t1), 'b-');
plot2d3(n*T1, x1);
plot(n*T1, x1, 'ro');
title("Case 1: T/Tp = 3/8 (rational) -> periodic, N = 8");
xlabel("t (s)"); ylabel("x(n)");

subplot(2,1,2);
t2 = linspace(0, 16*T2, 1000);
plot(t2, cos(2*%pi*3*t2), 'b-');
plot2d3(n*T2, x2);
plot(n*T2, x2, 'ro');
title("Case 2: T/Tp = 3/(2pi) (irrational) -> not periodic");
xlabel("t (s)"); ylabel("x(n)");
