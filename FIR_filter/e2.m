%0606085
clc; close all; clear all;

B = [0 1 5];
M = 21;
w = linspace(-pi,pi,512);

for i = 1:length(B)
    ksr(i,:)=kaiser(M,beta(i));
    KSR(i,:)=fftshift(fft(ksr(i,:),512));
    subplot(3,1,i),plot(w,20*log10(abs(KSR(i,:))))
end
