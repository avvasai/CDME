function [a] = Eqn_12_68_a(P,ii)
%  EQN_12_68_A Equation 12.68 (a):
% 
% The limiting input power rating of a plain worm gear unit from the stand point 
% of heat:
a = ((P*(ii+5))/(0.02905))^(1/1.7);
end