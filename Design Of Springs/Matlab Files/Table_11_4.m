function [Nt,f] = Table_11_4(N)
%  TABLE_11_4 Table 11.4
% 
% Different types of coil springs
disp("1. Plain End")
disp("2. Plain and Ground End")
disp("3. Square or close End")
disp("4. Square and close End")
f=1;
while f==1
   c=input("Enter your choice : ") ;
   if c==1
       Nt=(N+1);
       f=0;
   elseif c==2
       Nt=(N+1);
       f=0;
   elseif c==3
       Nt=(N+3);
       f=0;
   elseif c==4
       Nt=(N+2);
       f=0;
   else
       disp("Invalid input, Renter")
       f=1;
   end
end
end