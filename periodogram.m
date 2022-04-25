close all;
clear all;
clc;

p=3;
a=[10 5 2];
w=[pi/10 pi/7 pi/4];
snr=[0 10 20];
n=0:1000;
theta=2*pi*rand(1,3);


x=a(1)*sin(w(1)*n+theta(1))+a(2)*sin(w(2)*n+theta(2))+a(3)*sin(w(3)*n+theta(3));

for i=1:3
    y=awgn(x,snr(i));
    N=length(y);
    M=4096;

    px=fft(y,M);
    px=px/N;

    px=abs(px);
    px=px.^2;

    wa=0:M-1;
    wa=2*pi*wa/M;
    figure(i),
    plot(wa,px)
% figure,
% plot(periodogram(y));
end
    


