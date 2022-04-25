% Name: Ehsan Ahmed Dhrubo
% ID: 1206100


clc;
clear all;
close all;
n=-10:20;
un=[n>=0];
M=50;
L=find(un>0);
un=[un zeros(1,(M-L))];  % input signal

T=0.01;

% designing polyphase decomposed filter using multirate concept

for k=0:1:(M-1)
    g(k+1)=exp(-i*2*pi*k/T)*(1/M)*exp(i*k*2*pi/T)*un(k+1);
end

% implementing IDFT block

m=0:(M-1);
k=0:(M-1);
Wn=exp(i*2*pi/M);
WN=Wn.^(m'*k);
v=M*WN*g';

figure(1)
subplot(211)
stem(k/M,abs(v),'k', 'linewidth', 2);
xlabel('Digital frequency, f (Hz)', 'fontsize', 14);
ylabel('|V(f)|', 'fontsize', 14);
title('Magnitude Spectrum', 'fontsize', 14);
subplot(212)
stem(k/M,angle(v)*180/pi, 'k', 'linewidth', 2);
xlabel('Digital frequency, f (Hz)', 'fontsize', 14);
ylabel('angle(V(f))', 'fontsize', 14);
title('Phase Spectrum', 'fontsize', 14);
abs(v)
angle(v)*180/pi

% reconstruction of input signal

y=0;
for k=1:1:M
    y=y+abs(v(k));
end

x=T*abs(y)*un;
figure(2)
subplot(211)
stem(un);
title('Input Signal');
subplot(212)
stem(x);
title('Reconstructed Signal');

