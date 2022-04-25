%0606085
clc; clear all; close all;

%Fs = [4*BW 2*BW 1.25*BW BW]
tsg = [.0025 .005 .008 .01];
to = .1;
for j = 1:4
    ts = tsg(j);
    Fs = 1/ts;
    nup = round(to/ts);
    nlo = -nup;
    n = nlo:nup;
    t = n*ts;
    m = (sinc(100*t)).^2;
    N = 1024;
    fn = [0:1/N:5-1/N]*Fs - 5*Fs/2;
    k = 0:5*N-1;
    WN = exp(-i*2*pi/N);
    nk = n'*k;
    W = WN.^nk;
    M = m*W;
    subplot(4,1,j),plot(fn,abs(fftshift(M)))
end