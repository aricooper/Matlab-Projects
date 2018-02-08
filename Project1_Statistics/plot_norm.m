%% In class project 1, part 2, Plot several normally distributed functions in one plot
%Sep 8, 2016

%% From scratch

clear all, close all, clc;

mu = 0;
sigma2 = 0.2;

x = -5 : 0.001 : 5;
% y = 1 / sqrt(2 * pi * sigma2) .* exp(-(x - mu).^2 ./ (2 * sigma2));

y1 = normpdf(x, mu, sqrt(sigma2));
y2 = normpdf(x, mu, sqrt(1.0));
y3 = normpdf(x, mu, sqrt(5.0));
y4 = normpdf(x, -2, sqrt(0.5));

 h = figure(1)
plot(x, y1, 'b', x, y2, 'r', x, y3, 'g', x, y4, 'm', 'LineWidth', 2);
title('Probability Density Function', 'FontSize', 20, ... 
    'FontWeight', 'bold');

legend('\mu = 0, \sigma^2 = 0.2', '\mu = 0, \sigma^2 = 1.0', ...
    '\mu = 0, \sigma^2 = 5.0', '\mu = -2, \sigma^2 = 0.5');
set(gca, 'FontSize', 16, 'FontWeight', 'bold');
set(gca, 'XTickLabel', {'-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5'}, ...
    'XTick', -5:5);
xlabel('X', 'FontSize', 16, 'FontWeight', 'bold');
ylabel('\Phi_{\mu, \sigma^2}(x)', 'FontSize', 16, 'FontWeight', 'bold');
grid on;

print(h, '-depsc2', '-painters', 'my_normal.eps');