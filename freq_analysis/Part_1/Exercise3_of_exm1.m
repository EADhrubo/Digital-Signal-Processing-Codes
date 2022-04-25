%0606085
clc; clear all; close all;

Fs = 100e3;
dt = 1/Fs;

%Generating the sine wave
T = 1e-3;
f = 1/T;
t = -T/2:dt:T/2;
n = t/dt;
x = -1*sin(2*pi*f*t);
figure(1)
subplot(2,1,1),plot(t,x)
subplot(2,1,2),stem(n,x)

%Fourier coefficients
N = length(x);
Nc = N;
if mod(Nc,2)==0
    k = -Nc/2:Nc/2-1;
else
    k = -(Nc-1)/2:(Nc-1)/2;
end
c = zeros(1,length(k));
for i1 = 1:length(k)
    for i2 = 1:length(x)
        c(i1) = c(i1) + (1/N)*x(i2)*exp(-i*2*pi*k(i1)*n(i2)/N);
    end
end
figure(2)
stem(k,abs(c))
figure(3)
stem(k,angle(c)*180/pi)