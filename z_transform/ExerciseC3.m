%0606085
clc; clear all; close all;

n = -10:40;
b = [1];
a = [1 -1];
h = impz(b,a,n);
figure(1)
stem(n,h)

x = [n>=0];
s = filter(b,a,x);
figure(2)
stem(n,s)

figure(3)
zplane(b,a)