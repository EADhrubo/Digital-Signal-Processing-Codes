%0606085
clc; clear all; close all;

Fs = 200e3;
dt = 1/Fs;

%Generating the rectangular pulse train
T = 1e-3;
D = .1;
PW = D*T;
f = 1/T;
t = -T/2:dt:T/2;
n = t/dt;
L = PW/dt;
x = zeros(1,length(t));
x(find(abs(n)<=L/2)) = 1.1;

%Fourier coefficients
N = length(x);
Ng = [.03*N .1*N  .5*N N];
for j = 1:4
    Nc = Ng(j);
    if mod(Nc,2)==0
        k = -Nc/2:Nc/2-1;
    else
        k = -(Nc-1)/2:(Nc-1)/2;
    end
    c = zeros(1,length(k));
    for i1 = 1:length(k)
        for i2 = 1:length(x)
            c(i1) = c(i1) + (1/N)*x(i2)*exp(-i*2*pi*k(i1)*n(i2)/N);
        end
    end
    
    %Reconstruction
    t_remax = T/2;
    t_re = -t_remax:dt:t_remax;
    n_re = t_re/dt;
    x_re = zeros(1,length(n_re));
    for i2 = 1:length(x_re)
        for i1 = 1:length(k)
            x_re(i2) = x_re(i2) + c(i1)*exp(i*2*pi*k(i1)*n_re(i2)/N);
        end
    end
    plot(t_re,x_re)
    hold on;
end