%% CS 435 Project 2 Finance inclass 2.2
%Ari Cooper
%Sep 15, 2016

clear all, close all, clc;

%% 1. Read the data ?le and calculate daily rate of return for day 2, day 3, day 4, and so on, until the last day in the data ?le.
% Load data
price_close = load('Google_close.dat.txt');

%Extract size of data
[ndays, ncol] = size(price_close);

x = 1 : ndays; % x axis for plotting

figure(1)
plot(x, price_close);

% Calculate daily ROR

daily_ROR = nan(ndays, 1);

for i = 2 : ndays
    daily_ROR(i) = price_close(i) / price_close(i-1) - 1;
end

percent_daily_ROR = daily_ROR * 100;

%% 2. calculate cumulative daily rates of return for day 2, day 3, day 4, and so on, until the last day in the data ?le.

cum_ROR = zeros(ndays, 1);
cum_ROR(2) = daily_ROR(2);

for i = 3 : ndays
    cum_ROR(i) = ((cum_ROR(i-1) + 1) * (1 + daily_ROR(i))) - 1;
end

percent_cum_ROR = cum_ROR * 100;



%% 3. Calculate average daily and annualized daily rate of return.

ave_daily_ROR = (cumprod(1 + daily_ROR)).^(1/ndays) -1;
anu_daily_ROR = (1 + ave_daily_ROR) .^ 252 - 1;

%% 4. Plot a bar chart of daily rates return in percent, using green bars for positive returns and red bars for negative returns.

% Extract pos and neg portion of percent_daily_ROR

pos = max(0, percent_daily_ROR);
neg = min(0, percent_daily_ROR);

figure(2)
bar(x, pos, 'g', 'EdgeColor', 'g');
hold on;
bar(x, neg, 'r', 'EdgeColor', 'r');
title('Daily Rate of Return (%)', 'FontSize', 16, 'FontWeight', 'bold');
xlabel('Days', 'FontSize', 16, 'FontWeight', 'bold');
ylabel('Percentage', 'FontSize', 16, 'FontWeight', 'bold');
set(gca, 'FontSize', 16, 'FontWeight', 'bold');


%% 5. Plot a line chart without markers of cumulative daily rate of return in percent.

figure(3)
plot(x, percent_cum_ROR, 'r', 'LineWidth', 2);
title('Cumulative Rate of Return (%)', 'FontSize', 16, 'FontWeight', 'bold');
xlabel('Days', 'FontSize', 16, 'FontWeight', 'bold');
ylabel('Percentage', 'FontSize', 16, 'FontWeight', 'bold');
set(gca, 'FontSize', 16, 'FontWeight', 'bold');
grid on;


%% 6. Calculate average daily and annualized daily volatility.

vol_ave_daily = std(daily_ROR(2 : end));
vol_anu_daily = vol_ave_daily * sqrt(252);



