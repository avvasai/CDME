function [y]=Lewis(z)
%  LEWIS Lewis Form Factor
% 
% Detailed explanation of this function.
    disp("Select the type of involute system")
    disp("1. 14.5 degree involute system")
    disp("2. 20 degree involute system")
    disp("3. 20 degree sub teeth system")
    c=input("Enter your choice : ");
    switch c
        case 1
            y=(0.124 - (0.684/z));
        case 2
            y=(0.154 - (0.912/z));
        case 3
            y=(0.175 - (0.95/z));
        otherwise 
            disp("Invalid input")
    end
end