%0606085
clc; clear all; close all;

%Calculation of 5 point DFT
x = [1 1 0 0 1];
N = 1000;
Nn = 5;
L = length(x);
xn = [x zeros(1,(Nn-L))];
x = [x zeros(1,N-L)];
n = length(x);
nn = length(xn);
n = 0:N-1;
nn = 0:Nn-1;
k = 0:N-1;
kn = 0:Nn-1;
Wn = exp(-i*2*pi/N);
Wnn = exp(-i*2*pi/Nn);
WN = Wn.^(n'*k);
WNn = Wnn.^(nn'*kn);
X = WN*x';
Xn = WNn*xn';
figure(1)
plot(k/N,abs(X))
hold on;
stem(kn/Nn,abs(Xn))
figure(2)
plot(k/N,angle(X)*180/pi)
hold on;
stem(kn/Nn,angle(Xn)*180/pi)