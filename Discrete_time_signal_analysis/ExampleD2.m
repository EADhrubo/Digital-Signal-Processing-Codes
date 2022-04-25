%0606085
clc; clear all; close all;

T = 2e-3;
tstep = T/100;
t = tstep:tstep:3*T;
x = 2*sin(2*pi*t/T); %Input

Px = sum(x.^2)/length(x);
SNR = -10; %in dB
Py = Px/10^(SNR/10);
n = sqrt(Py) * randn(1,length(t)); %generate white noise
y = x + n; %corrupted input

ACF_x = normalize(xcorr(x));
ACF_n = normalize(xcorr(n));
ACF_y = normalize(xcorr(y));
ACF_y(length(x)) = .4 * max(ACF_y);

figure(1)
subplot(2,1,1),plot(t,x)
subplot(2,1,2),plot(t,n)

figure(2)
subplot(2,1,1),plot(tstep*(1:length(ACF_x)),ACF_x)
subplot(2,1,2),plot(tstep*(1:length(ACF_y)),ACF_y)