clc; close all; clear all;

t=0:.001:.1;
y=sin(2*pi*10*t)+sin(2*pi*50*t)+sin(2*pi*100*t);
subplot(2,2,1), plot(t,y)
title ('Analog Signal');
Fs=250;
i=1;
    for j=1:round((length(t)-1)*10/Fs):length(t)
        ts(i)=t(j);
        ys(i)=y(j);
        i=i+1;
    end
    
    C=[3 4 6];
for w=1:3
    b=C(w);
    L=2^b;
    del=(max(ys)-min(ys))/(L-1);

    for i=1:L
        l(i)=min(ys)+del*(i-1);
    end
    yq=ys;
    for i=1:length(l)-1
        temp= yq>l(i) & yq<l(i+1) & abs(yq-l(i))<abs(yq-l(i+1));
        yq(temp)=l(i);
        temp=find(yq>l(i) & yq<l(i+1) & abs(yq-l(i))>abs(yq-l(i+1)));
        yq(temp)=l(i+1);
    end

    QNP(w)=sum((yq-ys).^2);
    SP(w)=sum(y.^2);
    SQNR=SP./QNP;
    SQNRdB_A=10*log10(SQNR);
    SQNRdB_B(w)=1.76+6*b;

    for p=1:length(t)
        yr(p)=interp1(ts,yq,t(p));
    end


    subplot (2,2,w+1), stem(t,yr)
    title (['Reconstructed Signal for Quantized Bits: ', num2str(b)])
end


%subplot (2,1,1), plot (C,SQNRdB_A)
%title ('SQNR using eqn. A')
%subplot (2,1,2), plot (C,SQNRdB_B)
%title ('SQNR using eqn. B')



