%0606085
clc; close all; clear all;

%Analog Signal
t = -.1:.0001:.1;
x = sin(2*pi*10*t) + sin(2*pi*50*t) + sin(2*pi*100*t);
subplot(2,2,1),plot(t,x)

%Sampled Signal
Fs = 200;
ts = -.1:(1/Fs):.1;
xs = interp1(t,x,ts);
subplot(2,2,2),stem(ts,xs);
xn = xs/max(xs);

%u-law quantizer
u = 255;
xu = log(1+u*abs(xs))/log(1+u).*sign(xs);
subplot(2,2,3),stem(ts,xu);

b = 4;
L = 2^b;
d = 2/(L-1);
l = -1:d:1;
for i = 1: length(xs)
    for j = 1:length(l)
        if(xn(i)==l(j))
            q(i)=l(j);
        else
            if(xn(i)>l(j) && xn(i)<l(j+1))
                u = xn(i)-l(j);
                v = l(j+1) - xn(i);
                if(u>v)
                    q(i) = l(j+1);
                else
                    q(i) = l(j);
                end
            end
        end
    end
end
q = q*max(xs);
subplot(2,2,4),stem(ts,q);

np = sum((xu-xs).^2)/(length(ts)-1);
sp = sum(x.^2)/(length(t)-1);
SQNR = sp/np;
SQNRdB = 10*log10(SQNR);
display(SQNRdB)  