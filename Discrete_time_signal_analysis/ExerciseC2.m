%0606085
clc; clear all; close all;

a = [1 0.6];
b = [1];
n = -10:20;
n0 = 0;
u = [(n-n0)>=0];
s = filter(b,a,u);

s0=s;
s2=s;
m=n+2;
nn = min(n(1),m(1)):max(n(end),m(end));

y1=zeros(1,length(nn));
y2=y1;
y1(find((nn>=n(1))&(nn<=n(end))))=s0;
y2(find((nn>=m(1))&(nn<=m(end))))=s2;
y = y1+y2;
subplot(2,1,1), stem(nn,y);

a1 = [1 0.6];
b1 = [1 0 1];
y3 = filter(b1,a1,u);
subplot(2,1,2), stem(n,y3)