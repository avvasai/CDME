function [d] = Eqn11_1d_d(F,C,K,tau)
%  EQN11_1D_D Equation 11.1d.d
% 
% Finding the shear stress in the helical spring.
    d = sqrt((8*F*C*K)/(pi*tau));
end