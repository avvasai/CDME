function [theta,eta] = Eqn_12_57_c(alpha,gamma,mu)
%  EQN_12_57_C Equation 12.57(c):
% 
% The efficieny when the worm gear drives the worm:
theta = atand(tand(alpha)*cosd(gamma));
eta = (cosd(alpha)-(mu*cotd(gamma)))/(cosd(alpha)+(mu*tand(gamma)));
end