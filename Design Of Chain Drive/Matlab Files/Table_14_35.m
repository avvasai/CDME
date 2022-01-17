function [Ks] = Table_14_35()
%  TABLE_14_35 Table 14.35 
% 
% Detailed explanation of this function.
disp('Please enter one of the following option');
disp('1.Easy Starting, Smooth, Steady Load');
disp('2.Light to Medium Shock Or Vibrating Load');
disp('3.Medium to Heavy Shock Or Vibrating Load');
c=input("Enter your choice: ");
fprintf('\n')
switch c
    case 1
        disp('1.Intermittent Few Hours Per Day');
        disp('2.Normal 8 to 10h per day');
        disp('3.Continuous 24 h per day');
        c1 = input('Choice:');
        if c1==1
            Ks = 1.00;
        elseif c1==2
            Ks = 1.5;
        elseif c1==3
            Ks = 2.00;
        else
            disp('Wrong Option');
        end
    case 2
        disp('1.Intermittent Few Hours Per Day');
        disp('2.Normal 8 to 10h per day');
        disp('3.Continuous 24 h per day');
        c1 = input('Choice:');
        if c1==1
            Ks = 1.40;
        elseif c1==2
            Ks = 1.90;
        elseif c1==3
            Ks = 2.20;
        else
            disp('Wrong Option');
        end
    case 3
        disp('1.Intermittent Few Hours Per Day');
        disp('2.Normal 8 to 10h per day');
        disp('3.Continuous 24 h per day');
        c2 = input('Choice:');
        if c2==1
            Ks = 1.80;
        elseif c2==2
            Ks = 2.30;
        elseif c2==3
            Ks = 2.80;
        else
            disp('Wrong Option');
        end
    otherwise
        disp("Invalid input")
        fprintf("\n")       
end
end