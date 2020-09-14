%  EQN_3_6 Finds the diameter:
% 
% Find the diameter of a shaft using the ASCME formula of failure theories by 
% taking inputs in the following order:
% 
% Max stress, Max shear, Moment, Torque, Cm and Ct values.
% 
% Improvment: Generalized version so auto see which values are missing and calculates 
% it.
function [d_n, d_s] = Eqn_3_6(S_max,Tu_max,M_max,T,Cm,Ct)
% Using max normal stress theory
d_n = (((16/(pi*S_max))*(Cm*M_max+sqrt((Cm*M_max)^2+(Ct*T)^2))))^(1/3);
% Using max shear stress theory
d_s = (((16/(pi*Tu_max))*(sqrt((Cm*M_max)^2+(Ct*T)^2))))^(1/3);
end