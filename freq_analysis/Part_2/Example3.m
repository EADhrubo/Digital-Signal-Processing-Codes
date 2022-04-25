%0606085
clc; clear all; close all;

x = [1 1 0 1];
x1 = [x zeros(1,length(x)-1)];
X1 = fft(x1);
X1conj = conj(X1);
Rx = fftshift(ifft(X1.*X1conj))
rx = xcorr(x)