function [m] = Eqn_12_53_a_m(Ft,S_d,Cv,b,y)
%  EQN_12_53_A_M Equation 12.53(a)
% 
% Finding the module m using equation 12.53.
m = ((Ft)/(S_d*Cv*b*pi*y));
end