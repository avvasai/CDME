function [p1,W,Fu] = Table_14_39_b(p1)
%  TABLE_14_39_B Table 14.39 (b)
% 
% Detailed explanation of this function.
p_sd=[25.4 25.4 31.75 31.75 38.10 38.10 50.80 50.80 63.50 63.50 76.20 76.20 88.90 101.60];
mld=[127.50 127.50 196.13 196.13 284.39 284.39 500.14 500.14 747.73 747.73 1108.15 1108.15 1510.22 2000.56];
bld=[13.83 17.85 21.77 22.66 31.19 28.94 55.60 42.27 86.79 64.53 124.55 98.87 129.06 169.07];
[q,w]=size(p_sd);
for ii=1:w
    if p1>p_sd(ii)          
    else
        W=mld(ii+1);
        Fu=bld(ii+1);
        return
    end
end
end