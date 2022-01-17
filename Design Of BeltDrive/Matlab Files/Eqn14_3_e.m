function [Tc] = Eqn14_3_e(b,t,v)
%  EQN14_3_E Equation 14.3(e)
% 
% To find the centrifugal tension of a pulley
    Tc = (9810*b*t*(v^2))/((10^6)*9.81);
end