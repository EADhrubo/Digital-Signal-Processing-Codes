clc;clf
x=0:0.001:0.1;
A=sin(2*pi*10*x)+sin(2*pi*50*x)+sin(2*pi*100*x);
plot (A);
n=length (x);
f=input('input frequency');
y=zeros(1,n);
for i=1:n
    if (rem (x(i),1/f)==0)
        y(i)=1;
    end
end
for i=1:n
B(i)=A(i)*y(i);
end
 C= round(B);

figure (1); stem(C);hold on;stem(B,'r'); 
figure (2);subplot(3,1,3);plot(B);hold on ; plot(C,'g');
figure (2);subplot(3,1,2);plot(C);
figure (2);subplot(3,1,1);plot(A);
% around 1000 hz, full signal is not regained yet;