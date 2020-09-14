function [Fv,Ra, Rd, Mb, Mc] = BMD_calc(T1, T2, W1, L, L1, L2, L3)
%  BMD_CALC Moment Calc
% 
% Calculates the moments with given inputs.
Fv = T1 + T2 + W1;
Ra = Fv*(L2+L3)/L;
Rd = Fv - Ra;
Mb = Ra*L1
Mc = Rd*L3
end