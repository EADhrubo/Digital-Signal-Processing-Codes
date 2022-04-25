%0606085
clc; clear all; close all;

w0 = 0.2*pi;
N = 2048;
n = 0:100;
x = cos(w0*n);

fn=linspace(-1,1-1/N,N);

x1=x(1:25);
figure(1)
plot(fn,abs(fftshift(fft(x1,N))));

X1 = x1'.*(hann(25));
figure(2)
plot(fn,abs(fftshift(fft(X1,N))));

w1 = 0.2*pi;
w2 = 0.6*pi;
y = cos(w1*n) + cos(w2*n);

y1 = y(1:25);
figure(3)
plot(fn,abs(fftshift(fft(y1,N))));

Y1 = y1'.*(hann(25));
figure(4)
plot(fn,abs(fftshift(fft(Y1,N))));