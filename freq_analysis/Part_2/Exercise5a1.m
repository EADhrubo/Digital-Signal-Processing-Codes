%0606085
clc; clear all; close all;

%Modulation
to = .01;
ts = .001;
fc = 250;
fs = 1/ts;
t = [-to:ts:to];
m = sinc(100*t);
c = cos(2*pi*fc*t);
u = m.*c;
N = 1024;
M = fft(m,1024);
M = M/fs;
U = fft(u,1024);
U = U/fs;
fn = [0:1/N:1-1/N]*fs - fs/2;
figure(1)
subplot(2,1,1),plot(fn,abs(fftshift(M)))
subplot(2,1,2),plot(fn,abs(fftshift(U)))