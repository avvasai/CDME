%  EQN_14_3_A Find the tension for a pulley.
% 
% It uses the pully tension relation to find the other tension. Takes the theta, 
% mu and intial tension value.
% 
% Improvement: generalized form.
function [T2] = Eqn_14_3_a(T1,mu,TT)
T2 = T1/(exp(mu*TT));
end