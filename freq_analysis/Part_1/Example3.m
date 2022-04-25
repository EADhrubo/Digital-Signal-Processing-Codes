%0606085
clc; clear all; close all;

%Matrix Implementation of DTFT

x = [1 3 -9 5 10];
n1 = -1;
n2 = 3;
n = n1:n2;
M = 500;
w = (-M/2:M/2)*2*pi/M;
W = exp(-i*w'*n);
X = W*x';
figure(1)
plot(w/(2*pi),abs(X))
figure(2)
plot(w/(2*pi),angle(X)*180/pi)