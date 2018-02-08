%% CS 435 Project 2 Finance inclass 2.1
%Ari Cooper
%Sep 15, 2016

clear all, close all, clc;


%% 1. Read the data ?le and calculate cumulative daily rates of return for day 2, day 3, day 4, 
% and so on, until the last day in the data ?le.

% Load data
data = load('returns.dat.txt');

%Extract size of data
[ndays, ~] = size(data);

x = 1 : ndays; % x axis for plotting

percent_daily_ROR = data(:, 2);

figure(1)
plot(x, percent_daily_ROR, 'r')
title('Daily Rate of Return (%)');
xlabel('Days');
ylabel('Rate');

% Convert from percent to decimal
daily_ROR = percent_daily_ROR / 100;
cum_ROR = zeros(ndays, 1);
cum_ROR(1) = daily_ROR(1);

for i = 2 : ndays
    cum_ROR(i) = ((cum_ROR(i-1) + 1) * (1 + daily_ROR(i))) - 1;
end

percent_cum_ROR = cum_ROR * 100;

figure(2)
plot(x, percent_cum_ROR, 'r', 'LineWidth', 2);
title('Cumulative Rate of Return (%)', 'FontSize', 16, 'FontWeight', 'bold');
xlabel('Days', 'FontSize', 16, 'FontWeight', 'bold');
ylabel('Percentage', 'FontSize', 16, 'FontWeight', 'bold');
set(gca, 'FontSize', 16, 'FontWeight', 'bold');
grid on;

%% 2. Plot a bar chart of daily rates return in percent, using two different colors for positive returns 
% and negative returns (for example, green bars for positive and red bars for negative, or as shown in figure).

% Extract pos and neg portion of percent_daily_ROR

pos = max(0, percent_daily_ROR);
neg = min(0, percent_daily_ROR);

figure(3)
bar(x, pos, 'g', 'EdgeColor', 'g');
hold on;
bar(x, neg, 'r', 'EdgeColor', 'r');
title('Daily Rate of Return (%)', 'FontSize', 16, 'FontWeight', 'bold');
xlabel('Days', 'FontSize', 16, 'FontWeight', 'bold');
ylabel('Percentage', 'FontSize', 16, 'FontWeight', 'bold');
set(gca, 'FontSize', 16, 'FontWeight', 'bold');


%% 3. Plot a line chart without markers of cumulative daily rate of return in percent.


%% 4. Calculate average daily and annualized daily rate of return.

ave_daily_ROR = (cumprod(1 + daily_ROR)).^(1/ndays) -1;
anu_daily_ROR = (1 + ave_daily_ROR) .^ 252 - 1;


%% 5. Calculate average daily and annualized daily volatility.

vol_ave_daily = std(daily_ROR);
vol_anu_daily = vol_ave_daily * sqrt(252);


%% 6. Write an output text ?le named cumulative_returns.dat with three numbers in each line:
% Day number, daily return in percent, and cumulative return in percent (do not include a percent sign)

fid = fopen('cumulative_returns.dat', 'w');

fprintf(' Days  |  Daily return (%%)  |  Cumulative return (%%)\n');
fprintf('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=\n\n');

fprintf(fid, ' Days  |  Daily return (%%)  |  Cumulative return (%%)\n');
fprintf(fid, '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=\n\n');

for i = 1 : ndays
    fprintf(fid, '%5d %14.2f%% %14.2f%%\n', i, percent_daily_ROR(i), percent_cum_ROR(i));
    fprintf('%5d %14.2f%% %14.2f%%\n', i, percent_daily_ROR(i), percent_cum_ROR(i));
end

