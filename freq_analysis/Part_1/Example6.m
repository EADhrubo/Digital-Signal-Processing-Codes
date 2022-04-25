%0606085
clc; clear all; close all;

%Verification of Parseval's Theorem
x = ones(1,10);
Et = sum(x.*x)
X = fft(x,128);
Ef = sum(X.*conj(X)/128)