clc; clear all;
close all;

t = -.2:0.001:.2;
x = sin(20*pi*t);

Fs = 100;
ts = -.2:1/Fs:.2;
xs = interp1(t,x,ts);

subplot(2,2,1), plot(t,x);
subplot(2,2,2), stem(ts,xs);

xmin = min(x);
xmax = max(x);
b = 3;
L = 2^b;
del = (xmax-xmin)/(L-1);
xn = xs/xmax;

l = -1:del:1;

lbin  = 0:1:(L-1);

for i=1:length(xn)
    for j = 1:L
        if(xn(i)>0 & xn(i)>l(j) & xn(i)<l(j+1))
            xq(i)=l(j);
            xe(i)=lbin(j);
        end
        if(xn(i)<0 & xn(i)>l(j) & xn(i)<l(j+1))
            xq(i)=l(j+1);
            xe(i)=lbin(j+1);
        end
           end
end

subplot(2,2,3), stem(ts,xq,'r');
subplot(2,2,4), stem(ts,xe)


