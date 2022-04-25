%0606085
clc; clear all; close all;

t = 0:1:300;
x = 10*sin(2*pi*.01*t);
x1 = [x,zeros(1,1000)];
t = 0:1:1300;
figure(1)
plot(t,x1)

x2 = x1/20;
x2 = [zeros(1,500),x2];
x2 = x2(1:1301);
figure(2)
plot(t,x2)

x3 = awgn(x2,-3);
figure(3)
plot(t,x3);

[y,s] = xcorr(x3,x1);
figure(4)
plot(s,y)