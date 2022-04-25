%0606085
clc; close all; clear all;

b = [3 -4];
a = [1 -3.5 1.5];
[R,p,C] = residuez(b,a)

zplane(b,a)