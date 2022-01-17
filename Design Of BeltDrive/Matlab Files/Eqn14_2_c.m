function [L] = Eqn14_2_c(D1,D2,C)
%  EQN14_2_C Equation 14.2 (c)
% 
% The length of the belt.
    L=([(pi/2)+((D1+D2)/(2*C))]*(D1+D2))+sqrt((4*(C^2))-((D1+D2)^2));
end