%% Project 3 - Physics: Part 2(inclass)
% CS 435 Computational Science
% Ari Cooper
% Oct. 4 2016 9:47

clear all; close all; clc;

%% 2 In-Class Project

%% 2.1 Calculate Theoretical Value of the Di?usion Coe?cient

   % [ D ] = calcD(F_K(68), 1.66e-3, 2.8e-10);
    
%% 2.2 BrownianMotionSimulation
% 
%     1. Generate a time sequence for the planned simulation period
        
        % define diffusion coefficient
            D = 1e-10;
        
        % define step size
            h = 0.0001;
            
        % generate time sequence
            time = 0 : h : 1;
            
        % scaling factor
            sigma = sqrt(2*D);
            
           n = length(time);

%     2. Generate random displacement at each simulation time
        rnd1 = 0 + sqrt(h) * randn(1,n); % Generating mean 0, variance h, 1 by n random variables
        rnd1_scaled = rnd1 * sigma; % Apply scale
       
    
%     3. Calculate displacement from the starting position
        rnd1_scaled(1) = 0;
        x1 = cumsum(rnd1_scaled); % Compute displacement from origin
         
         
%     4. Plot the displacement vs. time with a line plot.
        figure(1)
        plot(time, x1, 'LineWidth', 1);
        title('Brownion Motion 1-D', 'FontSize', 20);
        xlabel('Time','FontSize', 15);
        ylabel('Displacement from Origin','FontSize', 15);
        set(gca, 'FontSize', 10);
        grid on;
        
        %Export igure to file
        set(gcf, 'PaperPositionMode', 'auto');
        print -depsc2 BM_1D.eps
%     5. Write a for loop to simulate 1-D Brownian motion for 10 particles, each using a different color.
        
        num_particle = 10;
        
        figure(2)
        for i = 1 : num_particle
            x = BM_1D_simple(D, 1, h);
            plot(time, x);
            hold on;
        end

%% 2.2.1 1-DBrownianMotionSimulation

%% 2.2.2 2-DBrownianMotionSimulation
% 1. Generate a time sequence for the planned simulation period.
    T = 64;
    V = 1.32e-3;
    R = 2.8e-10;
    h = 0.001;
    pos1_0 = 0;
    pos2_0 = 0;
    t_f = 3;
    
    time = 0 : h : t_f;
    n = length(time);
    
% 2. Generate a random displacement at each simulation time along the ?rst dimension for B1. 
% Generate a random displacement at each simulation time along the second dimension for B2. 
    x1 = BM_1D(t_f, h, T, V, R);
    x2 = BM_1D(t_f, h, T, V, R);
    x3 = BM_1D(t_f, h, T, V, R);
    
    figure(3)
           
    plot(x1, x2, 'LineWidth', 1);
    hold on;
    
    plot(0, 0, 'r.', 'MarkerSize', 30);
    hold on;
    plot(x1(end), x2(end), 'g.', 'MarkerSize', 30); 
    title('Brownion Motion 2-D', 'FontSize', 20);
        xlabel('Time','FontSize', 15);
        ylabel('Displacement from Origin','FontSize', 15);
        set(gca, 'FontSize', 10);
        grid on;

% 3. For each dimension, calculate displacement from the starting position. 

% 4. Plot the displacement along dimension one vs. the displacement along dimension two with a line plot. 

% 5. Draw a red dot at the starting position and a green dot at the ending position.

%% 2.2.3 3-DBrownianMotionSimulation
     figure(4)
    
    plot3(x1, x2, x3, 'LineWidth', 1);
    hold on;
    
    plot3(0, 0, 0, 'r.', 'MarkerSize', 30);
    hold on;
    plot3([0,x1(end)],[0, x2(end)], [0, x3(end)], 'LineWidth', 5);
    plot3(x1(end), x2(end), x3(end), 'g.', 'MarkerSize', 30);
    title('Brownion Motion 3-D', 'FontSize', 20);
    xlabel('Time','FontSize', 15);
    ylabel('Displacement from Origin','FontSize', 15);
    set(gca, 'FontSize', 10);
    grid on;
        
%% Write a for loop to simulate 1-D motion
num_particle = 10;

cmap = hsv(num_particle);
time  = 0 : h : 1;
figure(5)
for i = 1 : num_particle
    x = BM_1D_simple(D, 1, h);
    plot(time, x, 'Color', cmap(i, :));
    hold on;
end
grid on;

%% 2.3 ExploreMATLABplottingandsimulationfunctions

% explore
sphere(5)

