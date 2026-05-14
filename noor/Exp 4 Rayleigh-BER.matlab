%% ============================================================
%  PART 1 : BPSK over AWGN Channel
%  Theory vs Simulation
%  ============================================================

clear;
clc;
close all;

%% Parameters

N = 1e6;                          % Number of bits

% Generate random bits
ip = rand(1,N) > 0.5;

% BPSK modulation
% 0 --> -1
% 1 --> +1
s = 2*ip - 1;

% Eb/N0 range
Eb_N0_dB = -3:10;

% Storage
simBer_AWGN = zeros(size(Eb_N0_dB));

%% Simulation

for ii = 1:length(Eb_N0_dB)

    % Convert Eb/N0 from dB to linear
    EbNo = 10^(Eb_N0_dB(ii)/10);

    % ---------------------------------------------------------
    % AWGN Noise
    %
    % Variance:
    %
    % sigma^2 = 1/(2*Eb/N0)
    % ---------------------------------------------------------

    n = (1/sqrt(2)) * randn(1,N);

    % Received signal
    y = s + n/sqrt(EbNo);

    % Receiver decision
    ipHat = y > 0;

    % BER
    simBer_AWGN(ii) = sum(ip ~= ipHat)/N;

end

%% Theory BER

EbNoLin = 10.^(Eb_N0_dB/10);

theoryBer_AWGN = ...
    0.5 * erfc(sqrt(EbNoLin));

%% Plot

figure

semilogy(Eb_N0_dB,...
         theoryBer_AWGN,...
         'b-o',...
         'LineWidth',2);

hold on

semilogy(Eb_N0_dB,...
         simBer_AWGN,...
         'r-x',...
         'LineWidth',2);

grid on

xlabel('Eb/No (dB)')
ylabel('Bit Error Rate')

title('BER for BPSK over AWGN Channel')

legend('Theory','Simulation')

axis([-3 10 1e-5 1])





%% ============================================================
%  PART 2 : BPSK over Rayleigh Fading Channel
%  Theory vs Simulation
%  ============================================================

clearvars -except N

%% Parameters

% Generate random bits
ip = rand(1,N) > 0.5;

% BPSK modulation
s = 2*ip - 1;

% Eb/N0 range
Eb_N0_dB = 0:35;

% Storage
simBer_Rayleigh = zeros(size(Eb_N0_dB));

%% Simulation

for ii = 1:length(Eb_N0_dB)

    % Convert dB to linear
    EbNo = 10^(Eb_N0_dB(ii)/10);

    % ---------------------------------------------------------
    % Rayleigh fading channel
    %
    % h ~ CN(0,1)
    %
    % |h| follows Rayleigh distribution
    % ---------------------------------------------------------

    h = (1/sqrt(2)) * ...
        (randn(1,N) + 1j*randn(1,N));

    % ---------------------------------------------------------
    % Complex AWGN noise
    % ---------------------------------------------------------

    n = (1/sqrt(2)) * ...
        (randn(1,N) + 1j*randn(1,N));

    % ---------------------------------------------------------
    % Channel model
    %
    % y = h*s + n
    % ---------------------------------------------------------

    y = h.*s + n/sqrt(EbNo);

    % ---------------------------------------------------------
    % Equalization
    %
    % Assume perfect channel knowledge
    % ---------------------------------------------------------

    yHat = y ./ h;

    % Receiver decision
    ipHat = real(yHat) > 0;

    % BER
    simBer_Rayleigh(ii) = ...
        sum(ip ~= ipHat)/N;

end

%% Theory BER

EbNoLin = 10.^(Eb_N0_dB/10);

% AWGN Theory
theoryBer_AWGN = ...
    0.5 * erfc(sqrt(EbNoLin));

% Rayleigh Theory
theoryBer_Rayleigh = ...
    0.5 * ...
    (1 - sqrt(EbNoLin ./ (1 + EbNoLin)));

%% Plot

figure

semilogy(Eb_N0_dB,...
         theoryBer_AWGN,...
         'b-',...
         'LineWidth',2);

hold on

semilogy(Eb_N0_dB,...
         theoryBer_Rayleigh,...
         'r-s',...
         'LineWidth',2);

semilogy(Eb_N0_dB,...
         simBer_Rayleigh,...
         'k-x',...
         'LineWidth',2);

grid on

xlabel('Eb/No (dB)')
ylabel('Bit Error Rate')

title('BER for BPSK over Rayleigh Fading Channel')

legend('AWGN-Theory',...
       'Rayleigh-Theory',...
       'Rayleigh-Simulation')

axis([0 35 1e-5 1])
