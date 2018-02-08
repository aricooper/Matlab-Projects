% Ari Cooper
% CS 435 Computational Science
% Project3_PhyicsLab_3.3
% Oct. 11 2016

clc, clear all; close all;

%% 3.3 Simulate and Plot Distance From the Origin

    F = 64;
    V = 1.32e-3;
    R = 2.8e-10;
    T = 10000;
    N = 4;
    h = 0.01;
    time = 0 : h : T;


%% 1. Use the parameters below to generate your Brownian motion simulation:
% • T = 64?F. • The solution is 64.5% C14-glycerol, which has viscosity 1.32×10?3 [kg/msec].

% 1-D Displacement
    D1_x = BM_1D(T, h, F, V, R);
    D1 = abs(D1_x);
        
% 2-D Displacement
    [D2_x, D2_y] = BM_2D( T, h, F, V, R);
    D2 = sqrt(D2_x.^2 + D2_y.^2);

% 3-D Displacement
    D3_x = BM_1D(T, h, F, V, R);
    D3_y = BM_1D(T, h, F, V, R);
    D3_z = BM_1D(T, h, F, V, R);
    D3 = sqrt(D3_x.^2 + D3_y.^2 + D3_z.^2);
    




%% 2. Run your 1-D, 2-D, and 3-D Brownian motion simulation for a very long time, compute corresponding distances from the origin using the formula above.
% Plot time vs. d1D, time vs. d2D, and time vs. d3D in one plot, using di?erent colors for di?erent curves. 
figure(1)
plot(time, D1, 'r', time, D2,'g', time, D3,'k');
title('Displacement in Dimensions', 'FontSize', 20);
xlabel('Time','FontSize', 15);
ylabel('Displacement from Origin','FontSize', 15);
set(gca, 'FontSize', 10);
grid on;



%% 3. What did you notice from this plot? Summarize and comment the long-term trend of these three curves and draw conclusions from this comparison.

% The long term trends of these plots show that the displacement of the 3-D plot
% becomes the largest over time. Both the 1-D and the 2-D plots are quite
% similar in displacement which is what we should expect. If we think about the possible
% directions the particle can travel, in 1-D theres always a 50% chance of
% moving towards the origin and thus the displacement should be relatively
% small. Furthermore for 2-D displacement, there is yet another dimension
% in which we can move away from the origin and so we will tend to have a
% displacement bigger than 1-D and smaller than 3-D, which allows the most
% options for the particle to randomly move away from the origin.




