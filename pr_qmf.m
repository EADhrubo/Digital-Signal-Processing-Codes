%EEE-431 Assignment, Design of a 2-channel PR-QMF FIR filter bank

close all;
clear all;
clc
clf

N=99;%filter order 99
fp=0.45;%passband edge=0.45 radians

h0 = firhalfband(N,fp,'minphase');%%FIRHALFBAND(...,'minphase') designs a minimum-phase FIR filter such
                                  % that it is a spectral factor of a halfband filter (H =
                                  %conv(B,FLIPLR(B)) is a halfband filter). This is useful for the design
                                  %of perfect reconstruction 2 channel FIR filter banks

%Use filter length to compute the other filters
L=length(h0);

n = 0:L-1;
ind=linspace(-pi,pi,L);
h1 = fliplr(((-1).^n).*h0);%analysis filter h1

g0 = 2*fliplr(h0);%synthesis filter g0

g1 = 2*fliplr(h1);%synthesis filter g1
% Note that we have
% to account for the fact that our output filters need to have a gain of
% two to compensate for the preceding upsampler.
H0=abs(fftshift(fft(h0)));
H1=abs(fftshift(fft(h1)));
G0=abs(fftshift(fft(g0)));
G1=abs(fftshift(fft(g1)));

x = zeros(512,1);
x(1:3)   = 1; x(8:10)  = 2; x(16:18) = 3; x(24:26) = 4;
x(32:34) = 3; x(40:42) = 2; x(48:50) = 1;
stemplot(x,'-Input x[n]');
figure
subplot(4,1,1)
plot(ind,H0);
title('Frequency Domain Analysis Filter H0')
subplot(4,1,2)
plot(ind,H1);
title('Frequency Domain Analysis Filter H1')
subplot(4,1,3)
plot(ind,G0);
title('Frequency Domain Synthesis Filter G0')
subplot(4,1,4)
plot(ind,G1);
title('Frequency Domain Synthesis Filter G1')

subplot(4,1,1)
stem(n,h0);
title('Time Domain Analysis Filter h0')

subplot(4,1,2)
stem(n,h1);
title('Time Domain Analysis Filter h1')

subplot(4,1,3)
stem(n,g0);
title('Time Domain Analysis Filter g0')

subplot(4,1,4)
stem(n,g1);
title('Time Domain Analysis Filter g1')

u0=filter(h0,1,x);%analysis filter
u1=filter(h1,1,x);

v0=downsample(u0,2);%downsample
v1=downsample(u1,2);

y0=upsample(v0,2);%upsample
y1=upsample(v1,2);

y00=filter(g0,1,y0);%synthesis filter
y11=filter(g1,1,y1);


y=y00+y11;%reconstruction

stemplot(y,'-Reconstructed y[n]');
figure
n=1:512;

stem(n,x);
hold on
stem(n,y)
title('Delay of 100 samples')

