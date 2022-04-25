%0606085
clc; clear all; close all;

T = 2e-3;
tstep = T/100;
t = tstep:tstep:3*T;
x = 2*sin(2*pi*t/T);

Px = sum(x.^2)/length(x);
SNR = [0 -5 -10];
Py = (Px/10).^(SNR/10);
for i = 1:3
n(i,:) = sqrt(Py(i)) * randn(1,length(t));
y(i,:) = x + n(i,:);
ACF_y(i,:) = xcorr(y(i,:));
end

subplot(2,2,1),plot(t,x)
subplot(2,2,2),plot(tstep*(-length(y(1,:))+1:length(y(1,:))-1),ACF_y(1,:)/max(ACF_y(1,:)));
subplot(2,2,3),plot(tstep*(-length(y(2,:))+1:length(y(1,:))-1),ACF_y(2,:)/max(ACF_y(2,:)));
subplot(2,2,4),plot(tstep*(-length(y(3,:))+1:length(y(1,:))-1),ACF_y(3,:)/max(ACF_y(3,:)));


%From the ACF of the noisy sequence we can determine the period of the original periodic signal,
%by finding out the time difference between two consecutive peaks.
%Thus the determined period from noisy sequence of
%0dB noise is 2.04ms
%-5dB noise is 2.02ms
%-10dB noise is 2.04ms
%Whereas the period of original periodic wave is 2ms

%As the phase shift does not make any change to the ACFs hence the phase
%shift information is impossible to recover from the ACF of a signal with or without noise.