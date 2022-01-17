function [Cs] = Table_12_8(no)
%  TABLE_12_8 Table 12.8
% 
% Detailed explanation of this function.
    if no==1
        disp('You selected steady load');
        disp('Select type of service');
        disp('1.Intermittent or 3h per day');
        disp('2. 8 to 10h per day');
        disp('3.Continuous 24h/day');
        c = input('Enter choice:');
        fprintf('\n');
        if c==1
            Cs = 0.80;
        elseif c==2
            Cs = 1.0;
        elseif c==3
            Cs = 1.25;
        else
            disp('Wrong Option Selected');
        end
    elseif no==2
        disp('You selected steady load');
        disp('Select type of service');
        disp('1.Intermittent or 3h per day');
        disp('2. 8 to 10h per day');
        disp('3.Continuous 24h/day');
        c = input('Enter choice:');
        fprintf('\n');
        if c==1
            Cs = 1.00;
        elseif c==2
            Cs = 1.25;
        elseif c==3
            Cs = 1.50;
        else
            disp('Wrong Option Selected');
        end
    elseif no==3
        disp('You selected steady load');
        disp('Select type of service');
        disp('1.Intermittent or 3h per day');
        disp('2. 8 to 10h per day');
        disp('3.Continuous 24h/day');
        c = input('Enter choice:');
        fprintf('\n');
        if c==1
            Cs = 1.25;
        elseif c==2
            Cs = 1.50;
        elseif c==3
            Cs = 1.80;
        else
            disp('Wrong Option Selected');
        end
    elseif no==4
        disp('You selected steady load');
        disp('Select type of service');
        disp('1.Intermittent or 3h per day');
        disp('2. 8 to 10h per day');
        disp('3.Continuous 24h/day');
        c = input('Enter choice:');
        fprintf('\n');
        if c==1
            Cs = 1.50;
        elseif c==2
            Cs = 1.80;
        elseif c==3
            Cs = 2.00;
        else
            disp('Wrong Option Selected');
        end
end