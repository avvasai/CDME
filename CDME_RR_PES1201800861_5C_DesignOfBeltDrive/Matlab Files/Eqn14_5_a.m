function [P] = Eqn14_5_a(b,t,v,S_d,w,mu,tt)
%  EQN14_5_A Equation 14.5 (a)
    P=((b*t*v)/1000)*(S_d-((w*(v^2))/(1e6*9.81)))*((exp(mu*tt)-1)/exp(mu*tt));
end