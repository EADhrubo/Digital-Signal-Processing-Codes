%0606085
clc; clear all; close all;

x = [1 1 3 5 7 2];
y = [5 5 5 3 3 1 1];
nx = -1:4;
ny = -5:1;

min1 = min(nx(1),ny(1));
max1 = max(nx(end),ny(end));
kmin = nx(1)-ny(end);
kmax = nx(end)-ny(1);
k = min(kmin,min1):max(kmax,max1);
l=length(k);

xn = zeros(1,l);
yn = xn;
xn(find(k>=nx(1) & k<=nx(end))) = x;
yn(find(k>=ny(1) & k<=ny(end))) = y;

for i = 1:l
    yn2 = yn;
    if(k(i)==0)
        a(i) = sum(xn.*yn);
    elseif (k(i)>0)
        for j = 1:abs(k(i))
            yn2 = [0,yn2(1:l-1)];
        end
        a(i) = sum(xn.*yn2);
    else
        for j = 1:abs(k(i))
            yn2 = [yn2(2:l),0];
        end
        a(i) = sum(xn.*yn2);
    end
end
stem(k,a)