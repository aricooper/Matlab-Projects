function [ Area ] = Triangle( a, b, c )
% Triangle outputs area of triangle
% input 3 sides: a,b,c
s = (a+b+c)/2;
Area = sqrt(s*(s-a)*(s-b)*(s-c));
end

