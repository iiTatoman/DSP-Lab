clc; clear;

// Task 1: (x1+1, x2+1, x3+1, x4+1)
x = 1:4
v1 = x + 1

// Task 2: (x1y1, x2y2, x3y3, x4y4)
y = 5:8
v2 = x .* y

// Task 3: (sin(x1), ..., sin(x10)), 10 values evenly spaced in [0, pi]
z = linspace(0, %pi, 10)
v3 = sin(z)
