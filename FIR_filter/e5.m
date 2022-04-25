clc; clear all; close all;

wp=1.8;
wc=2;
ws=2.2;
dp=.05;
ds=.005;

f=[wp ws];
m=[1 0];
rp=[dp ds];
[n,fo,mo,w]=remezord(f,m,rp,2*pi);
b=remez(n,fo,mo,w);

h=impz(b,1,512);
wn=linspace(-pi,pi,length(h));
plot(wn,abs(fftshift(fft(h))));