%0606085
clc; close all; clear all;

wc = 2;
NT = [21 101];
for i = 1:length(NT)
    N = NT(i);
    L = (N-1)/2;
    n = -L:L;
    x = wc/pi*sinc(wc*n/pi);
    if(i==1) j = 0;
    else j = 2;
    end
    figure(j+1)
    subplot(2,1,1),plot(n,x)
    n = n + L;
    subplot(2,1,2),plot(n,x)

    w = linspace(-pi,pi,512);
    X = fftshift(abs(fft(x,512)));
    figure(j+2)
    subplot(2,1,1),plot(w,abs(X))
    subplot(2,1,2),plot(w,20*log10(abs(X)))    
end