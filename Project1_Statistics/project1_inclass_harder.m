%% CS-435 Project 1 in Class
% Ari Cooper
% Sep 8, 2016

clear all, close all, clc;

%% Load data
normtemp = load('normtemp.dat.txt');
n = length(normtemp); % extract the length
[row, col] = size(normtemp); % extract size

gender = normtemp(:, 2);
bodytemp = normtemp(:, 1);
heartrate = normtemp(:, 3);

%% Calculations
%bodytemp
bodytemp_mean = mean(bodytemp);
bodytemp_sdev = sqrt(var(bodytemp));

%heartrate
heartrate_mean = mean(heartrate);
heartrate_sdev = sqrt(var(heartrate));


%% Display on Console

fprintf('The mean bodytemp is: %5.2f degrees.\n', bodytemp_mean);
fprintf('The standard deviation for bodytemp is: %5.2f degrees.\n', bodytemp_sdev);
fprintf('The mean hearrate is: %5.2f degrees.\n', heartrate_mean);
fprintf('The standard deviation for heartrate is: %5.2f degrees.\n', heartrate_sdev);

%% Write to File

fid = fopen('result_inclass.txt', 'w'); %Open a file
fprintf(fid, 'Ari Cooper \n');
fprintf(fid, 'Project 1, Sep 8, 2016');
fprintf(fid, ' ------- \n\n\n');
fprintf(fid, 'The mean bodytemp is: %5.2f degrees.\n', bodytemp_mean);
fprintf(fid, 'The standard deviation for bodytemp is: %5.2f degrees.\n', bodytemp_sdev);
fprintf(fid, 'The mean hearrate is: %5.2f degrees.\n', heartrate_mean);
fprintf(fid, 'The standard deviation for heartrate is: %5.2f degrees.\n', heartrate_sdev);

%% Gendered Calculations
%Males
male = find(gender == 2, 1) - 1;
male_bodytemp_mean = mean(bodytemp(1:male));
male_bodytemp_sdev = sqrt(var(bodytemp(1:male)));
male_heartrate_mean = mean(heartrate(1:male));
male_heartrate_sdev = sqrt(var(heartrate(1:male)));

%Females
Female_bodytemp_mean = mean(bodytemp(male+1 : end));
Female_bodytemp_sdev = sqrt(var(bodytemp(male+1 : end)));
Female_heartrate_mean = mean(heartrate(male+1 : end));
Female_heartrate_sdev = sqrt(var(heartrate(male+1 : end)));

%% Generate a scatter plot and histogram

x = 1 : n;

figure(1)
plot(x, bodytemp,'b')
title('Body Temperature', 'FontSize', 20);
xlabel('People', 'FontSize', 16, 'FontWeight', 'bold');
ylabel('Temp', 'FontSize', 16, 'FontWeight', 'bold');

figure(2)
plot(x, heartrate, 'r')
title('Heartrate', 'FontSize', 20);
xlabel('People', 'FontSize', 16, 'FontWeight', 'bold');
ylabel('Rate', 'FontSize', 16, 'FontWeight', 'bold');

figure(3)
hist(bodytemp)
title('Body Temperature', 'FontSize', 20);
xlabel('Temp', 'FontSize', 16, 'FontWeight', 'bold');
ylabel('Frequency', 'FontSize', 16, 'FontWeight', 'bold');

figure(4)
hist(heartrate)
title('Heartrate', 'FontSize', 20);
xlabel('Rate', 'FontSize', 16, 'FontWeight', 'bold');
ylabel('Frequency', 'FontSize', 16, 'FontWeight', 'bold');
