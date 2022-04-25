%0606085
clc; clear all; close all;

x1=[4 2 6 3 8 1 5];
x2=[3 8 6 9 6 7];
n1=-2:4;
n2=-4:1;

kmin=n1(1)+n2(1);
kmax=n1(end)+n2(end);
y=conv(x1,x2);
k=kmin:kmax;

y1=zeros(1,length(k));
y2=y1;
y1(find((k>=n1(1))&(k<=n1(end))))=x1;
y2(find((k>=n2(1))&(k<=n2(end))))=x2;

subplot(3,1,1), stem(k,y1);
subplot(3,1,2), stem(k,y2);
subplot(3,1,3), stem(k,y);