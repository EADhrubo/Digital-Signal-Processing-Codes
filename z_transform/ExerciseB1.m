%0606085
clc; clear all; close all;

b = [0 1];
a = [3 -4 1];
[R,p,C] = residuez(b,a)

syms z f;
f = z/(3*z^2 - 4*z + 1);
iztrans(f)