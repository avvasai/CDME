function [Fd] = Eqn_12_12(Ft_new,K3,v_new,C,b)
%  EQN_12_12 Equation 12.12
    Fd = Ft_new + (K3*v_new*(C*b+Ft_new))/((K3*v_new) + sqrt(C*b +Ft_new));
end