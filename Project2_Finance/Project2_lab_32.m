%% CS 435 Project 2 Finance 3.2
%Ari Cooper
%Sep 15, 2016

close all; clc;

%% Set up
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

%% 3.2 Stock drawup and drawdown

% Drawdown for a
drawdown_a = zeros(ndays, 1);
drawdown_a(1) = 0;
last_max = 1;
for i = 2 : ndays
[~, curr_max] = max(cum_ROR_a(last_max : i));
        last_max = curr_max;   
        drawdown_a(curr_max) = daily_ROR_a(curr_max);
        for j = (curr_max+1) : i
        drawdown_a(i) = ((drawdown_a(j-1) + 1) * (1 + daily_ROR_a(j))) - 1;
        end
end

figure(1)
plot(x,drawdown_a, 'b')
title('Drawdown of a', 'FontSize', 16, 'FontWeight', 'bold');
xlabel('Days', 'FontSize', 16, 'FontWeight', 'bold');
ylabel('Percentage', 'FontSize', 16, 'FontWeight', 'bold');
grid on;


% Drawdown for b
drawdown_b = zeros(ndays, 1);
for i = 1 : ndays
[~, curr_max] = max(cum_ROR_b(1 : i));
        temp_cum = zeros(ndays, 1);
        temp_cum(curr_max) = daily_ROR_b(curr_max);
        for j = (curr_max+1) : i
        drawdown_b(i) = ((temp_cum(j-1) + 1) * (1 + daily_ROR_b(j))) - 1;
        temp_cum(j) = ((temp_cum(j-1) + 1) * (1 + daily_ROR_b(j))) - 1;
        end
end

figure(2)
plot(x,drawdown_b, 'r')
title('Drawdown of b', 'FontSize', 16, 'FontWeight', 'bold');
xlabel('Days', 'FontSize', 16, 'FontWeight', 'bold');
ylabel('Percentage', 'FontSize', 16, 'FontWeight', 'bold');
grid on;

%% Drawup for a 

drawup_a = zeros(ndays, 1);
temp_cum = zeros(ndays, 1);
for i = 1 : ndays
[~, curr_min] = min(cum_ROR_a(1 : i));
        temp_cum(curr_min) = daily_ROR_a(curr_min);
        for j = (curr_min+1) : i
        drawup_a(i) = ((temp_cum(j-1) + 1) * (1 + daily_ROR_a(j))) - 1;
        temp_cum(j) = ((temp_cum(j-1) + 1) * (1 + daily_ROR_a(j))) - 1;
        end
end

figure(3)
plot(x,drawup_a, 'b')
title('Drawup of a', 'FontSize', 16, 'FontWeight', 'bold');
xlabel('Days', 'FontSize', 16, 'FontWeight', 'bold');
ylabel('Percentage', 'FontSize', 16, 'FontWeight', 'bold');
grid on;


% Drawup for b

drawup_b = zeros(ndays, 1);
temp_cum = zeros(ndays, 1);
for i = 1 : ndays
[~, curr_min] = min(cum_ROR_b(1 : i));
        temp_cum(curr_min) = daily_ROR_b(curr_min);
        for j = (curr_min+1) : i
        drawup_b(i) = ((temp_cum(j-1) + 1) * (1 + daily_ROR_b(j))) - 1;
        temp_cum(j) = ((temp_cum(j-1) + 1) * (1 + daily_ROR_b(j))) - 1;
        end
end

figure(4)
plot(x,drawup_b, 'r')
title('Drawup of b', 'FontSize', 16, 'FontWeight', 'bold');
xlabel('Days', 'FontSize', 16, 'FontWeight', 'bold');
ylabel('Percentage', 'FontSize', 16, 'FontWeight', 'bold');
grid on;





