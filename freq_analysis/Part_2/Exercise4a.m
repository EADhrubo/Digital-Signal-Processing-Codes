%0606085
clc; clear all; close all;

N = 64;
ts = 125e-6;
fs = 1/ts;
f1 = 1062.5;
f2 = 1625;
t = (0:N-1)/fs;
x = sin(2*pi*f1*t) + 0.05*sin(2*pi*f2*t);

f=(0:N-1)/(N*ts)-fs/2;
figure(1)
subplot(2,1,1), plot(t,x);
subplot(2,1,2), stem(f/fs,abs(fftshift(fft(x))));

w=hann(64);
nx=x.*w';
figure(2)
subplot(2,1,1), plot(t,nx);
subplot(2,1,2), stem(f/fs,abs(fftshift(fft(nx))));