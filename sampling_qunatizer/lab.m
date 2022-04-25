clc;
clear all;
close all;
j=1;
f=50;
t = 0:0.001:0.4;
x = sin(2*pi*f*t);

Fs = 550;
d=Fs/f;
for i=1:d:length(x)
    y(j)=x(i);
    j=j+1;
end
j=1;
for i=1:d:length(x)
    ty(j)=t(i);
    j=j+1;
end
subplot(2,3,1), plot(t,x)
subplot(2,3,2), stem(ty,y)

ymax = max(y);
ymin=min(y);
for L=3:1:5
    b=2^L;
    
    del = (ymax-ymin)/(b-1);


    l=ymin:del:ymax;

for i=1:length(y)
    for j=1:length(l)-1
        if (y(i)<l(j+1) & y(i)>l(j))
            if (abs(y(i)-l(j+1))> abs(y(i)-l(j))) 
            q(i)=l(j);
            else q(i) = l(j+1);
            end
        end
    end
end
if(L==3)
subplot(2,3,3), stem(ty,q)
elseif (L==4)
subplot(2,3,4), stem(ty,q)   
else subplot(2,3,5), stem(ty,q) 
end

sum = 0;
for i=1:length(q)
    sum = sum + (abs(q(i)-y(i)))^2;
end
error (L-2) = sum;
end
lr=3:5;
subplot(2,3,6), plot(lr,error);

