clc; close all; clear all;

t=0:.001:.1;
y=sin(2*pi*10*t)+sin(2*pi*50*t)+sin(2*pi*100*t);
subplot (2,3,1), plot (t,y)
title('Analog Signal')
F=[50 100 200 250 333];
for z=1:5
    Fs=F(z);
    i=1;
    for j=1:round((length(t)-1)*10/Fs):length(t)
        ts(i)=t(j);
        ys(i)=y(j);
        i=i+1;
    end

    for j=1:length(t)
        yr(j)=interp1(ts,ys,t(j));
    end

    subplot (2,3,z+1), stem(t,yr)
    title (['Sampled Frequency: ', num2str(F(z)), 'Hz']);
end
