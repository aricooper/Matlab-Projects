%% CS-435 Project 1 in Class
% Ari Cooper
% Sep 6, 2016

%% Load data
bodytemp = load('bodytemp.dat.txt');
n = length(bodytemp); % extract the length
[row, col] = size(bodytemp); % extract size

%%Generate x
x = 1 : n;

%% Generate a scatter plot
% figure(1)
% scatter(x, bodytemp);

% Change color and marker size
% figure(2)
% scatter(x, bodytemp, 5, 'r');
% figure(3)
% scatter(x, bodytemp, 20, 'm', 'fill');

% Add title and display format
% title('Scatter plot for body temp', 'FontSize', 20, 'fontweight', 'bold');

% Add x and y labels
% xlabel('Samples', 'FontSize', 16, 'fontweight', 'bold');
% ylabel('Degrees of F', 'FontSize', 16, 'fontweight', 'bold');

% Calculate total mean and variance
total_mean = mean(bodytemp);
total_var = var(bodytemp);

% Extract female and male data sets (65 each)
normtemp = load('bodytemp.dat.txt');
maletemp = normtemp(1 : 65);
femaletemp = normtemp(66 : end);

% Compute mean and var for females and males seperately
male_mean = mean(maletemp);
male_var = var(maletemp);

female_mean = mean(femaletemp);
female_var = var(femaletemp);

%% Plot

figure(4)
hist(bodytemp);
title('Body Temp Histogram', 'FontSize', 20, 'FontWeight', 'bold');
xlabel('Temperature', 'FontSize', 20, 'FontWeight', 'bold');
ylabel('Frequency', 'FontSize', 20, 'FontWeight', 'bold');
set(gca, 'FontSize', 15, 'FontWeight', 'bold');

% Plot a Histogram for Male


% Plot a Histogram for Female


%% Display Results on the Console

fprintf('The mean %% body temp for male is: %5.2f degrees.\n', male_mean);
fprintf('The mean %% body temp for female is: %5.2f degrees.\n', female_mean);

fprintf('The var %% body temp for male is: %5.2f degrees.\n', male_var);
fprintf('The var %% body temp for female is: %5.2f degrees.\n', female_var);

disp(['The mean body temp for male is: ', num2str(male_mean)]);

%% Write to a file

fid = fopen('result_inclass.txt', 'w'); %Open a file

fprintf(fid, 'Ari Cooper \n');
fprintf(fid, 'Project 1, Sep 8, 2016');
fprintf(fid, ' ------- \n\n\n');

fprintf(fid,'The mean %% body temp for male is: %5.2f degrees.\n', male_mean);
fprintf(fid,'The mean %% body temp for female is: %5.2f degrees.\n', female_mean);

fprintf(fid,'The var %% body temp for male is: %5.2f degrees.\n', male_var);
fprintf(fid,'The var %% body temp for female is: %5.2f degrees.\n', female_var);

fclose(fid); % Remember to close file
