function [Fw] = Eqn_12_15_a(K,Q,b,d1)
%  EQN_12_15_A Equation 12.15 (a)
    Fw = d1*b*Q*K*10^-3;
end