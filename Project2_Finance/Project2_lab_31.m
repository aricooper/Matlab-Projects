%% CS 435 Project 2 Finance 3.1
%Ari Cooper
%Sep 15, 2016

clear all, close all; clc;

%% 1. Read the two data Files.

A_data = load('returns_a.dat.txt');
B_data = load('returns_b.dat.txt');


Date_a = A_data(:,1);
percent_daily_return_a = A_data(:,2);
daily_ROR_a = percent_daily_return_a / 100;

Date_b = B_data(:,1);
percent_daily_return_b = B_data(:,2);
daily_ROR_b = percent_daily_return_b / 100;

%Extract size of data
[ndays, ncol] = size(percent_daily_return_a);

x = 1 : ndays;

%% 2. Calculate the di?erence between the daily rates of return for the two stocks, 
% that is, daily rate of return for stock A minus daily rate of return for stock B. Call this di?erence between daily rates of return X.

X = daily_ROR_a - daily_ROR_b;

%% 3. Calculate and plot a line chart of the cumulative daily rate of return for A and B in a left-right split subplot, 
% compare their cumulative rate of return at the end of the time period.

cum_ROR_a = zeros(ndays, 1);
cum_ROR_a(1) = daily_ROR_a(1);

for i = 2 : ndays
    cum_ROR_a(i) = ((cum_ROR_a(i-1) + 1) * (1 + daily_ROR_a(i))) - 1;
end

cum_ROR_b = zeros(ndays, 1);
cum_ROR_b(1) = daily_ROR_b(1);

for i = 2 : ndays
    cum_ROR_b(i) = ((cum_ROR_b(i-1) + 1) * (1 + daily_ROR_b(i))) - 1;
end

percent_cum_ROR_a = cum_ROR_a * 100;
percent_cum_ROR_b = cum_ROR_b * 100;

figure(1)
set(figure(1), 'Position', [500, 500, 1000, 500]);

subplot(1, 2, 1);
plot(x, percent_cum_ROR_a, 'r');
title('Cumulative Rate of Return of a (%)', 'FontSize', 16, 'FontWeight', 'bold');
xlabel('Days', 'FontSize', 16, 'FontWeight', 'bold');
ylabel('Percentage', 'FontSize', 16, 'FontWeight', 'bold');
grid on;

subplot(1, 2, 2);
plot( x, percent_cum_ROR_b, 'b');
title('Cumulative Rate of Return of b(%)', 'FontSize', 16, 'FontWeight', 'bold');
xlabel('Days', 'FontSize', 16, 'FontWeight', 'bold');
ylabel('Percentage', 'FontSize', 16, 'FontWeight', 'bold');
grid on;

%% 4. Plot a bar chart of the cumulative rate of return for X, 
% using black bars for positive numbers and magenta bars for negative numbers.
cum_ROR_X = zeros(ndays, 1);
cum_ROR_X(1) = X(1);

for i = 2 : ndays
    cum_ROR_X(i) = ((cum_ROR_X(i-1) + 1) * (1 + X(i))) - 1;
end

percent_cum_ROR_X = cum_ROR_X * 100;

pos = max(0, percent_cum_ROR_X);
neg = min(0, percent_cum_ROR_X);

figure(2)
bar(x, pos, 'black');
hold on;
bar(x, neg, 'm', 'EdgeColor', 'm');
title('Cumulative Rate of Return of X (%)', 'FontSize', 16, 'FontWeight', 'bold');
xlabel('Days', 'FontSize', 16, 'FontWeight', 'bold');
ylabel('Percentage', 'FontSize', 16, 'FontWeight', 'bold');
set(gca, 'FontSize', 16, 'FontWeight', 'bold');

%% 5. Calculate annualized daily return and annualized daily volatility for X.

ave_daily_ROR_X = (cumprod(1 + X)).^(1/ndays) -1;
anu_daily_ROR_X = (1 + ave_daily_ROR_X) .^ 252 - 1;

vol_ave_daily_X = std(X(2 : ndays, 1));
vol_anu_daily_X = vol_ave_daily_X * sqrt(252);

%% 6. Calculate the ratio of the annualized daily return for X to the annualized daily volatility of X. 
% This term is called the “Information Ratio”. In ?nance term, it measures excess return of A over B per unit of extra risk.

ir = anu_daily_ROR_X(end) / vol_anu_daily_X;


%% 7. Display the information ratio in the console.

fprintf('The information ratio is %.3f\n', ir);

%% Based on the results of your program, would you say that stock A was a better investment than stock B? Write a paragraph to explain your reasons.

% It appears that b is in fact the better investment. Since we calculated
% X, or the returns of a - the returns of b, it is clear to compare to two.
% As we can see in the bar chart, although both stocks seem to compare
% equally for about 100 days, the returns on stock b are clearly larger as
% over half of the bar graph is showing negative returns. Similarly, in the
% left-right subplot, the cumulative rate of return for b reaches a higher
% mark than that of a, and steadily increases for the last half of the
% data, reaching a peak of 30% rather than the 20% that a shows.











