clc; close all; clear all;

wc=2;
N=21;% <- change it
M=(N-1)/2;
n=-M:M;
h=wc/pi*sinc(wc*n/pi);
figure(1)
plot(n,h)
figure(2)
n=n+M;
plot(n,h)
w=linspace(-pi,pi,512);
H=fftshift(abs(fft(h,512)));
figure(3)
plot(w,H)
figure(4)
plot(w,20*log10(H))

    