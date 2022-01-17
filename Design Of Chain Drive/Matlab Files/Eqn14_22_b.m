function [P] = Eqn14_22_b(N1)
%  EQN14_22_B Equation 13.22 (b)
% 
% Finding the power using the rpm
    P = 10*(((60.67)/(N1/60))^(2/3));
end