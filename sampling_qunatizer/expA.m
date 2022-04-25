clc;
x=0:0.005:0.1;
A=sin(2*pi*10*x+pi);
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
subplot(3,1,1); stem(y); 
subplot(3,1,2);plot(B);
subplot(3,1,3);stem(B);
% around 200 hz  we gets original signal