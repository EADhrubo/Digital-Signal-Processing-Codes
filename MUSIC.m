clear all;
close all;
clc;

p=3;
M=7;
n=0:1023;
xi= 35*exp(1j*0.4*n*pi)+25*exp(1j*0.45*n*pi)+30*exp(1j*0.8*n*pi);
x= awgn(xi,10);

%% Step1: Vmin,LambdaMin estimation
x=x(:);
if M<p+1||length(x)<M
    error('Size of R is inappropriate');
end
[X,R] = corrmtx(x,M-1);

[v,d]=eig(R);
[y,i]=sort(diag(d));

%% Step2: Freq estimation
PX=0;
for j=1:M-p
    PX=PX+abs(fft(v(:,i(j)),1024));
end

PX=-20*log10(PX);

plot(linspace(0,2,length(x)),PX)
title('MUSIC algorithm output');
xlabel('Frequency')
ylabel('A,plitude')

[aa,bb]=findpeaks(PX,'NPEAKS',p);
WW=linspace(0,2,length(x));
disp('Frequencies are = ')
omega=WW(bb)
