%0606085
clc; clear all; close all;

n = 1:52;
x = sin(0.36*n);
L = 3;

y = zeros(1,length(n));
y(rem(n,L)==0) = x(1:(length(n)/L));
subplot(2,1,1),stem(n,x);
subplot(2,1,2),stem(n,y);