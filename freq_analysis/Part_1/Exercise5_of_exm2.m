%0606085
clc; clear all; close all;

%Generating the continuous time signal
Fs=2e3;
dt=1/Fs;
t=-0.02:dt:0.02;
x=zeros(1,length(t));
x(find(abs(t)<=0.005))=sin(2*pi/0.01*t(find(abs(t)<=0.005)));
n=t/dt;
figure(1)
plot(t,x)
figure(2)
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
figure(3)
plot(w,abs(X))