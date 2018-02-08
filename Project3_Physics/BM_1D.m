function [ x ] = BM_1D( total_time, h, F, V, R)
% BM_1D generates 1D Brownion Motion
D = calcD(F_K(F), V, R);

time = 0 : h : total_time;
sigma = sqrt(2*D);

 n = length(time);
 rnd1 = 0 + sqrt(h) * randn(1,n); % Generating mean 0, variance h, 1 by n random variables
 rnd1_scaled = rnd1 * sigma; % Apply scale
 rnd1_scaled(1) = 0;
 x = cumsum(rnd1_scaled);
end

