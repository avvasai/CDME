function [K] = Eqn11_2_a(C)
%  EQN11_2_A Equation 11.2 (a)
% 
% Finding the stress concentration factor.
    K = ((4*C-1)/(4*C-4)) + ((0.615)/(C));
end