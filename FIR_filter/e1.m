clc; clear all; close all;

L=21;
n=-(L-1)/2:(L-1)/2;
rct=rectwin(L);
brt=bartlett(L);
hnn=hann(L);
hmm=hamming(L);
blk=blackman(L);
figure(1)
subplot(3,2,1), plot(n,rct)
title('Rectangular')
subplot(3,2,2), plot(n,brt)
title('Bartlett')
subplot(3,2,3), plot(n,hnn)
title('Hanning')
subplot(3,2,4), plot(n,hmm)
title('Hamming')
subplot(3,2,5), plot(n,blk)
title('Blackman')

p=512;
RCT=fftshift(fft(rct,p));
BRT=fftshift(fft(brt,p));
HNN=fftshift(fft(hnn,p));
HMM=fftshift(fft(hmm,p));
BLK=fftshift(fft(blk,p));
w=linspace(-pi,pi,p);
figure(2)
subplot(3,2,1), plot(w,20*log10(abs(RCT)))
title('Rectangular')
subplot(3,2,2), plot(w,20*log10(abs(BRT)))
title('Bartlett')
subplot(3,2,3), plot(w,20*log10(abs(HNN)))
title('Hanning')
subplot(3,2,4), plot(w,20*log10(abs(HMM)))
title('Hamming')
subplot(3,2,5), plot(w,20*log10(abs(BLK)))
title('Blackman')

