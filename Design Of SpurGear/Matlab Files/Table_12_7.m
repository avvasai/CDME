function [S_d] = Table_12_7()
%  TABLE_12_7 Table 12.7
% 
% Detailed explanation of this function.
disp('FOR GEAR');
disp('1.Cast Iron Grade 20');
disp('2.Cast Iron Grade 25');
disp('3.Cast Iron Grade 35');
disp('4.Cast Iron Grade 35(HeatTreated)');
disp('5.CastSteel(0.2%C untreated)');
disp('6.CastSteel(0.2%C heatreated)');
disp('7.Bronze');
disp('8.PhosphorGearBronze');
disp('9.Manganese Bronze');
disp('10.AluminiumBronze');
disp('11.ForgedSteel(0.3%C untreated)');
disp('12.ForgedSteel(0.3%C heattreated)');
disp('13.Steel C30');
disp('14.Steel C40');
disp('15.Steel C45');
disp('16.AlloySteel');
disp('17.Cr-Ni Steel');
disp('18.Cr-Va Steel');
disp('19.Rawhide,Fabroil');
disp('20.Plastic');
disp('21.Laminated Phenolic Materials');
disp('22.Laminated Steel');
no = input("CHOICE: \n");
    if no ==1
        S_d = 47.1;
        BHN = 200;
    elseif no==2
        S_d = 56.4;
        BHN = 220;
    elseif no==3
        S_d = 56.4;
        BHN = 225;
    elseif no==4
        S_d = 78.5;
        BHN = 300;
    elseif no==5
        S_d = 138.3;
        BHN = 180;
    elseif no==6
        S_d = 193.2;
        BHN = 250;
    elseif no==7
        S_d = 68.7;
        BHN = 80;
   elseif no==8
        S_d = 82.4;
        BHN = 100;
   elseif no==9
        S_d = 138.3;
        BHN = 100;
   elseif no==10
        S_d = 152.0;
        BHN = 180;
   elseif no==11
        S_d = 172.6;
        BHN = 150;
   elseif no==12
        S_d = 220;
        BHN = 200;
   elseif no==13
        S_d = 220.6;
        BHN = 300;
   elseif no==14
        S_d = 207.0;
        BHN = 150;
   elseif no==15
        S_d = 233.4;
        BHN = 200;
   elseif no==16
        S_d = 345.2;
        BHN = 650;
   elseif no==17
        S_d = 462.0;
        BHN = 400;
   elseif no==18
        S_d = 516.8;
        BHN = 450;
   elseif no==19
        S_d = 41.2;
   elseif no==20
        S_d = 58.8;
   elseif no==21
        S_d = 41.2;
   elseif no==22
        S_d = 82.4;
    else
        disp('Wrong Option');
        
    end