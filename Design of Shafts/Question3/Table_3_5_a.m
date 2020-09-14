function d = Table_3_5_a(d)
%  TABLE_3_5_A Standard shaft diameter.
% 
% Takes vlaues from the excel sheet Table_3_5_a.xlsx and then itreates through 
% it to find the standard shaft diameter.
% 
% Improvemnt: Store the values in thsi function to reduce time taken or a option 
% to enter the filename so that anyone can use it.
d_std = xlsread('Table3_5_a.xlsx');
[m,n] = size(d_std); 
for ii = 1:n
    if d<= d_std(ii)
        disp('Standard size of the shaft (mm) using table 3.5(a) is : ')
        d = d_std(ii)
        break
    else
    end
end
end