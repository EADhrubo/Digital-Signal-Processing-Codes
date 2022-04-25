clc; clear all; close all;

%% variable declaration
fs=200;
start=0;finish=5;
frequency=1;
t=start:1/fs:finish;
l=length(t);

%% actual signal and addition of discontinuity
x=sin(2*pi*frequency*t);
number=ceil(rand(1,1)*10);
ind=ceil(rand(1,number)*l);
ind=unique(ind);
x(ind)=5;

%% finding discontinuity
coefficients=cwt(x,1,'haar');
coefficients=coefficients/max(coefficients);
coef_diff=diff(abs(coefficients));
dummy=coefficients;
threshold=((dummy>0.4*max(coefficients)).*coefficients);
[~,index]=findpeaks(threshold);

%% Printing the result
checking=sum(ind-index);
if checking==0
    disp('EXACTLY FOUND DISCONTINUITY');
else
    disp('COULD NOT FIND DISCONTINUITY');
end
exact_time=start+ind/fs;
estimated_time=start+index/fs;
plot(t,x,exact_time,5.1*ones(1,length(ind)),'k+',estimated_time,5.2*ones(1,length(ind)),'ro');
legend('discontinous signal','actual discontinuity','estimated discontinuity');
