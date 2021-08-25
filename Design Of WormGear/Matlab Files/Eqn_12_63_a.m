function [Qg] = Eqn_12_63_a(mu,Fn,vr,gamma)
%  EQN_12_63_A Equation 12.63(a):
% 
% The amount of heat generated.
Qg = ((mu*Fn*vr)/(cosd(gamma)));
end