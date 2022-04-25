%0606085
clc; clear all; close all;

Fs = 100e3;
dt = 1/Fs;

%Generating the rectangular pulse train
T = 1e-3;
D = .1;
PW = D*T;
f = 1/T;
t = 0:dt:T;
n = t/dt;
L = PW/dt;
x = zeros(1,length(t));
x(find(abs(n)<=L/2 | (length(n)-abs(n))<=L/2)) = 1.1;
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