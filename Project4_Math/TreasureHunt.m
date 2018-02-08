% Ari Cooper
% CS 435 Computational Science
% Project3_PhyicsLab
% Oct. 11 2016

clc, clear all; close all;

%% 1. Your program should allow the user to choose a di?cult level: 1-easy, 2-medium, 3-hard.
% For easy one, your coordinate system has size 10-by-10. 
% For medium one, your coordinate system has size 50-by-50, 
% for hard one, your coordinate system has size 100-by-100

difficulty ='0';
while (length(difficulty) ~= 1 || difficulty ~= '1' && difficulty ~= '2' && difficulty ~= '3')
    if difficulty ~= '0'
        fprintf('Choose a difficulty within range \n')
    end
        
prompt = 'Choose a difficulty: 1-easy (10x10), 2-medium (50x50), 3-hard (100x100):  ';
difficulty = input(prompt, 's');

end
if difficulty == '1'
    range = 1:10;

elseif difficulty == '2'
    range = 1:50;

elseif difficulty == '3'
    range = 1:100;
 
end

%% 2. Based on user’s selection,the program should display informative message t oallow user guess the x, y coordinates of the treasure location (positive integers within the range corresponding to the di?culty level) . 
% You need to check the user input, if user input an invalid number, you program should display a message and allow user to input again.
guess1 = [];
guess2 = [];

count = 0;
gameover = false;
x = randi(length(range));
y = randi(length(range));
% x=5; y=5;
while (~gameover)
count = count + 1;
invalid = false;   
prompt = '\n\nMake a Guess For X:  ';
temp = input(prompt, 's');
guess_x = int32(str2num(temp));
if isempty(guess_x) || (guess_x > length(range))
    invalid = true;
    help_x = 'X';
    fprintf('Not a valid input !!');
else

if guess_x == x
    help_x = 'nowhere';
   
elseif (guess_x > x)
%     fprintf('too big \n');
    help_x = 'left';
 
elseif (guess_x < x)
%     fprintf('too small \n');
    help_x = 'right';
    
end

    
prompt = 'Make a Guess For Y:  ';
temp = input(prompt, 's');
guess_y = int32(str2num(temp));
if isempty(guess_y) || (guess_y > length(range))
    invalid = true;
    help_y = 'Y';
    fprintf('Not a valid input !!'); 
else
guess1(end+1) = guess_x;
guess2(end+1) = guess_y;
if (guess_y == y && guess_x == x);
    fprintf('YOU FOUND THE TREASURE AFTER %0.0f GUESSES !!!', count);
    gameover = true;
else  
if (guess_y == y)
    help_y = 'nowhere';

elseif (guess_y > y)
%     fprintf('too big \n');
    help_y = 'down';

elseif (guess_y < y)
%     fprintf('too small \n');
    help_y = 'up'; 
       
end
if ~gameover && ~invalid
    fprintf('Move %s and %s.', help_x, help_y);
end
end
end

if invalid
    fprintf('\nGuess again')
end
end

end
figure

plot(guess1,guess2, 'LineWidth', 3);
hold on;
plot(guess1(1), guess2(1), 'red.', 'MarkerSize', 30);
hold on;
plot(guess1(end), guess2(end), 'green.', 'MarkerSize', 30);
title('Treasure Hunt');
grid on;
axis([1 length(range) 1 length(range)]);

