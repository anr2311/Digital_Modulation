clc;
clear all;
close all;

A = 5;  % Amplitude
t = 0 : 0.001 : 1;

f1 = 20;

% Carrier sine wave
x = A .* sin(2 * pi * f1 * t);

% Plot the carrier signal
subplot(3,1,1);
plot(t, x);
xlabel('Time');
ylabel('Amplitude');
title('Carrier Signal');
grid on;

% Define the binary data sequence
binary_data = [1 0 1 1 1 1 0 0 1];
num_bits = length(binary_data);
bit_duration = length(t) / num_bits;  % Duration of each bit in samples

% Generate the message signal with binary phase shifts
u = zeros(1, length(t));
for i = 1:num_bits
    start_index = round((i-1) * bit_duration) + 1;
    end_index = round(i * bit_duration);
    if binary_data(i) == 1
        u(start_index:end_index) = 1;  % +1 for '1' (no phase shift)
    else
        u(start_index:end_index) = -1; % -1 for '0' (180° phase shift)
    end
end

% Plot the binary message signal
subplot(3,1,2);
plot(t, u);
axis ([0 1 -2 2])
xlabel('Time');
ylabel('Amplitude');
title('Binary Message Signal');
grid on;

% Generate the PSK-modulated signal
v = x .* u;

% Plot the PSK signal
subplot(3,1,3);
plot(t, v);
axis([0 1 -6 6]);
xlabel('Time');
ylabel('Amplitude');
title('PSK Signal');
grid on;
