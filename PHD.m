clear all;
close all;
clc;

p=3;
n=0:1023;
xi= 35*exp(1j*1000*n)+25*exp(1j*500*n)+30*exp(1j*250*n);
fs=2000;
snr=[0 5 10 15 20];
for i1=1:5
    
x= awgn(xi,snr(i1));
SNR=snr(i1)

%Step1: Vmin,LambdaMin estimation
[X,R] = corrmtx(x,p);
[v,d]=eig(R);

v=flipdim(v,2);
sigma=min(diag(d));
index=find(flipud(diag(d))==sigma);

a = v(:,index);

r=roots(a);
omega= angle(r);

vnew=v;
vnew(:,index)=[];

V=zeros(p,p);
for m=1:p
    for n=1:p
        for l=1:p+1
            V(m,n)=V(m,n)+vnew(l,m)*exp(-1j*(l-1)*omega(n));
        end
    end
end

Vmag= abs(V).^2;
lambda= flipud(diag(d));
lambdanew=lambda;
lambdanew(index)=[];

%omega/pi
P=sqrt(pinv(Vmag)*(lambdanew-sigma))

Error_in_p=[30 25 35]'-P


 M=p+1;

%% Step1: Vmin,LambdaMin estimation
x=x(:);
if M<p+1||length(x)<M
    error('Size of R is inappropriate');
end
[X,R] = corrmtx(x,M-1);

[v,d]=eig(R);
[y,i ]=sort(diag(d));

%% Step2: Freq estimation
PX=0;
%for j=1:M-p
    PX=abs(fft(v(:,1),1024));
%end


s=PX.^-2;
PX=-20*log10(PX);
figure(i1)
plot(linspace(0,2,length(x)),PX)
title('PHD algorithm output');
xlabel('Frequency')
ylabel('Amplitude on log scale')

[aa,bb]=findpeaks(s,'NPEAKS',p);
WW=linspace(0,2,length(x));
disp('Frequencies are = ')
omega=WW(bb)

error_in_omega=[0.4 0.45 0.8]-omega

end












