%0606085
clc; clear all; close all;

b = [1 2];
a = [1 0.4 -0.12];

h = impz(b,a);
stem(h)
h = h(1:10)