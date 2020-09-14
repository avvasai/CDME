function [T] = Eqn_3_3_a(P,n)
%  EQN_3_3_A To find the torque a shaft is undergoing if the required load is know.
% 
% Takes the Power  the shaft undergoes and gives the torque experienced by it.
T = ((9.55*10^6)*P)/n;
end