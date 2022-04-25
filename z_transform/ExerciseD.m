%0606085
clc; close all; clear all;

a = [1 -5 6];
A(length(a)-1,:)=a;
A(:,1) = 1;
B(length(a)-1,:) = fliplr(A(length(a)-1,:));
K(length(a)-1) = A(length(a)-1,length(a));

for k = length(a)-2:-1:1
    for j = length(a):-1:2
        A(k,j) = (A(k+1,j)-K(k+1)*B(k+1,j))/(1-K(k+1)^2);
    end
    K(k) = A(k,k+1);
    B(k,:) = fliplr(A(k,:));
end

b = [1];
zplane(b,a)

if sum(abs(K)>=1)>0
    display('Unstable')
else
    display('Stable')
end