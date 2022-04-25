clc;
clear all;
close all;

M=4096;
p=3;
a=[10 5 2];
w=[pi/10 pi/7 pi/4];
snr=[0 10 20];
n=0:1:1000;
theta=2*pi*rand(1,3);

x=a(1)*sin(w(1)*n+theta(1))+a(2)*sin(w(2)*n+theta(2))+a(3)*sin(w(3)*n+theta(3));
for i=1:3
    y=awgn(x,snr(i));
    N=length(y);
    K=1;   % number of segments
    L=floor(length(y)/K);
    Px=zeros(M,1);
    nn=1;
    for j=1:K
        yy=y(nn:nn+L-1);
        Px=Px+mpereka(yy,1,M);
        nn=nn+L;
    end
    Px=Px/K;
    wa=0:M-1;
    wa=2*pi*wa/M;
    figure,
    plot(wa,Px)  
end 

