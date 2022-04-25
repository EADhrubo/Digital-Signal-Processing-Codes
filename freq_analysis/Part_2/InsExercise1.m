%0606085
clc;close all;clear all;

N = 1000;
w = randn(1,N);
figure(1);
plot(w);

[rw,lags] = xcorr(w);
figure(2)
plot(lags,rw);

W1 = fft(rw);
W2 = conj(W1);
W = W1.*W2;
psd = 10*log10(W/N);
figure(3)
plot(psd)