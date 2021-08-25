function [b]=Eqn14_5a_b(P,S,t,V,roh,g,mu,tt_s)
%  EQN14_5A_B Equation 14.5.a  (b)
    b=(P*1000)/(t*V*((S-((roh*g*(V^2))/(1e6*g)))*(((exp(mu*tt_s))-1)/(exp(mu*tt_s)))));
end