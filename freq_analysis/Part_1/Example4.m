%0606085
clc; clear all; close all;

%Relationship between z-transform and DTFT
k = 256;
w = -pi:pi/k:pi;
num = 1;
den = [1 -0.1];
H = freqz(num,den,w);
figure(1)
plot(w,abs(H))
figure(2)
plot(w,angle(H)*180/pi)