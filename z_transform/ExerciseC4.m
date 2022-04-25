%0606085
clc; clear all; close all;

n = -10:40
b = [1 1/3];
a = [1 -.5];
h = impz(b,a,n);
figure(1)
stem(n,h)

figure(2)
zplane(b,a)