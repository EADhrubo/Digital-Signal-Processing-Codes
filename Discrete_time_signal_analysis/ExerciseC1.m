%0606085
clc; clear all; close all;

a = [1 0.6];
b = [1];
n = -10:20;
n0 = 0;

delt = [(n-n0)==0];
h = filter(b,a,delt); %generate impulse response
subplot(5,1,1), stem(n,h)

u = [(n-n0)>=0];
s = filter(b,a,u); %generate step response
subplot(5,1,2), stem(n,s);

x = 0.5*sin(n).*u;
y = filter(b,a,x); %generate sinusoidal response
subplot(5,1,3), stem(n,y)

y1= conv(double(u),double(h)); %verification of step response
y2= conv(x,h); %verification of sinusoidal response

m =-20:40;
subplot(5,1,4),stem(m,y1);
subplot(5,1,5),stem(m,y2);