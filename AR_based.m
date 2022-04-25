clc;
clear all;
close all;

n=0:1023; %n=0:1023;
l=length(n);
x=3*exp(1j*0.3*n*pi)+2*exp(1j*0.4*n*pi)+4*exp(1j*0.9*n*pi);
%%%noisy signal with snr 10
y=awgn(x,0); % snr= 10.

% figure;
% pxx=pyulear(y,4);
% plot(10*log10(pxx));
rx=xcorr(y,y,'biased');
order = 5; 
ap = zeros(order,1);

Rxx = zeros(order,order);
for k=1:5
    for j=k:order
        Rxx(k,j)=rx(l-j+k);
    end
    
   
    for i=k:order
        Rxx(i,k)=rx(l+i-k);
    end
end
  %     for j=2:order
%         Rxx(2,j)=rx(l-j+2);
%     end
%     
%    
%     for i=2:order
%         Rxx(i,2)=rx(l+i-2);
%     end
%       for j=3:order
%         Rxx(3,j)=rx(l-j+3);
%     end
%     
%    
%     for i=3:order
%         Rxx(i,3)=rx(l+i-3);
%     end
%       for j=4:order
%         Rxx(4,j)=rx(l-j+4);
%     end
%     
%    
%     for i=4:order
%         Rxx(i,4)=rx(l+i-4);
%     end
%       for j=5:order
%         Rxx(5,j)=rx(l-j+5);
%     end
%     
%    
%     for i=5:order
%         Rxx(i,5)=rx(l+i-5);
%     end%
%     
r=[rx(l:order+l-1)];
R=toeplitz(r);
    T=[rx(1+l:order+l)]' ;
    ap = linsolve(R,-T);
% I=inv(Rxx);
% ap=I*(-T);
    Az = [1 ap'];
    [C,W]=freqz(1,Az,[],1);
figure;
plot(2*pi*W,20*log10(abs(C)));
xlabel('Frequency(rad/s)'); ylabel('PSD(dB/Hz)');
title('PSD using AR(5) model;signal snr 0')
[peak,pos] = findpeaks(20*log10(abs(C)));
freq = pos * pi/514
