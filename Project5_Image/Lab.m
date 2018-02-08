% Ari Cooper
% CS 435 Computational Science
% Project 5 Image: Lab
% Nov. 8 2016

clc, clear all, close all;

%% 3.1 ImageManipulation
% 1. Write a function ShowNeg(A) that converts a given image in .jpg format into its negative. 
% Your program should be able to handle black-and-white input images directly, and convert color images into black-and-white images before producing the negative.
A = imread('dragon.jpg');
figure
imshow(A);
  
B = rgb2gray(A);
% figure
% imshow(B);
tau = 25;
[row, col] = size(B);
for i = 1:row
    for j = 1:col
        iMin = max(1,i-1);
        iMax = min(row,i+1);
        jMin = max(1,j-1);
        jMax = min(col,j+1);
        
         Neighbors = B(iMin : iMax, jMin : jMax);
         
          % if pixel max discrep. > tau color to black
        max_d = max(abs(Neighbors(:) - B(i,j)));
        if(max_d < tau)
            C(i,j) = 0;
        else
            C(i,j) = 255;
        end
        
        
    end
end

% figure
% imshow(C);

%% 2. Write a function DisplayMosaic(A,m,n) that displays a m-by-n mosaic of the color picture A.
D = DisplayMosaic(A, 3,3);

figure
imshow(D);
%% 3. Write a function Rotate90L(A) to rotate an input image A 90 degrees to the left. 


%% 4. Write a functionFlipLR(A) that ?ips the picture A left to right. 


%% 5. Write a function Rotate90R(A) to rotate an input image A 90 degrees to the right. 


%% 6. Use the provided test code Lab5_test.m (downloadable from WISE) to test your functions.


