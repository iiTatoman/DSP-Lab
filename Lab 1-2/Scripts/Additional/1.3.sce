clc; clear;

// Smallest N (up to Nmax) with x(n+N) = x(n); returns 0 if none is found
function N = findperiod(x, Nmax)
    N = 0; k = 1;
    while N == 0 & k <= Nmax
        if max(abs(x(k+1:k+Nmax) - x(1:Nmax))) < 1e-9 then
            N = k;
        end
        k = k + 1;
    end
endfunction

n  = 0:199;
xb = 3*cos(5*n + %pi/6);
xc = 2*exp(%i*(n/6 - %pi));
xd = cos(n/8) .* cos(%pi*n/8);
xe = cos(%pi*n/2) - sin(%pi*n/8) + 3*cos(%pi*n/4 + %pi/3);

Nb = findperiod(xb, 100)
Nc = findperiod(xc, 100)
Nd = findperiod(xd, 100)
Ne = findperiod(xe, 100)

// plot
scf(1); clf();
t  = linspace(0, 3*2*%pi/5, 500);
subplot(3,2,1);
plot(t, 3*cos(5*t + %pi/6));
title("(a) xa(t) = 3cos(5t + pi/6)"); xlabel("t (s)"); ylabel("xa(t)");

m = 1:48;
subplot(3,2,2);
plot2d3(n(m), xb(m));
title("(b) 3cos(5n + pi/6)"); xlabel("n"); ylabel("x(n)");

subplot(3,2,3);
plot2d3(n(m), real(xc(m)));
title("(c) Re{2exp[j(n/6 - pi)]}"); xlabel("n"); ylabel("Re x(n)");

subplot(3,2,4);
plot2d3(n(m), imag(xc(m)));
title("(c) Im{2exp[j(n/6 - pi)]}"); xlabel("n"); ylabel("Im x(n)");

subplot(3,2,5);
plot2d3(n(m), xd(m));
title("(d) cos(n/8)cos(pi n/8)"); xlabel("n"); ylabel("x(n)");

subplot(3,2,6);
plot2d3(n(m), xe(m));
title("(e) N = 16"); xlabel("n"); ylabel("x(n)");
