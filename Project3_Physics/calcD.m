function [ D ] = calcD( K, V, R)
%calcD calculates Diffusion Coefficient
%   takes input degree K, Viscosity, and Radius
%   outputs Diffuision Coefficient (m2/sec)
Kb = 1.3806503e-23;
D = (Kb*K)/(6*pi*V*R);
end

