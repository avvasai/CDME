function D2 = Table_14_13_b(D2)
%  TABLE_14_13_B Table 14.13 (b)
% 
% Detailed explanation of this function.
 d_stand=[40 45 50 56 63 71 80 90 100 112 125 140 160 180 200 ....
     224 250 280 315 355 400 450 500 560 630 710 800 900 1000 1120 .... 
     1250 1400 1600 1800 2000];
 
[m,n]=size(d_stand);
for ii = 1:n
        if D2<d_stand(ii)
        D2=d_stand(ii);
        return
        else
        end
end
end