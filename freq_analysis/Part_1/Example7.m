%0606085
clc; clear all; close all;

%Circular Frequency Shift
x = [1 0 1 0 1];
N = 10;
L = length(x);
x = [x zeros(1,N-L)];
n = length(x);
n = 0:N-1;
k = 0:N-1;
l = 3;
Wn1 = exp(-i*2*pi/N);
WN1 = Wn1.^(n'*k);
X1 = WN1*x';
subplot(2,1,1),stem(k,abs(X1))
for ii = 1:N
    x(ii) = x(ii) * exp(i*2*pi*ii*l/N);
end
Wn2 = exp(-i*2*pi/N);
WN2 = Wn2.^(n'*k);
X2 = WN2*x';
subplot(2,1,2),stem(k,abs(X2))