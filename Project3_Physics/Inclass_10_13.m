%% Fun example for plotting and making animation

clear all, clc, close all;


%% write to a file
v = VideoWriter('fft.avi');
open(v);
%% 
axis tight;
for i = 1:30
    plot(fft(eye(i)))
    axis equal;
    axis([-1 1 -1 1]);
%     pause(.005);
    
    M(i) = getframe();
    writeVideo(v, M(i));
end

% movie(M, 1);
close(v);    % Close video object
