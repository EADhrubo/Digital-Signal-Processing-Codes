%0606085
clc; clear all; close all;

%Calculation of 5 point DFT
x = [1 1 0 0 1];
N = 5;
L = length(x);
x = [x zeros(1,N-L)];
n = length(x);
n = 0:N-1;
k = 0:N-1;
Wn = exp(-i*2*pi/N);
WN = Wn.^(n'*k);
X = WN*x';
figure(1)
stem(k/N,abs(X))
figure(2)
stem(k/N,angle(X)*180/pi)