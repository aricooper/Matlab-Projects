% Ari Cooper
% CS 435 Computational Science
% Project 5 Image: Inclass
% Nov. 1 2016

clear all, close all, clc;

%% Example of black and white image

    % Read the image into MatLab and save it to a variable
    
    A = imread('Willamette_BW.jpg');
    
    % Show the image
    
%     figure
%     imshow(A);

%% Example of Color Image
    
    % Read the image into MatLab and save it to a variable
    
    B = imread('Willamette.jpg');
    
    % Show the image
    
%     figure
%     imshow(B);
    
%% Example of Color Indexing

%     map = colormap;
%     [r, c] = size(map); 
%     map(1:5, :);
    
%     load mandrill;
%     figure('color', 'k')
%     image(X);
%     colormap(map);
%     axis off;
%     axis image;
    
%% Changing Colormap

%     map = colormap(hot);

%% 2.1 BasicImageManipulations

    % 1. Read the image into MATLAB and save it to a variable
    % B is already declared as Willamette.jpg
    
    % 2. Show the image;
%     figure
%     imshow(B);
    
    % 3. Check the size of the image (should be M-by-N-by-3 for a color image)
    % 681x1024x3
%     [row, col, tmp] = size(B);
    
    % 4. Crop the image to extract the desired part, and save it to a di?erent image;
    C = B(171:380, 301:510,:);     % size 210 x 210
%     figure
%     imshow(C);
    
    imwrite(C, 'Willamette_small.jpg', 'jpg');
    
    % 5. Extract the red, blue and green components and save them to individual images.
    C_red = C; C_blue = C; C_green = C;
    
    C_red(:,:,2:3) = 0;
    C_green(:,:,[1 3]) = 0;
    C_blue(:,:,1:2) = 0;
    
     imwrite(C_red, 'Willamette_red.jpg', 'jpg');
     imwrite(C_green, 'Willamette_green.jpg', 'jpg');
     imwrite(C_blue, 'Willamette_blue.jpg', 'jpg');
     
%      figure
%      imshow(C_red)
     
    % 6. Convert the image to black-and-white;
    A_bw = rgb2gray(B);
    
%     figure
%     imshow(A_bw);
    imwrite(A_bw, 'Willamette_BW.jpg', 'jpg');
    
    % 7. (Advanced) Use a smaller image to create a large image that contains the original image, the red, green and blue components stacked up as 2-by-2 blocks, for example in ?gure 4.
    all4 = [C, C_red; C_green, C_blue];
    
%     figure
%     imshow(all4);
    
    
    %% 2.2 ImageRepair: Write a MATLAB program to clean up the dirty specks in the provided image
    
% 1. Read in and display the contaminated image: Willamette_bw_dirty_small.jpg, which can be downloaded from the WISE site under project 5, image folder.
D = imread('Willamette_bw_dirty_small.jpg');
figure
imshow(D);
[row, col] = size(D);
% 2. Perform a median ?lter for each of the pixel value.
% for i = 1:row
%     for j = 1:col
%         if (i < row && j < col) && (i > 1 && j > 1)
%         neighbors = D((i-1:i+1), (j-1:j+1));
%         med = median(neighbors(:));
%         E(i,j) = med;
%         elseif (i == row || j == col) || (i == 1 || j == 1)
%             E(i,j) = D(i,j);
%         end
%     end
% end


for i = 1:row
    for j = 1:col
        iMin = max(1,i-1);
        iMax = min(row,i+1);
        jMin = max(1,j-1);
        jMax = min(col,j+1);
        
        Neighbors = D(iMin : iMax, jMin : jMax);
        E(i,j) = median(Neighbors(:));
        
    end
end
% 3. Display the repaired image.
figure
imshow(E);

% 4. Try to use the mean instead of median to generate a new ?ltered image for comparison.
for i = 1:row
    for j = 1:col
        iMin = max(1,i-1);
        iMax = min(row,i+1);
        jMin = max(1,j-1);
        jMax = min(col,j+1);
        
        Neighbors = D(iMin : iMax, jMin : jMax);
        F(i,j) = mean(Neighbors(:));
        
    end
end
figure
imshow(F);
% 5. Use MATLAB built-in function med?lt2 for similar image repair result.
% M = medfilt2(D);
% figure
% imshow(M);

% 6. (Advanced) Write the median ?lter into a function: median?lter, which takes a contaminated image as input and produces a repaired image as output.


%% 2.3 ImageEdgeDetection : Write a MATLAB program to detect the edges of objects in the given image. 

% 1. Implement the edge detection algorithm described above. Basically, for each pixel in the original image,if the maximum discrepancy of the pixel with respect to its neighbor is greater than a prede?ned threshold ?, color it to black, otherwise color it to white.
tau = 25;
[m,n] = size(B);
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
            G(i,j) = 0;
        else
            G(i,j) = 255;
        end
        
    end
end
figure()
imshow(G)

% 2. Display the pattern created from the original image. This is the image with the edge detected.


% 3. Use the MATLAB built-in function for edge detection. Read the help document for edge command and try di?erent algorithms to see the results. For each result, display the image title with corresponding algorithm name.

    

    
    
 
    