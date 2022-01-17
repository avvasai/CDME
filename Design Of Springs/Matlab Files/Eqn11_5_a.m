function [y]=Eqn11_5_a(F,D,G,d,N)
%  EQN11_5_A Equation 11.5 (a):
% 
% The axial deflection of the spring:
    y = (8*F*N*D^3)/(G*d^4);
end