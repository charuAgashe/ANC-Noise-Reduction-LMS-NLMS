clc;
clear;
close all;

%% 1. Load test audio
[file, path] = uigetfile({'*.wav;*.mp3'}, 'Select Test Audio');
if isequal(file,0)
    disp('No audio selected');
    return;
end

[s, fs] = audioread(fullfile(path,file));

% Convert stereo to mono
if size(s,2) > 1
    s = mean(s,2);
end

% Normalize
s = s / max(abs(s));

%% 2. Create noise
N = length(s);

rng(1);

noise = randn(N,1);

% Normalize noise
noise = noise / max(abs(noise));

% Adjust noise level
noise = 0.25 * noise;

%% 3. Create noisy speech
d = s + noise;

%% 4. Reference noise
% In a real ANC system this comes from the reference microphone.
x = noise;

%% 5. LMS Adaptive Filter

M = 32;          % Filter length
mu = 0.005;      % LMS step size

w = zeros(M,1);

y_lms = zeros(N,1);
e_lms = zeros(N,1);

for n = M:N
    
    x_vec = x(n:-1:n-M+1);
    
    y_lms(n) = w' * x_vec;
    
    e_lms(n) = d(n) - y_lms(n);
    
    w = w + mu * e_lms(n) * x_vec;
end

%% 6. NLMS Adaptive Filter

mu_nlms = 0.5;

w = zeros(M,1);

y_nlms = zeros(N,1);
e_nlms = zeros(N,1);

epsilon = 1e-6;

for n = M:N
    
    x_vec = x(n:-1:n-M+1);
    
    y_nlms(n) = w' * x_vec;
    
    e_nlms(n) = d(n) - y_nlms(n);
    
    w = w + (mu_nlms/(epsilon + x_vec'*x_vec)) ...
        * e_nlms(n) * x_vec;
end

%% 7. Calculate SNR

snr_noisy = 10*log10(sum(s.^2) / sum((d-s).^2));

snr_lms = 10*log10(sum(s.^2) / sum((e_lms-s).^2));

snr_nlms = 10*log10(sum(s.^2) / sum((e_nlms-s).^2));

fprintf('\n--- ANC RESULTS ---\n');

fprintf('Noisy Audio SNR : %.2f dB\n', snr_noisy);
fprintf('LMS Output SNR  : %.2f dB\n', snr_lms);
fprintf('NLMS Output SNR : %.2f dB\n', snr_nlms);

%% 8. Plot waveforms

t = (0:N-1)/fs;

figure;

subplot(3,1,1);
plot(t,s);
title('Original Test Audio');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,2);
plot(t,d);
title('Noisy Audio');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,3);
plot(t,e_lms);
title('LMS Enhanced Audio');
xlabel('Time (s)');
ylabel('Amplitude');

%% 9. NLMS result

figure;

subplot(2,1,1);
plot(t,e_lms);
title('LMS Output');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2,1,2);
plot(t,e_nlms);
title('NLMS Output');
xlabel('Time (s)');
ylabel('Amplitude');

%% 10. Play audio

disp('Playing noisy audio...');
soundsc(d,fs);
pause(length(d)/fs + 1);

disp('Playing LMS output...');
soundsc(e_lms,fs);
pause(length(e_lms)/fs + 1);

disp('Playing NLMS output...');
soundsc(e_nlms,fs);