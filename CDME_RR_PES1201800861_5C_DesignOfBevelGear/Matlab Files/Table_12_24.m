function m = Table_12_24(m)
%  TABLE_12_24 Brief summary of this function.
% 
% Detailed explanation of this function.
M1 = [1,1.25,1.50,2.0,2.50,3,3.5,4,5,6,8,10,12,16,20,25,32,40,50];
for iii = 19:-1:1
    if m <= M1(1,iii)
        m_n_std = M1(1,iii);
    end
end
m = m_n_std;
end