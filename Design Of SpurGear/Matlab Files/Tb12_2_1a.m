function [m] = Tb12_2_1a(m)
%  TB12_2_1A Table 12.2.1a
% 
% Finding the value of module:
Tb = [1 1.25 1.5 2 2.5 3 5 6 8 10 12 16 20 25 32 40 50];
    for ii = 1:length(Tb)
        if m==Tb[ii]
            break
        elseif Tb(ii)<m & m<Tb(ii+1)
            m=Tb(ii+1);
        end
    end
end