%0606085
clc; close all; clear all;

n1 = -3;
n2 = 3;
nm = n1:n2;
n0 = -1;
x1 = [(nm-n0)>=0];
x = (nm-n0).*x1;

xf = fliplr(x);
nf = fliplr(nm)*(-1);

n = min(nm(1),nf(1)):max(nm(end),nf(end));

y1=zeros(1,length(n));
y2=y1;
y1(find((n>=nm(1))&(n<=nm(end))))=x;
y2(find((n>=nf(1))&(n<=nf(end))))=xf;

yev=(y1+y2)/2;
yod=(y1-y2)/2;

subplot(3,1,1), stem(nm,x);
subplot(3,1,2), stem(n,yev);
subplot(3,1,3), stem(n,yod);