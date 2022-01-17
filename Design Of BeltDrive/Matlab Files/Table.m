function [b] = Table(b)
%  TABLE Table
% 
% Detailed explanation of this function.
b_stand=(24:6:102);
 
[m,n]=size(b_stand);
for ii = 1:n
        if b<b_stand(ii)
        b=b_stand(ii);
        return
        else
        end
end
end