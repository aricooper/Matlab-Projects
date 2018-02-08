 %% Project 4: Mathemetics
% Ari Cooper
% CS 435 Computational Science
% Cheng
% 10/18/2016

clear all, close all, clc;

%% 2 In-ClassProject
% 2.1 Develop an Interactive Number Guessing Game


% 1. Display a message for user to choose a di?culty level of the game: 1-easy, 2-medium, 3-hard.
difficulty ='0';
while (length(difficulty) ~= 1 || difficulty ~= '1' && difficulty ~= '2' && difficulty ~= '3')
    if difficulty ~= '0'
        fprintf('Choose a difficulty within range \n')
    end
        
prompt = 'Choose a difficulty: 1-easy (1-10), 2-medium (1-100), 3-hard (1-1000):  ';
difficulty = input(prompt, 's');

end
if difficulty == '1'
    range = 1:10;

elseif difficulty == '2'
    range = 1:100;

elseif difficulty == '3'
    range = 1:1000;
 
end

gameover = false;
target = randi(length(range));

while (~gameover)
prompt = '\n Make a Guess:  ';
temp = input(prompt, 's');
guess = int32(str2num(temp));
if guess == target
    gameover = true;
    fprintf('YOU DONE DID IT !!');
    
elseif (guess > target)
    fprintf('too big \n');
    
elseif (guess > length(range))
    fprintf('out of range \n');
    
elseif (guess < target)
    fprintf('too small \n');
    

    
else 
    fprintf('Not a valid input !!');
    
end
end
    


% 2. Depending on the user input to design the game according to the following:
%  1-Easy: target number is between 1 and 10 

%  2-Medium: target number is between 1 and 100 

% 3-Hard: target number is between 1 and 1000

