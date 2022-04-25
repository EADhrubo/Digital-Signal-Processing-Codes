clear all; close all; clc;
%% Sinusoidal Signal General
t = 0:.01:20;
snrdb = [0 10 20];
x = sin(t);             % Create sawtooth signal.
tScheme ={'s', 'h'} ; len = length(tScheme);
tNames ={'Soft', 'Hard'} ;
TPTR = 'heursure';  % Heuristic Stein's Unbiased Risk Estimate 
SCAL = 'one';
N = 9;
wname = 'db10';
for count=1:len
%% Denoising
    SORH = tScheme{count};
    for i=1:3
        xn = awgn(x,snrdb(i));      % Add white Gaussian noise.
        y = xn;
        [xd,~,~] = wden(y,TPTR,SORH,SCAL,N,wname);
        %% Plots
        figure(2*i+count-2)
        subplot(3, 1, 1), plot(t, x, 'LineWidth', 2);
        title(strcat(tNames(count), ' thresholding, SNR = ',...
            num2str(snrdb(i)), ' dB\newline\newlineOriginal Signal'))
        subplot(3, 1, 2), plot(t, xn, 'LineWidth', 2);
        title('Noisy Signal');
        subplot(3, 1, 3), plot(t, xd, 'LineWidth', 2);
        title('Recovered Signal')
        %% Performance Metrics
        MAD(count,i) = mad(x', xd');
        SD(count,i) = std(abs(x'- xd'));
        r(count,i) = corr(x', xd');
    end
end    
