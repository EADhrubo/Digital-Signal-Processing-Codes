%0606085
clc; clear all; close all;

%Generating a rectangular pulse
n = -40:40;
x = zeros(1,length(n));
x(find(abs(n)<=20)) = 1.1;
figure(1)
stem(n,x)

%Fourier Transform
M = 101;
wg = [pi pi/10 pi/5 pi/2];
for j = 1:4
    w = linspace(-wg(j),wg(j),M);
    dw = w(2) - w(1);
    X = zeros(1,M);
    for i1 = 1:M
        for i2 = 1:length(x)
            X(i1) = X(i1) + x(i2)*exp(-i*w(i1)*n(i2));
        end
    end

    %Reconstruction
    n_re = -40:40;
    x_re = zeros(1,length(n_re));
    for i2 = 1:length(x_re)
        for i1 = 1:M
            x_re(i2) = x_re(i2) + 1/(2*pi)*X(i1)*exp(i*w(i1)*n_re(i2))*dw;
        end
    end
    figure(j+1)
    stem(n_re,x_re)
end