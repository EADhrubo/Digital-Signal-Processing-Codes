%0606085
clc; clear all; close all;

x1 = [0 1 2 3];
x2 = [0 1 2 3];

n1 = 1; %elemnt number of arrow
n2 = 2;
nx1=(1-n1):(length(x1)-n1);
nx2=(1-n2):(length(x2)-n2);

nxmin=min(nx1(1),nx2(1));
nxmax=max(nx1(end),nx2(end));
n=nxmin:nxmax;

y1=zeros(1,length(n));
y2=y1;
y1(find((n>=nx1(1))&(n<=nx1(end))))=x1;
y2(find((n>=nx2(1))&(n<=nx2(end))))=x2;
y=y1+y2;

subplot(3,1,1),stem(n,y1)
subplot(3,1,2),stem(n,y2)
subplot(3,1,3),stem(n,y)