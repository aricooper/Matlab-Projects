%% CS 435 Lab
%Ari Cooper
%Sep 22, 2016

clear all, close all, clc;

%% 1. The factorial of a number n is defined as: n! = n × (n ? 1) × (n ? 2)... × 2 × 1. Write a
% for loop to compute factorial of 30. Display a message and result using
% scientific notation in the console. Use the MATLAB build-in function factorial to verify your
% result. Can you use the prod function to obtain the same result?
p = 1;
for i = 1 : 30
    p = p * i;
end
fprintf('I got %f and Matlab got %f\n', p, factorial(30));
prod(1:30);

%% 2. Write a nested for loop to print a multiplication table of 1...9 that looks like the
% following:
for j = 1 : 9
    for i = 1 : 9
    fprintf('  %5.0f', (i*j));
    end
    fprintf('\n');
end

%% 3. Create a 2-dimensional array A and assign to it the values in Table 1 above.



