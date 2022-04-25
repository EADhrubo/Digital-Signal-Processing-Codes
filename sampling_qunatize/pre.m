%%exp1pa
close all;
clear all;
clc;
%% original signal
T=-.2:.0001:.2;
X=sin(20*pi*T+pi/6);
%% sampling
fs=50;
t=min(T)-1/fs;
i=0;
while t<=max(T)
    t=t+1/fs;
    j=1;
    i=i+1;
    f=0;
    while (f==0 && T(j)<max(T))  
        if (abs(T(j)-t)<.0001)
            f=1;
            x(i)=X(j);
        end
        j=j+1;
    end
end
ts=min(T):1/fs:max(T);
%% ploting
% figure
% subplot(3,1,1); plot(ts,x,'o',T,X);

%% quanta

n=3;
m=max(abs(x));

y=x/m;
l=2/(2^n-1);
div=-1:l:1;
lev=0:7;
chk=-1-l/2:l:1+l/2;

for i=1:length(x)
    for j=1:2^n
        if(chk(j)<=x(i) && x(i)<chk(j+1)) 
            q(i)=div(j);
            Q(i)=lev(j);
        end
    end
end

Qb=dec2bin(Q);
% plot(ts,x,'o',ts,q,'*');

%%
e=(x-q);
sum=0;
l1=length(e);
for i=1:l1
    sum=sum+e(i)^2;
end
noisepow=sqrt(sum/l1);
%plot(e);

tt=-.2:.005:.2;
yy=interp1(ts,q,tt);
plot(tt,yy,ts,q,'o',T,X);


