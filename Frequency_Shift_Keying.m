clc;
close all;
clear all;

fc1 = 20;
fc2 = 10;
amp = 4;

% Define the binary data sequence
binary_data = [1 0 0 1 1 1 1 0 0];
num_bits = length(binary_data);

% Define time vector
t = 0:0.001:1;
bit_duration = length(t) / num_bits;  % Duration of each bit in samples

% Generate the carrier waves
c1 = amp .* sin(2 * pi * fc1 * t);
c2 = amp .* sin(2 * pi * fc2 * t);

% Plot carrier wave 1
subplot(4,1,1);
plot(t, c1);
xlabel('Time');
ylabel('Amplitude');
title('Carrier Wave 1');

% Plot carrier wave 2
subplot(4,1,2);
plot(t, c2);
xlabel('Time');
ylabel('Amplitude');
title('Carrier Wave 2');

% Generate the binary message signal based on binary_data sequence
m = zeros(1, length(t));
for i = 1:num_bits
    start_index = round((i-1) * bit_duration) + 1;
    end_index = round(i * bit_duration);
    m(start_index:end_index) = amp * binary_data(i);
end

% Plot binary data sequence as a pulse signal
subplot(4,1,3);
plot(t, m);
axis ([0 1 -1 5])
xlabel('Time');
ylabel('Amplitude');
title('Binary Message Pulses');

% Generate the FSK modulated signal based on the binary data sequence
mm = zeros(1, length(t));
for i = 1:num_bits
    start_index = round((i-1) * bit_duration) + 1;
    end_index = round(i * bit_duration);
    if binary_data(i) == 1
        mm(start_index:end_index) = c1(start_index:end_index); % Use fc1 for '1'
    else
        mm(start_index:end_index) = c2(start_index:end_index); % Use fc2 for '0'
    end
end

% Plot the FSK signal
subplot(4,1,4);
plot(t, mm);
xlabel('Time');
ylabel('Amplitude');
title('FSK Signal');
