%0606085
clc; clear all; close all;

x0 = [1 -1 1 -1 1];
x1 = -x0;

t = [0 1 0 0 1];

for i=1:length(t)
    if (t(i) == 0)
        y(i,:) = awgn(x0,3);
    else
        y(i,:) = awgn(x1,3);
    end
    
    [q(i,:),l(i,:)] = xcorr(y(i,:),x0);
    
    qmax(i) = max(q(i,:));
    qmin(i) = min(q(i,:));
    
    if(abs(qmin(i))>abs(qmax(i)))
        r(i)=1;
    else
        r(i)=0;
    end
    
end
r