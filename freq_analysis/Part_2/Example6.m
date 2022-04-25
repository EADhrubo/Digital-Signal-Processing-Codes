%0606085
clc; clear all; close all;

w = [0 pi/3 2*pi/3 pi];
freq = w/pi;
mag = [1 1 0 0];
x = fir2(99,freq,mag);
[X,w] = freqz(x,1,512);
plot(w/pi,abs(X),'k','Linewidth',2)