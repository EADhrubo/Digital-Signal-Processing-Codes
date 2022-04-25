%0606085
clc; clear all; close all;

L = 21;
n = -(L-1)/2:(L-1)/2;
figure(1)
r = rectwin(L);
subplot(5,1,1),plot(n,r)
b = bartlett(L);
subplot(5,1,2),plot(n,b)
hn = hann(L);
subplot(5,1,3),plot(n,hn)
hm = hamming(L);
subplot(5,1,4),plot(n,hm)
bl = blackman(L);
subplot(5,1,5),plot(n,bl)

sp = 1024;
w = linspace(-pi,pi,sp);
figure(2)
R = fftshift(fft(r,sp));
subplot(5,1,1),plot(w,20*log10(abs(R)))
B = fftshift(fft(b,sp));
subplot(5,1,2),plot(w,20*log10(abs(B)))
HN = fftshift(fft(hn,sp));
subplot(5,1,3),plot(w,20*log10(abs(HN)))
HM = fftshift(fft(hm,sp));
subplot(5,1,4),plot(w,20*log10(abs(HM)))
BL = fftshift(fft(bl,sp));
subplot(5,1,5),plot(w,20*log10(abs(BL)))






