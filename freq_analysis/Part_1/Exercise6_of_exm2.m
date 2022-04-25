%0606085
clc; clear all; close all;

%Generating a sinc pulse
f_c = 1/8;
n = -40:40;
x = sinc(2*f_c*n);
figure(1)
stem(n,x)

%Fourier Transform
M = 101;
w = linspace(-pi,pi,M);
dw = w(2) - w(1);
X = zeros(1,M);
for i1 = 1:M
    for i2 = 1:length(x)
        X(i1) = X(i1) + x(i2)*exp(-i*w(i1)*n(i2));
    end
end
figure(2)
plot(w,abs(X))

%Generating a rectangular pulse
Fs = 100e3;
dt = 1/Fs;
T = 1e-3;
D = .2;
PW = D*T;
f = 1/T;
t = -T/2:dt:T/2;
n = t/dt;
L = PW/dt;
x = zeros(1,length(t));
x(find(abs(n)<=L/2)) = 1.1;
figure(3)
stem(n,x)

%Fourier Transform
M = 101;
w = linspace(-pi,pi,M);
dw = w(2) - w(1);
X = zeros(1,M);
for i1 = 1:M
    for i2 = 1:length(x)
        X(i1) = X(i1) + x(i2)*exp(-i*w(i1)*n(i2));
    end
end
figure(4)
plot(w,X)