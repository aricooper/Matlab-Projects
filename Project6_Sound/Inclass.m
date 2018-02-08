% Ari Cooper
% CS 435
% Project 6 Sound
% 2.0 In-Class Project
% 11/15/2016

clc, close all, clear all;

%% 2.1 LoadExistingMusic
% 1. Read in the cow.wav ?le and observe the content of the returned variables. 

% [cow, Fs] = audioread('cow.wav');

    % Seperate left and right channel
    
% left = cow(:,1);
% right = cow(:,2);

% 2. Plot and play the sound wave. Plot partial signals near the beginning to observe the sound signals.

% soundsc(cow,Fs);

% figure()
% plot(left);

% 3. Play the sound wave with a di?erent sampling frequency. 

% soundsc(cow,Fs*.5);
% soundsc(cow,Fs*5);

% 4. Repeat the above with di?erent sound ?le: funky.wav and asharp.wav.

% [funky, Fs_f] = audioread('funky.wav');

% soundsc(funky,Fs_f*4.20);

%% 2.2 SoundCreation
% 1. Create a sine wave of amplitude A=1, at audio frequency of 466.16 Hz (which corresponds to A#) using the sample frequency of 8000 Hz for duration of 5 seconds. 
% 
% t = 0 : 0.000125 : 1;
% f = 466.16;
% A_sharp = 1 * sin(2*pi*f*t);

% 2. Plot the sound wave and play the sound piece. 

% figure()
% plot(A_sharp);
% soundsc(A_sharp);

% 3. Write a function note to generate desired notes sound by passing their frequency values. The music note frequencies can be found here: Piano Key Frequencies.

% 4. Repeat the above experiment with square wave instead of sine wave, play the sound and compare with the sine wave sound.

% 5. Use the simple notes to create a piece of music: ABC song, and save it to abc.wav.

%% Sound Capturing

% Create an audio recorder object by specifying sample rate, precision bit and number of channels

r = audiorecorder(48000, 16, 2); 
record(r);
pause(5);
stop(r);

% Convert to double data

myspeech = getaudiodata(r,'double');
soundsc(myspeech,48000);
