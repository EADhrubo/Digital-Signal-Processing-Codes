%0606085
clc; clear all; close all;

w0 = 0.2*pi;
w1 = 0.22*pi;
w2 = 0.6*pi;
N = 1024;
n = 0:100;
x = cos(w0*n) + cos(w1*n) + cos(w2*n);

fn=linspace(-1,1-1/N,N);
x1=x(1:25);
x2=x(1:50);
x3=x(1:100);

figure(1)
subplot(3,1,1), plot(fn,abs(fftshift(fft(x1,N))));
subplot(3,1,2), plot(fn,abs(fftshift(fft(x2,N))));
subplot(3,1,3), plot(fn,abs(fftshift(fft(x3,N))));

X1=x1'.*(hann(25));
X2=x2'.*(hann(50));
X3=x3'.*(hann(100));

figure(2)
subplot(3,1,1), plot(fn,abs(fftshift(fft(X1,N))));
subplot(3,1,2), plot(fn,abs(fftshift(fft(X2,N))));
subplot(3,1,3), plot(fn,abs(fftshift(fft(X3,N))));