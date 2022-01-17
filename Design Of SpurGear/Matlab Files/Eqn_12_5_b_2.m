function [m] = Eqn_12_5_b_2(Ft,S_d,Cv,k,Y)
%  EQN_12_5_B_2 Equation 12.5.b.2
    m = sqrt(Ft/(S_d*Cv*k*Y));
end