function m = module(Mt,S_d,Cv,Y,z1,z2,z)
%  MODULE Module
% 
% Finding the module
temp = z1^2+z2^2;
m = ((18*Mt)/(S_d*Cv*Y*z*(sqrt(temp))))^(1/3);
end