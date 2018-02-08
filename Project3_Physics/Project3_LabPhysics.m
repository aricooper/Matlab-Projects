% Ari Cooper
% CS 435 Computational Science
% Project3_PhyicsLab
% Oct. 11 2016

clc, clear all; close all;

%% 3.1 SimulatingA 2-D Brownian Motion Hitting A Circular Barrier

%% 1. Based on your 2-D Brownian motion simulation, with N = 10 particles and simulation time T, plot a 2-D traces for each particle with a di?erent color. 
% Mark the end of the trace with a black dot.
    num_particle = 10;
    cmap = hsv(num_particle);

    F = 64;
    V = 1.32e-3;
    R = 2.8e-10;
    h = 0.001;
    pos1_0 = 0;
    pos2_0 = 0;
    T = 3;
    r = 1e-4;
    
    time = 0 : h : T;
    n = length(time);
    num_outside = 0;
    
    figure(1)
    for i = 1 : num_particle
    [ x1 ,x2 ] = BM_2D( T, h, F, V, R);
    plot(x1, x2, 'Color', cmap(i, :));
    plot(x1(end), x2(end), 'black.', 'MarkerSize', 20);
    hold on;
    
        if sqrt(x1(end)^2 +x2(end)^2) >  r
            num_outside = num_outside+1;
        end
    end
    title('10 Particle Brownion Motion 2-D', 'FontSize', 20);
    xlabel('B1','FontSize', 15);
    ylabel('B2','FontSize', 15);
    set(gca, 'FontSize', 10);
    grid on;
    hold on;
    
%     T = 3000;
%     r = sqrt(x1(T)^2 + x2(T)^2);
    
    t = linspace(0, 2 * pi, 1000);
    x = r * cos(t);
    y = r * sin(t); 
    plot(x, y,'LineWidth', 3); 
    axis equal;
    
    
%% 2. Prede?ne a barrier r being the distance of the particle from the origin after a speci?ed time T.

%     T = 3000;
%     r = sqrt(x1(T)^2 + x2(T)^2);

%% 3. Draw a circle centered at (0, 0) with radius r.

%     rectangle('Position', [-r/2, r/2, r, r], 'Curvature', [1 1])
    
%% 4. Plot the Simulated Particles together with the Barrier.
% To visualize the e?ect, plot the simulated 2-D Brownian motion for 10 particles together with the circular barrier using “holdon” command. 
% For eachparticle, usea black dotto indicateits ending position. Youcan use the following commands to draw a circle centered at origin with radius r:


%% 5. Run the simulation and display on the console how many particles are outside of the circle with radius r. 
% To test if a point is outside of the circle,you need to compute the distance of the point from the origin, and compare the distance with the radius of the circle. 
% Given a point with coordinate (x,y), the distance from the origin is d = sqrt(x2 +y2)


fprintf('%0.0f out of 10 particles are outside the circle.\n', num_outside);

%% 6. Verify the result with your plot.

%% 7. Extra: run your simulation for N = 10000, calculate the percentage of the particles that landed outside of the circle.
num_particle = 10000;
num_outside = 0;
for i = 1 : num_particle
    [ x1 ,x2 ] = BM_2D( T, h, F, V, R);
 if sqrt(x1(end)^2 +x2(end)^2) >  r
    num_outside = num_outside+1;
 end
end


percent_outside = num_outside / num_particle * 100;
fprintf('%0.1f%% out of %d particles are outside of the circle.', percent_outside, num_particle);
