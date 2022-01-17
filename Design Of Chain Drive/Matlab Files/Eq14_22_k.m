function [Lp] = Eq14_22_k(z1,z2,Cp,alpha)
%  EQ14_22_K Equation 14.22 (k)
% 
% Detailed explanation of this function.
    Lp = 2*Cp*cosd(alpha) + 0.5*(z1+z2) + (alpha*(z2-z1))/180;
end