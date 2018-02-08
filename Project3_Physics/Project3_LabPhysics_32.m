% Ari Cooper
% CS 435 Computational Science
% Project3_PhyicsLab_3.2
% Oct. 11 2016

clc, clear all; close all;


%% 3.2 MATLABAnimationandVisualizationin3D

%% 1. Generate 4 balls with initial positions at (0, 0, 0). Label them with colors: red, blue, green, and black (you may use MATLAB command sphere).
fig = figure(1);    
[x, y, z] = sphere;
    axis([-10 10 -10 10 -10 10]);
    b1 = surf(x,y,z);
    set(b1,'FaceColor',[1 0 0]);
    hold on
    b2 = surf(x,y,z);
    set(b2,'FaceColor',[0 1 0]);
    hold on
    b3 = surf(x,y,z);
    set(b3,'FaceColor',[0 0 1]);
    hold on
    b4 = surf(x,y,z);
    set(b4,'FaceColor',[0 0 0]);
    hold on
      
   
%% 2. For each particle, assign a di?erent variance multiplication factor: (0.1, 0.5, 0.9, 2). 

    F = 64;
    V = 1.32e-3;
    R = 1e-20;
    pos1_0 = 0;
    pos2_0 = 0;
    T = 1;
    N = 4;
    h = 0.01;
    
       
    % particle b1
    x1 = BM_1D(T, h, F, V, R);
    x2 = BM_1D(T, h, F, V, R);
    x3 = BM_1D(T, h, F, V, R);
   
        
    % particle b2
    y1 = BM_1D(T, h, T, V, R);
    y2 = BM_1D(T, h, T, V, R);
    y3 = BM_1D(T, h, T, V, R);
    
    % particle b3
    z1 = BM_1D(T, h, T, V, R);
    z2 = BM_1D(T, h, T, V, R);
    z3 = BM_1D(T, h, T, V, R);
    
    % particle b4
    w1 = BM_1D(T, h, T, V, R);
    w2 = BM_1D(T, h, T, V, R);
    w3 = BM_1D(T, h, T, V, R);
    
    
    v = VideoWriter('fft.avi');
    open(v);
    
    
    [x,y,z] = sphere();
    scale = 0 : h : T;
    
    for i = 1:length(scale)
        
        
        b1 = surf(x+(x1(i)*.1),y+(x2(i)*.1),z+(x3(i)*.1));
        set(b1,'FaceColor',[1 0 0], 'EdgeColor', 'black');
        hold on;
        
         b2 = surf(x+(y1(i)*.5),y+(y2(i)*.5),z+(y3(i)*.5));
        set(b2,'FaceColor','g', 'EdgeColor', 'black');
        hold on;
        
         b3 = surf(x+(z1(i)*.9),y+(z2(i)*.9),z+(z3(i)*.9));
        set(b3,'FaceColor','b', 'EdgeColor', 'black');
        hold on;
        
         b4 = surf(x+(w1(i)*2),y+(w2(i)*2),z+(w3(i)*2));
        set(b4,'FaceColor','black', 'EdgeColor', 'black');
        axis([-10 10 -10 10 -10 10]);
        
        title('4 Particle Brownian Motion Simulation', 'FontSize', 20);
        xlabel('B1','FontSize', 15);
        ylabel('B2','FontSize', 15);
        zlabel('B3','FontSize', 15);
        set(gca, 'FontSize', 10);
        set(fig, 'Position', [500, 200, 1000, 800])
        grid on;
        legend('Variance Factor = 0.1', 'Variance Factor = 0.5', 'Variance Factor = 0.9', 'Variance Factor = 2.0');
        hold off;
        M(i) = getframe();
        writeVideo(v, M(i));
    end
    
%       movie(M, 1);
        close(v);    % Close video object    

%% 3. Simulate the 4-particle movement and write the output to a .avi ?le.

