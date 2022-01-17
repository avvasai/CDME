function Fd = Eqn_12_26_a(v,C,Ft,K3,b,beta)
%  EQN_12_26_A Equation 12.26 (a)
% 
% 
    Fd = Ft+((K3*v*cosd(beta)*((C*b*(cosd(beta))^2)+Ft))/((K3*v)+sqrt((C*b*(cosd(beta))^2)+Ft)));
end