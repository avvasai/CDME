function b = Table_14_9_a(b)
%  TABLE_14_9_A Table 14.9 (a)
% 
% Standardizing the diameter.
b_stand=[25 32 40 50 63 71 80 90 100 112 125 140 160 .... 
     180 200 224 250 280 315 355 400 450 500];
 
[m,n]=size(b_stand);
for ii = 1:n
        if b<b_stand(ii)
        b=b_stand(ii);
        return
        else
        end
end
end