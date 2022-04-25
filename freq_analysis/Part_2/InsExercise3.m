%0606085
clc; clear all; close all;

w = [0 pi/3 2*pi/3 pi];
L = 2;
f = w/pi;
mag = [1 1 0 0];
x = fir2(99,f,mag);
[X,w] = freqz(x,1,512);
figure(1)
plot(w/pi,abs(X))
figure(2)
stem(x)

y = zeros(1,L*length(x));
y(1:L:length(y)) = x;
figure(3)
stem(y)
[Y,w] = freqz(y,1,512);
figure(4)
plot(w/pi,abs(Y))

syms n w L a;
ym = sin(a*n);
Ym = ztrans(ym)
ym2 = sin(a*n/L);
Ym2 = ztrans(ym2)