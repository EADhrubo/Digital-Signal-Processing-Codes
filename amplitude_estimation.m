clc;
clear all;
close all;


dt=1e-4;
scales=linspace(01.4,15,512);
t=0:dt:0.256;

%% concatenated sinusoids of three different frequencies
x=[2*sin(2*pi*100*[0:dt:.06]),3*sin(2*pi*300*[.06+dt:dt:.12]),4*sin(2*pi*200*[.12+dt:dt:.256])];

%% detected frequencies from frequency_estimation.m
f1=100;
T1=1/f1;
f2=300;
T2=1/f2;
f3=200;
T3=1/f3;


%%  breaking point found from previous file
tb1=0;
tb2=0.06;
tb3=0.12;

t1=tb1+dt:dt:tb1+T1;
x1=x(find(t>=t1(1) & t<=t1(end)));
A1=max(abs(x1));

t2=tb2+dt:dt:tb2+T2;
x2=x(find(t>=t2(1) & t<=t2(end)));
A2=max(abs(x2));

t3=tb3+dt:dt:tb3+T3;
x3=x(find(t>=t3(1) & t<=t3(end)));
A3=max(abs(x3));

subplot(211);
plot([1:length(x)]*dt,x),xlim([dt dt*length(x)]),title('Original Signal');
disp('Three amplitudes are : ');
A1
A2
A3

t11=tb1:dt:tb2-dt;
xr1=ones(1,length(t11))*A1;

t22=tb2:dt:tb3-dt;
xr2=ones(1,length(t22))*A2;

t33=tb3:dt:t(end);
xr3=ones(1,length(t33))*A3;

subplot(212);
plot([t11 t22 t33],[xr1 xr2 xr3]),xlim([t11(1) t33(end)]); title('Detected Amplitude');


