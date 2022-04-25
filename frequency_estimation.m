clc;
clear all;
close all;

dt=1e-3;
scales=linspace(01.4,18,1024);
t=0:dt:0.256;  

%% concatenated sinusoids of three different frequencies
x=[2*sin(2*pi*100*[0:dt:.06]),3*sin(2*pi*300*[.06+dt:dt:.12]),4*sin(2*pi*200*[.12+dt:dt:.256])];
figure,
plot(t,x);axis([0 0.256 -8 8]),set(gca,'FontSize',12);
title('Original signal'); 

%% wavelet transform of given signal
figure,
cwt(x,scales,'sym8','plot'); 
colormap jet; colorbar;

C = cwt(x,scales,'sym8');


M=20;
filt=ones(1,M)/M;
Cfilt=zeros(size(C));
Cth=zeros(size(C));

frq=zeros(1,length(x));
amp=zeros(1,length(x));

 for i=1:length(x)

Cfilt(:,i)=conv(abs(C(:,i)),filt,'same');
[maxval,pos]=max(Cfilt(:,i));

sd=ceil(std(Cfilt(:,i)));


[~,psi,xval] = wavefun('sym8',8);
frq(i)=1.2*mean(scal2frq(scales(pos-sd:pos+sd),'sym8',dt));
amp(i)=maxval/max(psi);
 end

 
M=10;
filt=ones(1,M)/M;
figure,
subplot(211),plot([1:length(x)]*dt,x),xlim([1 length(x)]*dt),title('Original Signal')
subplot(212),plot([1:length(x)]*dt,conv(frq,filt,'same')),title('Estimated Frequency'),xlim([1 length(x)]*dt);


 
 