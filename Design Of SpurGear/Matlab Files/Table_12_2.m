function [m_n] = Table_12_2(m_n)
%  TABLE_12_2 Table 12.2
% 
% Detailed explanation of this function.
    M = [1 1.25 1.5 2 2.5 3 4 5 6 8 10 12 16 20 25 32 40 50];
    for ii = 18:-1:1
        if m_n <= M(1,ii)
            m_n_std = M(1,ii);
        end
    end
    m_n = m_n_std
end