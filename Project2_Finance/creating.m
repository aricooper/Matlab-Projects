%% CS 435 Project 2 Finance Creating
%Ari Cooper
%Sep 29, 2016

close all; clc;

%% Script to Retrieve Historical Stock Data from Yahoo! Finance
% LuminousLogic.com
prompt = 'Gimme some stock mang\n';
stock_a = input(prompt, 's');
prompt = 'Gimme some more stock mang\n';
stock_b = input(prompt, 's');

% stock_a = 'F';
% stock_b = 'GM';

[hist_date_F, hist_high_F, hist_low_F, hist_open_F, hist_close_F, hist_vol_F] = get_hist_stock_data(stock_a);   % data a
[hist_date_G, hist_high_G, hist_low_G, hist_open_G, hist_close_G, hist_vol_G] = get_hist_stock_data(stock_b); % data b


%% daily ROR
%Extract size of data
[ndays, ~] = size(hist_date_G);
x = 1 : ndays;

% Ford - a
daily_ROR_a = zeros(ndays, 1);
for i = 2 : ndays
    daily_ROR_a(i) = hist_close_F(i) / hist_close_F(i-1) - 1;
end

% GM - b
daily_ROR_b = zeros(ndays, 1);
for i = 2 : ndays
    daily_ROR_b(i) = hist_close_G(i) / hist_close_G(i-1) - 1;
end

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
set(figure(1), 'Position', [200, 500, 1500, 500]);

subplot(1, 2, 1);
plot(x, percent_cum_ROR_a, 'r');
titleA = strcat(stock_a, ' Cumulative Rate of Return of');
title(titleA, 'FontSize', 16, 'FontWeight', 'bold');
xlabel('Days', 'FontSize', 16, 'FontWeight', 'bold');
ylabel('Percentage', 'FontSize', 16, 'FontWeight', 'bold');
grid on;

subplot(1, 2, 2);
plot( x, percent_cum_ROR_b, 'b');
titleA = strcat(stock_b, ' Cumulative Rate of Return of ');
title(titleA, 'FontSize', 16, 'FontWeight', 'bold');
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
set(figure(2), 'Position', [500, 100, 800, 500]);
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


