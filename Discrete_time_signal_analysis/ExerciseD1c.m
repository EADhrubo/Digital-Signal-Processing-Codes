%0606085
clc; clear all; close all;

x = randn(1,100);
[r,lags] = xcorr(x);

plot(lags,r/max(r))