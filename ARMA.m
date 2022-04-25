clc
clear all
close all
%%%%%%%%%%%%%%%%%%%%
A1 = 5;
w1 = .4*pi %0.46*pi
A2 = 6;
w2 = .46*pi %0.58*pi
A3 = 7;
w3 = .8*pi %0.98*pi
n = 0:128;
adj = length(n); % adjustment for rxx
snr = 10;
%%%%%%%%%%%%%%%%%%%%
p = 4;
q = 4; % ARMA(p,q)
a = zeros(p,1); % AR param
b = zeros(q+1,1); % MA param
%%%%%%%%%%%%%%%%%%%%%%
x = A1 * exp(j*w1*n) + A2 * exp(j*w2*n) + A3 * exp(j*w3*n); %% pure signal
x = awgn(x,snr); %% noisy signal
rxx = xcorr(x,x,'biased');

%%
s = 8;
R = zeros(s,s); %%% Pre-Allocation
R((1:p),1) =  [ rxx((q+adj):(q+p-1+adj)) ]';
for  i = p+1:s
    R(p+1,:) =  []; %%% row resize
end
for  i = p+1:s
    R(:,p+1) =  []; % column resize
end
for  i = 2:p
    R((1:p),i) = [ rxx((q+adj-(i-1)):(q+p-1+adj-(i-1))) ]';
end
for  i = 2:p
    R(i,i)=R(1,1);
end
B = [ rxx((q+adj+1):(q+p+adj)) ]';
a = linsolve(R,-B);
A = [1 a'];

[H,F] = freqz(1,A,[],1);

[pks,locs] = findpeaks(20*log10(abs(H)));
freq = locs * pi/514;

%%
% here x process will be filtered FIR with params of AR models
v = filter(A,1,x);
rvv = xcorr(v,v,'biased');

rxx = rvv;
R = zeros(s,s); %%% Pre-Allocation
q = 0;
adj = length(v);
R((1:p),1) =  [ rxx((q+adj):(q+p-1+adj)) ]';
for  i = p+1:s
    R(p+1,:) =  []; %%% row resize
end
for  i = p+1:s
    R(:,p+1) =  []; % column resize
end
for  i = 2:p
    R((1:p),i) = [ rxx((q+adj-(i-1)):(q+p-1+adj-(i-1))) ]';
end
for  i = 2:p
    R(i,i)=R(1,1);
end
% R
B = [ rxx((q+adj+1):(q+p+adj)) ]';
a = linsolve(R,-B);
A = [1 a'];
% sigma_sq = rxx(adj)+[rxx(adj-p:adj-1)]* circshift(a,p-1);
% sigma = abs(sqrt(sigma_sq))
figure(3)
[H1,F1] = freqz(1,A,[],1);
plot(2*pi*F1,20*log10(abs(H1).*abs(H)),'b','linewidth',2);
xlabel('rad/s'); ylabel('dB/Hz');
title('Power Spectral Density of ARMA(4,4) System Function')

[pks,locs] = findpeaks(20*log10(abs(H1).*abs(H)),'MINPEAKHEIGHT',1);
freq = locs * pi/514
hold on;
% offset values of peak heights for plotting
plot(freq,pks+0.05,'k^','markerfacecolor',[1 0 0]);
% 10.^(pks/20)