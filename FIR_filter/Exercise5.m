%0606085
clc; clear all; close all;

wp = 1.8;
wc = 2;
ws = 2.2;
dp = 0.05;
ds = 0.005;

f = [wp ws];
m = [1 0];
rp = [dp ds];
[n,fo,mo,w] = remezord(f,m,rp,2*pi);
b = remez(n,fo,mo,w);

h = impz(b,1,512);
wn = linspace(-pi,pi,length(h));
figure(1)
plot(wn,abs(fftshift(fft(h))))

b2 = remez(100,fo,mo,w);

h2 = impz(b2,1,512);
figure(2)
plot(wn,abs(fftshift(fft(h2))))