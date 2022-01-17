function [m] = Tb12_2_1(m)
%  TB12_2_1 Table 12.2.1
% 
% Finding the value of module:
Tb = [1 1.25 1.5 2 2.5 3 5 6];
    for ii = 1:length(Tb)
        if m==Tb[ii]
            break
        elseif Tb(ii)<m & m<Tb(ii+1)
            m=Tb(ii+1);
        end
    end
end