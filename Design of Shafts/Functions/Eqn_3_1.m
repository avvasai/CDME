function [Tu] = Eqn_3_1(T,d)
%  EQN_3_1 Shear stress
% 
% This function helps in the claculation of Shear stress.
Tu = (T*16)/(pi*d^3);
end