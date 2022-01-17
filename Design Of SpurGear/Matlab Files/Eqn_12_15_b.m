function [K] = Eqn_12_15_b(S_es,alpha,Ep,Eg)
%  EQN_12_15_B Equation 12.15 b
% 
% Detailed explanation of this function.
    K = (((S_es^2)*sind(alpha))/1.4)*(Ep^-1 + Eg^-1);
end