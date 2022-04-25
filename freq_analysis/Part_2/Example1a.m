%0606085
clc; clear all; close all;

x = [1 2 3 4 5];
n1 = [0 1 2 3 4];
subplot(2,1,1),stem(n1,x)
N = length(x);
m = 2;
x = [x zeros(1,N-length(x))];
n = 0:N-1;
n = mod(n-m,N);
y = x(n+1);
subplot(2,1,2),stem(n1,y)