clc; close all; clear all;
format short
%Generate a sinusoidal signal
t=0:.0001:.1;
y=sin(2*pi*10*t)+sin(2*pi*50*t)+sin(2*pi*100*t);
subplot(2,2,1), plot(t,y)
title('Sinusoidal Signal')

%Sampler
Fs=500;
i=1;
for j=1:round((length(t)-1)*10/Fs):length(t)
    ts(i)=t(j);
    ys(i)=y(j);
    i=i+1;
end
subplot(2,2,2), stem(ts,ys)
title('Sampled Signal')

%u-law compressor
ys_norm=ys/max(ys);
yu=log(1+255*abs(ys_norm))/log(1+255).*sign(ys_norm);
subplot(2,2,3), stem(ts,yu)
title('Non-uniform Quantizied Signal')

%Uniform Quantizer
b=4;
L=2^b;
del=(max(ys_norm)-min(ys_norm))/(L-1);

for i=1:L
    l(i)=min(ys_norm)+del*(i-1);
end
yq=ys;
for i=1:length(l)-1
    temp= yu>l(i) & yu<l(i+1) & abs(yu-l(i))<abs(yu-l(i+1));
    yu(temp)=l(i);
    temp=find(yu>l(i) & yu<l(i+1) & abs(yu-l(i))>abs(yu-l(i+1)));
    yu(temp)=l(i+1);
end

subplot(2,2,4), stem(ts,yu)
title('Uniform Quantized Signal')
