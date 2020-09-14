%  EQN_3_5 Finds the diameter:
% 
% Find the diameter of a shaft using the formula of failure theories by taking 
% inputs in the following order:
% 
% Max stress, Max shear, Moment and Torque values.
% 
% Improvment: Integrate this into the generalized version of 3_5.
function [d_n, d_s] = Eqn_3_5(S_max,Tu_max,M_max,T)
% Using max normal stress theory
d_n = (((16/(pi*S_max))*(M_max+sqrt((M_max)^2+(T)^2))))^(1/3);
% Using max shear stress theory
d_s = (((16/(pi*Tu_max))*(sqrt((M_max)^2+(T)^2))))^(1/3);
end