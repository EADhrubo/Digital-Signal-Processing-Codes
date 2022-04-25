clc;
clear all;
close all;
n=-10:20;
un=[n>=0];
M=50;
L=length(un);
un=[un zeros(1,M-L)];
%m=0:(M-1);
%k=0:(M-1);
T=0.001;
for k=0:1:(M-1)
    g(k+1)=exp(-i*2*pi*k/T)*(1/M)*exp(i*k*2*pi/T)*un(k+1);
end

m=0:(M-1);
k=0:(M-1);
Wn=exp(i*2*pi/M);
WN=Wn.^(m'*k);
v=M*WN*g';
figure(1) 
subplot(211) 
stem(k/M,abs(v),'k', 'linewidth', 2) 
xlabel('Digital frequency, f (Hz)', 'fontsize', 14) 
ylabel('|X(f)|', 'fontsize', 14) 
title('Magnitude Spectrum', 'fontsize', 14);
subplot(212) 
stem(k/M,angle(v)*180/pi, 'k', 'linewidth', 2) 
xlabel('Digital frequency, f (Hz)', 'fontsize', 14) 
ylabel('angle(X(f))', 'fontsize', 14) 
title('Phase Spectrum', 'fontsize', 14);
abs(v)
angle(v)*180/pi
y=0;
 for k=1:1:(M/2)
     y=y+abs(v(k));
 end
 for k=((M/2)+1):1:M
     y=y-abs(v(k));
 end
 
 x=(1/M)*abs(y)*un;
 stem(x);

