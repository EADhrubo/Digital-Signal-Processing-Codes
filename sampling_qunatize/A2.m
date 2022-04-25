clc; close all; clear all;

f=10;
t=0:.005:.1;
xa=sin(2*pi*f*t);
subplot(2,3,1), plot(t,xa);
title('Analog Signal');
F=[10 20 50 100];
for i=1:4
Fs=F(i);
d=round(Fs/f);

j=1;
for p=1:((length(xa)-1)/d):length(xa)
    xs(j)=xa(p);
    Ts(j)=t(p);
    j=j+1;
end
for p=1:length(t)
    xr(p)=interp1(Ts,xs,t(p));
end

subplot(2,3,i+1), stem(t,xr);
title (['Sampled Frequency: ', num2str(F(i)), 'Hz']);
end


