function [alpha] = Eqn_12_22_b(alpha_n,beta)
%  EQN_12_22_B Equation 12.22 ( b ).
 alpha = atand(tand(alpha_n)/cosd(beta));
end