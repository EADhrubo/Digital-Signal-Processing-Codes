%0606085
clc; clear all; close all;

T = .002;
tstep = T/100;
t = tstep:tstep:T;
x = 2*sin(2*pi*t/T);
[r,lags] = xcorr(x);

stem(lags,r/max(r))