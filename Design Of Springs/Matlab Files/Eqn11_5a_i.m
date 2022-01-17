function [N]=Eqn11_5a_i(F,D,G,d,y)
%  EQN11_5A_I Equation 11.5(a)
% 
% The axial deflection of the spring
    N = (y*G*d^4)/(8*F*D^3);
end