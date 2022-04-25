clc;
clear all;
close all;


p=3;
a=[10 5 2];
w=[pi/10 pi/3 pi/2];
snr=[0 10 20];
n=0:1:1000;
theta=2*pi*rand(1,3);

x=a(1)*sin(w(1)*n+theta(1))+a(2)*sin(w(2)*n+theta(2))+a(3)*sin(w(3)*n+theta(3));
for i=1:3
    y=awgn(x,snr(i));
    L=100;
    D=30;
    M=4096;
    K=floor((length(x)-L)/D)+1;  % number of segments
    N=length(y);
    Px=zeros(M,1);
    nn=1;
    for j=1:K
        yy=y(nn:nn+L-1);
        Px=Px+mpereka(yy,1,M);
        nn=nn+D;

    end
    Px=Px/K;

    wa=0:M-1;
    wa=2*pi*wa/M;
    figure(i),
    plot(wa,Px)
end


