function [mu]=Barths_Formula(v)
%  BARTHS_FORMULA Barths Formula
% 
% Finding the coefficient of friction when the velocity of the belt between 
% two pulleys is know:
    mu = 0.54 - (0.712/(2.242+v));
end