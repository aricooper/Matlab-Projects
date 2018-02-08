%% A 3D Heart Shape with Lighting and a Title

% Ari Cooper
% Computational Science
% Sep 13, 2016

clear all, close all, clc;

%% Genereate Meshgrid
[x, y, z] = meshgrid(linspace(-2, 2, 100));

%% Define Shape Function
f = (x.^2 + (9 * y.^2) ./ 4 + z.^2 - 1).^3 - ((9 * y.^2) .* (z.^3)) ./ 80 - (x.^2) .* (z.^3);

%% Create a Field Polygon
p = patch(isosurface(x, y, z, f, 0));
p.EdgeColor = 'none';

%% Set Color
set(p, 'FaceColor', 'r');

%% Turn on Grid
grid on;

%% Set default data aspect ratios
daspect([1, 1, 1]);

%% Specify 3D graph view point
view(3)

%% Set position of light
camlight('right');
camlight('left');
camlight('headlight');

%% Set lighting mode
lighting gouraud;

%% Title
title('I Love ya!!');
