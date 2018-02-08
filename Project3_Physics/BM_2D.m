function [ x1 ,x2 ] = BM_2D( total_time, h, F, V, R)
% BM_1D generates 2D Brownion Motion
x1 = BM_1D( total_time, h, F, V, R);
x2 = BM_1D( total_time, h, F, V, R);
end

