function z_e = Eqn_12_22_a(z,beta)
%  EQN_12_22_A Equation 12.22 (a)
    z_e = ceil(z/(cosd(beta))^3);
end