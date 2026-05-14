clear all 

N = 10^6; % number of bits or symbols rand('state',100); 
% initializing the rand() function randn('state',200); 
% initializing the randn() function 
% Transmitter 
ip = rand(1,N)>0.5; % generating 0,1 with equal probability 
s = 2*ip-1; % BPSK modulation 0 -> -1; 1 -> 1 
n = 1/sqrt(2)*[randn(1,N) + j*randn(1,N)]; % white gaussian noise, 0dB variance 
Eb_N0_dB = [-3:10]; % multiple Eb/N0 values 
for ii = 1:length(Eb_N0_dB) 
    % noise addition 
    y = s + 10^(-Eb_N0_dB(ii)/20)*n; % additive white gaussian noise 
    % receiver - hard decision decoding 
    ipHat = real(y)>0; 
    % counting the errors 
    nErr(ii) = size(find([ip - ipHat]),2); 
end 
simBer = nErr/N; % simulated ber 
theoryBer = 0.5*erfc(sqrt(10.^(Eb_N0_dB/10))); % theoretical ber 
% plot 
close all 
figure 
semilogy(Eb_N0_dB,theoryBer,'b.-'); 
hold on 
semilogy(Eb_N0_dB,simBer,'mx-'); 
axis([-3 10 10^-5 0.5]) 
grid on 
legend('theory','simulation'); 
xlabel('Eb/No, dB'); 
ylabel('Bit Error Rate'); 
title('Bit error probability curve for BPSK modulation');

clear all
clc

N = 10^6; % Number of bits

% Generate random bits
ip = rand(1,N) > 0.5;

% BPSK modulation
s = 2*ip - 1;

EbNodB = 0:35;

for ii = 1:length(EbNodB)

    EbNo = 10^(EbNodB(ii)/10);

    % Rayleigh fading channel
    h = (1/sqrt(2)) * (randn(1,N) + 1j*randn(1,N));

    % AWGN noise
    n = (1/sqrt(2)) * (randn(1,N) + 1j*randn(1,N));

    % Received signal
    y = h.*s + (10^(-EbNodB(ii)/20))*n;

    % Equalization
    yHat = y ./ h;

    % Decision device
    ipHat = real(yHat) > 0;

    % Count errors
    nErr(ii) = sum(ip ~= ipHat);

end

% Simulated BER
simBer = nErr / N;

% Theoretical BER for Rayleigh channel
EbNoLin = 10.^(EbNodB/10);

theoryBerRayleigh = 0.5 * (1 - sqrt(EbNoLin ./ (1 + EbNoLin)));

% Theoretical BER for AWGN channel
theoryBerAWGN = 0.5 * erfc(sqrt(EbNoLin));

%% Plotting

figure

semilogy(EbNodB, theoryBerAWGN,'b','LineWidth',2)
hold on

semilogy(EbNodB, theoryBerRayleigh,'r-s','LineWidth',2)

semilogy(EbNodB, simBer,'g-x','LineWidth',2)

grid on

xlabel('Eb/No, dB')
ylabel('Bit Error Rate')

title('BER for BPSK modulation in Rayleigh channel')

legend('AWGN-Theory','Rayleigh-Theory','Rayleigh-Simulation')

clear;
N = 10^6;                          % number of bits

% Transmitter
ip = rand(1,N) > 0.5;              % generate 0 or 1
s = 2*ip - 1;                      % BPSK modulation: 0 -> -1, 1 -> +1

% Eb/N0 range in dB
Eb_N0_dB = 0:1:35;
simBer = zeros(size(Eb_N0_dB));

for ii = 1:length(Eb_N0_dB)

    % Rayleigh fading channel (complex Gaussian)
    h = 1/sqrt(2)*(randn(1,N) + 1j*randn(1,N));

    % AWGN noise
    n = 1/sqrt(2)*(randn(1,N) + 1j*randn(1,N));

    % Received signal: faded + noisy
    y = h.*s + 10^(-Eb_N0_dB(ii)/20)*n;

    % Equalization
    yHat = y ./ h;

    % Receiver
    ipHat = real(yHat) > 0;

    % BER calculation
    simBer(ii) = sum(ip ~= ipHat)/N;

end

% Theoretical BER (AWGN and Rayleigh)
EbNO = 10.^(Eb_N0_dB/10);

theoryBer_AWGN = 0.5 * erfc(sqrt(EbNO));
theoryBer_Rayleigh = 0.5 * (1 - sqrt(EbNO ./ (1 + EbNO)));

% Plot
semilogy(Eb_N0_dB, theoryBer_AWGN, 'c*-', ...
    Eb_N0_dB, theoryBer_Rayleigh, 'bs-', ...
    Eb_N0_dB, simBer, 'mx-');

grid on;
xlabel('Eb/No, dB');
ylabel('Bit Error Rate');
title('BER for BPSK modulation in Rayleigh channel');
legend('AWGN-Theory', 'Rayleigh-Theory', 'Rayleigh-Simulation');
axis([0 35 1e-5 1]);
