%0606085
clc; clear all; close all;

t = 0:.001:.1;
x = sin(2*pi*10*t) + sin(2*pi*50*t) + sin(2*pi*100*t);
subplot(3,1,1),plot(t,x)

Fs = 250; %Sampling frequency should be greater than 200
ts = 0:(1/Fs):.1;
xs = interp1(t,x,ts);
subplot(3,1,2),stem(ts,xs)

xr = interp1(ts,xs,t);
subplot(3,1,3),stem(t,xr)