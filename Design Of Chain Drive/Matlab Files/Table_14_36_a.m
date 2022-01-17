function [z2,z1] = Table_14_36_a(i)
%  TABLE_14_36_A Table 14.36 (a)
% 
% Detailed explanation of this function.
if i>1 && i<2
    z1 = 29;
elseif i>2 && i<3
    z1 = 26;
elseif i>3 && i<4
    z1 = 24;
elseif i>4 && i<5
    z1 = 22;
elseif i>5 && i<7
    z1 = 19;
elseif i==1
    z1 = 30;
elseif i==2
    z1 = 27;
elseif i==3
    z1 = 25;
elseif i ==4
    z1 = 23;
elseif i==5
    z1 = 21;
elseif i==7
    z1 = 17;
end
z2 = i*z1;
z1 =z1;
end