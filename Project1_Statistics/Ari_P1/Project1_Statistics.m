%% CS-435 Project 1 in Class
% Ari Cooper
% Sep 6, 2016
clear all, clc;

%% Load Data
hotdog = load('hotdog.dat.txt');
type = hotdog(:, 1);
beef = find(type == 2, 1) - 1;
meat = find(type == 3, 1) - 1;

calorie = hotdog(:, 2);
sodium = hotdog(:, 3);

%% Generate calorie results

% Beef
beef_cal_mean = mean(calorie(1:beef));
beef_cal_var = var(calorie(1:beef));
beef_cal_sdev = sqrt(beef_cal_var);

%Meat
meat_cal_mean = mean(calorie(beef+1 : meat));
meat_cal_var = var(calorie(beef+1 : meat));
meat_cal_sdev = sqrt(meat_cal_var);

%Poultry
poultry_cal_mean = mean(calorie(meat+1 : end));
poultry_cal_var = var(calorie(meat+1 : end));
poultry_cal_sdev = sqrt(poultry_cal_var);

%% Generate sodium results

% Beef
beef_sod_mean = mean(sodium(1:beef));
beef_sod_var = var(sodium(1:beef));
beef_sod_sdev = sqrt(beef_sod_var);

%Meat
meat_sod_mean = mean(sodium(beef+1 : meat));
meat_sod_var = var(sodium(beef+1 : meat));
meat_sod_sdev = sqrt(meat_sod_var);

%Poultry
poultry_sod_mean = mean(sodium(meat+1 : end));
poultry_sod_var = var(sodium(meat+1 : end));
poultry_sod_sdev = sqrt(poultry_sod_var);

%% Display and write to file

fid = fopen('Project1_result.txt', 'w'); %Open a file
fprintf(fid, 'Ari Cooper \n');
fprintf(fid, 'Project 1, Sep 8, 2016');
fprintf(fid, ' ------- \n\n\n');

%Calories
cal = [beef_cal_mean, meat_cal_mean, poultry_cal_mean];

most_cal = max(cal);

fprintf('The hotdog with the most calories is ');
fprintf(fid, 'The hotdog with the most calories is ');
if (most_cal == beef_cal_mean) 
    fprintf('beef');
    fprintf(fid, 'beef');
else if (most_cal == meat_cal_mean)
        fprintf('meat');
        fprintf(fid, 'meat');
    else 
        fprintf('poultry');
        fprintf(fid, 'poultry');
    end
end

least_cal = min(cal);

fprintf('\nThe hotdog with the least calories is ');
fprintf(fid, '\nThe hotdog with the least calories is ');
if (least_cal == beef_cal_mean) 
    fprintf('beef');
    fprintf(fid, 'beef');
else if (least_cal == meat_cal_mean)
        fprintf('meat');
        fprintf(fid, 'meat');
    else 
        fprintf('poultry');
        fprintf(fid, 'poultry');
    end
end

%Sodium
sod = [beef_sod_mean, meat_sod_mean, poultry_sod_mean];
most_sod = max(sod);
fprintf('\n\nThe hotdog with the most sodium is ');
fprintf(fid, '\n\nThe hotdog with the most sodium is ');
if (most_sod == beef_sod_mean) 
    fprintf('beef');
    fprintf(fid, 'beef');
else if (most_cal == meat_sod_mean)
        fprintf('meat');
        fprintf(fid, 'meat');
    else 
        fprintf('poultry');
        fprintf(fid, 'poultry');
    end
end

least_sod = min(sod);
fprintf('\nThe hotdog with the least sodium is ');
fprintf(fid, '\nThe hotdog with the least sodium is ');
if (least_sod == beef_sod_mean) 
    fprintf('beef');
    fprintf(fid, 'beef');
else if (least_cal == meat_sod_mean)
        fprintf('meat');
        fprintf(fid, 'meat');
    else 
        fprintf('poultry');
        fprintf(fid, 'poultry');
    end
end

%% Plot the Histogram of meat hotdog calories

figure(1)
hist(calorie(beef+1:meat))
title('Calories of Meat Hotdogs', 'FontSize', 16, 'FontWeight', 'bold');
xlabel('Hotdogs', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Calories', 'FontSize', 12, 'FontWeight', 'bold');

%% Plot scatter plot of sodium for beef hotdogs

x = 1:beef;
figure(2)
plot(x, sodium(1:beef),'x', 'LineWidth', 2, 'Color', 'r');
title('Sodium of Beef Hotdogs', 'FontSize', 16, 'FontWeight', 'bold');
xlabel('Hotdogs', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Sodium', 'FontSize', 12, 'FontWeight', 'bold');

%% Plot lognormal distributions

mu = 0;

x = 0 : 0.001 : 3;

y1 = lognpdf(x, mu, 1);
y2 = lognpdf(x, mu, 0.5);
y3 = lognpdf(x, mu, 0.25);

h = figure(3);
plot(x, y1, 'b', x, y2, 'g', x, y3, 'r', 'LineWidth', 2);
title('Lognormal PDF', 'FontSize', 20, ... 
    'FontWeight', 'bold');
set(gca, 'FontSize', 16, 'FontWeight', 'bold');
axis([0, 3, 0 ,2]);
xlabel('X', 'FontSize', 16, 'FontWeight', 'bold');
ylab =  '$$f_x(x;\mu, \sigma) = \frac{1}{(x  \sigma  \sqrt{2  pi})^e}^-\frac{(\ln(x)-\mu)^2}{(2\sigma)^2}$$';
ylabel(ylab, 'Interpreter', 'latex', 'FontSize', 10, 'FontWeight', 'bold');
text(.1, max(y1)+.25, '\mu = 0, \sigma = 1','Color', 'b', 'FontWeight', 'bold');
text(1.5, max(y2)-.25, '\mu = 0, \sigma = .5','Color', 'g', 'FontWeight', 'bold');
text(.1, max(y3), '\mu = 0, \sigma = .25','Color', 'r', 'FontWeight', 'bold');
grid on;

 
