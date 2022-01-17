function Fw = Eqn_12_26_c(S_es,alpha,E1,E2,d1,d2,b,beta)
%  EQN_12_26_C Equation 12.26 ( 2 )
    K = ((S_es^2*sind(alpha))/1.40)*((1/E1)+(1/E2));
    Q = (2*d2)/(d2+d1);
    Fw = (d1*b*Q*K)/((cosd(beta))^2);
end