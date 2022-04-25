%0606085
clc; clear all;close all;

to = .1;
fc1 = 250;
fc2 = 750;
fs = 2000;
ts=1/fs;
t = [-to:ts:to];
m1 = sinc(100*t);
m2 = sinc(100*t).^2;
c1 = cos(2*pi*fc1*t);
c2 = cos(2*pi*fc2*t);
u = m1.*c1 + m2.*c2;
figure(1)
plot(t,u)

N = 1024;
M1 = fft(m1,1024);
M1 = M1/fs;
M2 = fft(m2,1024);
M2 = M2/fs;
U = fft(u,1024);
U = U/fs;
fn = [0:1/N:1-1/N]*fs - fs/2;
figure(2)
plot(fn,abs(fftshift(M1)));
figure(3)
plot(fn,abs(fftshift(M2)));
figure(4)
plot(fn,abs(fftshift(U)));