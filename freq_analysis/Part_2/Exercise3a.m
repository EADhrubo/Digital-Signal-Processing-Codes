%0606085
clc; clear all; close all;

x1=rand(1,51);
n=1:51;
x2=sin(2*pi*(1000)*n/10000);

x=x1+x2;
N=length(x);
nx=[x zeros(1,N-1)];
NX=fft(nx);
NXc=conj(NX);
Rx=fftshift(ifft(NX.*NXc));
rx=xcorr(x);
figure(1)
subplot(2,1,1),plot(Rx);
subplot(2,1,2),plot(rx);

P=(NX.*NXc)/51;
figure(2)
stem(P)