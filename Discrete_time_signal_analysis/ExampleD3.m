%0606085
clc; clear all; close all;

N = 500;
nr = 0:499;
ny = nr;
r = randn(1,N);
y = zeros(size(r));
for n = 2:500
    y(n) = r(n) - 0.6*y(n-1);
end
rr = fliplr(r);
nrr = -fliplr(nr);
Ryr = conv(y,rr);

kmin = ny(1) + nrr(1);
kmax = ny(length(ny)) + nrr(length(nrr));
k = kmin:kmax;

subplot(2,1,1),stem(k,Ryr/Ryr(N))
title('Approximate Impulse Response');

num = [1 0];
den = [1 0.6];
n = 0:499;
x = zeros(size(n));
x(1) = 1;
yy = filter(num,den,x);
subplot(2,1,2),stem(n,yy)
title('Actual Impulse Response');