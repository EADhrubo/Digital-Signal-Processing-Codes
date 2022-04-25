%0606085
clc; close all; clear all;

t = 0:.001:.1;
x = sin(2*pi*10*t) + sin(2*pi*50*t) + sin(2*pi*100*t);

Fs = 200;
ts = 0:(1/Fs):.1;
xs = interp1(t,x,ts);
xn = xs/max(xs);

b = [3,4,6];

for k = 1:3
    L = 2^b(k);
    d = 2/(L-1);
    l = -1:d:1;
    for i = 1: length(xn)
        for j = 1:L
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
    qs = q * max(xs);
    np(k) = sum((xs - qs).^2)/(length(ts)-1);
    sp(k) = sum(x.^2)/(length(t)-1);
    SQNR(k) = sp(k)/np(k);
    SQNRA(k) = 10*log10(SQNR(k));
    SQNRB(k) = 1.76 + 6*b(k);
end

plot(b,SQNRA,'r')
hold on;
plot(b,SQNRB,'b')