function [Ce] = Eqn14_22_kCe(Lp,z1,z2,alpha,p)
%  EQN14_22_KCE Equation 14.22 (k)
% 
% Detailed explanation of this function.
    Ce = (Lp - (0.5*(z1+z2))-(alpha*(z2-z1))/180)*p;
end