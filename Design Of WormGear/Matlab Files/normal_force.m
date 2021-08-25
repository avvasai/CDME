function [Fn] = normal_force(Ft,gamma,alpha)
%  NORMAL_FORCE Equation 12.63(a):
% 
% The force normal to the tooth surface:
Fn = ((Ft)/(cosd(gamma)*cosd(alpha)));
end