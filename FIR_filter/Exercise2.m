%0606085
clc; close all; clear all;

BT = [0 1 5];
M = 21;
w = linspace(-pi,pi,512);

for i = 1:length(BT)
    B = BT(i);
    k = kaiser(M,B);
    K = fftshift(fft(k,512));
    subplot(3,1,i),plot(w,20*log10(abs(K)))
end