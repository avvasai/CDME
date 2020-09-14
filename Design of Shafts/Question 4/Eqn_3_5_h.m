%  EQN_3_5_H Finds the max stress values.:
% 
% Find the stress values of a shaft using the formula of failure theories by 
% taking inputs in the following order:
% 
% diameter, moment, torque and k ratio.
% 
% Improvment: Generalized version so auto see which values are missing and calculates 
% it.
% Using max normal stress theory
function [S_n, S_s] = Eqn_3_5_h(d0,M_max,T,k)
S_n = (16*(M_max+sqrt(M_max^2+T^2)))/(pi*(d0^3)*(1-k^4));
% Using max shear stress theory
S_s = ((16*(sqrt(M_max^2+T^2)))/(pi*d0^3*(1-k^4)));
end