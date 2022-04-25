%0606085
clc; clear all; close all;

%Generating a sinc pulse
f_c = 1/8;
n = -40:40;
x = sinc(2*f_c*n);
figure(1)
stem(n,x)

%Fourier Transform
M = 101;
w = linspace(0,2*pi,M);
dw = w(2) - w(1);
X = zeros(1,M);
for i1 = 1:M
    for i2 = 1:length(x)
        X(i1) = X(i1) + x(i2)*exp(-i*w(i1)*n(i2));
    end
end
figure(2)
plot(w,abs(X))

%Reconstruction
n_re = -40:40;
x_re = zeros(1,length(n_re));
for i2 = 1:length(x_re)
    for i1 = 1:M
        x_re(i2) = x_re(i2) + 1/(2*pi)*X(i1)*exp(i*w(i1)*n_re(i2))*dw;
    end
end
figure(3)
stem(n_re,x_re)