%0606085
clc; clear all; close all;

n1 = -3;
n2 = 3;
n = n1:n2;
n0 = -1;
x1 = [(n-n0)>=0];
x2 = (n-n0).*x1;
stem(n,x2)