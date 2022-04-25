%0606085
clc; clear all; close all;

Fs = 100e3;
dt = 1/Fs;

%Generating a sinc pulse
T = 1e-3;
f = 1/T;
t = -2*T:dt:2*T;
n = t/dt;
x = sinc(2*f*t);
x = [x(1:length(x)-1) x(1:length(x)-1) x];
t = -6*T:dt:6*T;
n = t/dt;
figure(1)
plot(t,x)

%Fourier coefficients
N = length(t);
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
stem(k*f,c)

