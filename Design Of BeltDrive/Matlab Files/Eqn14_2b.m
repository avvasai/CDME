function [L]=Eqn14_2b(C,D,d)
%  EQN14_2B Equaton 14.2 (b)
% 
% Finding the total length of the pulley.
    L = (2*C)+((pi/2)*(D+d))+(((D-d)^2)/(4*C)) ;
end