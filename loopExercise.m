%% Matlab loop exercise

% lab Q4
for i = 1.1 : 0.15 : 2.9
    fprintf('%10.2f\n', i);
end

mysum = 1;
for i = 1 : 100
   mysum = mysum * i;
end
disp(mysum);


vec = [-0.3, 8.5, 2.73];

for i = 1:length(vec)
fprintf('Element %d is %.2f\n', i, vec(i));
end