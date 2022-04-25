%0606085
clc; close all; clear all;

t = -.1:.001:.1;
x = sin(2*pi*10*t);
subplot(2,3,1),plot(t,x)

Fsm = [20 50 100 150 200];

for i=1:5
    Fs = Fsm(i);
    ts = -.1:(1/Fs):.1;
    xs = interp1(t,x,ts);
    figure(1)
    subplot(2,3,i+1),stem(ts,xs)
    xr=interp1(ts,xs,t);
    figure(2)
    subplot(2,3,i+1),stem(t,xr)
end