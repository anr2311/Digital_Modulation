clc;
clear all;
close all;

F1 = 20;

A = 3;  % Amplitude
t = 0 : 0.001 : 1;

% Define the binary data sequence
binary_data = [1 1 0 1 1 1 0 1 0];
num_bits = length(binary_data);
bit_duration = length(t) / num_bits;  % Duration of each bit in samples

% Generate the carrier wave
x = A .* sin(2 * pi * F1 * t);  % Carrier sine wave

% Generate the binary message signal based on the binary data sequence
u = zeros(1, length(t));
for i = 1:num_bits
    start_index = round((i-1) * bit_duration) + 1;
    end_index = round(i * bit_duration);
    if binary_data(i) == 1
        u(start_index:end_index) = A; % Use amplitude A for '1'
    else
        u(start_index:end_index) = 0; % Use 0 amplitude for '0'
    end
end

% Generate the ASK signal
v = x .* u;

% Display the carrier wave
subplot(3,1,1);
plot(t, x);
xlabel('Time');
ylabel('Amplitude');
title('Carrier Wave');
grid on;

% Display the binary message wave
subplot(3,1,2);
plot(t, u);
axis ([0 1 -1 5])
xlabel('Time');
ylabel('Amplitude');
title('Binary Message Pulses');
grid on;

% Display the ASK-modulated signal
subplot(3,1,3);
plot(t, v);
xlabel('Time');
ylabel('Amplitude');
title('ASK Signal');
grid on;
