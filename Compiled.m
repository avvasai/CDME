%% 
% The compiled code for the subject Computational Design of Machine Element. 
% The following machine elements have been added:
%% 
% # 
% # Belt Drive
% # Chain Drive
%% 
% # Helical Gear
% # Spur Gear
%% 
% The introductory part of the code:

disp("----------------------------------------------------------------------")
disp("Welcome!");
disp("Computational Design of Machine Element");
disp("This program simplifies the computation for machine elements." )
disp("It was made as a submission for the course work of " );
disp("Computational Design of Machine Element(UE18ME306A).");
disp("Really grateful for the course instructor for the " );
disp("opportunity to allowing me to make this program. " );
disp("program by providing the necessary knowledge and guidance.");
disp("Student's Name: Avva Sai Pranav");
disp("SRN: PES1201800861");
disp("------------------------------------------------------------------------")
%% 
% Important note part/instructions for the user to follow

disp("IMPORTANT NOTE/INSTRUCTIONS")
disp("-------------------------------------------------------------------------")
%% 
% The display for the  switch case for the selection of various machine element:

disp("Which of the following machine element would you like to compute for ?")
disp("1.Design of Shaft");
disp("2.Design of Belt Drive");
disp("3.Design of Chain Drive");
disp("4.Design of Springs");
disp("5.Design of Bevel Gear");
disp("6.Design of Helical Gear");
disp("7.Design of Spur Gear");
disp("8.Design of Worm Gear");
disp("-------------------------------------------------------------------------")
disp("Example: If you wanted to choose design of spur gear press 5")
disp("-------------------------------------------------------------------------")
%% 
% Writing the switch case and adding a dummy display until code has been made:
% 
% NOTE: As the code will be taking multiple inputs either for switch cases or 
% if- else statements , the variable name "choice" will be used to rewrite the 
% value and avoid intialization of multiple variable that will only be used once

choice = input("Enter your choice:");
switch choice
    case 1
        disp("Design of Shaft")
        disp("Few questions will be asked to determine the")
        disp("type of procedure to be followed.")
        disp("Would you like the following trend graphs produced:")
        disp("1.Trend of P vs N")
        disp("2.Trend of T vs N")
        disp("3.Trend of D vs N")
        choice = input("Y/N ?",'s');
        if choice == "Y"
            disp("Graphs will be generated:")
            disp("----------------------------------------------------------------------")
            disp("Enter the required details as prompted by the respective input.")
            disp("----------------------------------------------------------------------")
            n = input("Enter the rpm of the shaft: ") - 10;
            P = input("Enter the power supplied to the shaft: ");
            L = input("Find the length of the shaft: ");
            G = input("Rigidity of the shaft: ");
            theta = input("The max degree of twist");
            no = input("The number of iterations required:");
            fin_T =  zeros(no,1);
            fin_n =  zeros(no,1);
            T = ((9.55*10^6)*P)/n;
            d = ((584*T*L)/(G*theta))^(1/3);
            d_std = xlsread('Table3_5_a.xlsx');
            [m,n] = size(d_std);
            for ii = 1:n
                if d<= d_std(ii)
                    disp('Standard size of the shaft (mm) using table 3.5(a) is : ')
                    d = d_std(ii);
                    break
                else
                end
            end
            Tu = (T*16)/(pi*d^3);
            n_array = 1:400;
            P_array = n_array.*(T/(9.55*(10^6)));
            T_array = n_array.^(-1).*(9.55*(10^6)*P);
            d_array = ((T_array.*(584*L))./(G*theta)).^(1/3);
            plot(n_array,P_array)
            xlabel('RPM (n)')
            ylabel('Power (kW)')
            title('P vs n Assuming Constant Torque')
            plot(n_array,T_array)
            xlabel('RPM (n)')
            ylabel('Torque (N-m)')
            title('T vs n At constant Power')
            plot(n_array,d_array)
            xlabel('RPM (n)')
            ylabel('Diameter (mm)')
            title('d vs n At constant Power')
        elseif choice == "N"
            disp("Calculating the diameter of the shafts:")
            disp("----------------------------------------------------------------------")
            disp("Enter the required details as prompted by the respective input.")
            n = input("Enter the rpm of the shaft: ") - 10;
            P = input("Enter the power supplied to the shaft: ")
            L = input("Find the length of the shaft: ")
            FOS = input("Enter the factor of safety: ")
            S_u = input("Enter the design stree for the material:");
            S_e = input("Enter the endurance stress for the material:")
            Tu_max1 = 0.3*S_e
            Tu_max2 = 0.18*S_u
            
            if Tu_max1 < Tu_max2
                Tu_max = Tu_max1
            else
                Tu_max = Tu_max2
            end
            Tu_all=Tu_max/FOS;
            S_max1 = 0.6*S_e
            S_max2 = 0.36*S_u
            
            if S_max1 < S_max2
                S_max = S_max1
            else
                S_max = S_max2
            end
            T = ((9.55*10^6)*P)/n;
            ks = 0;
            ds=((16*T)/(pi*Tu_all*(1-(k^4))))^(1/3);
            d_std = xlsread('Table3_5_a.xlsx');
            [m,n] = size(d_std);
            for ii = 1:n
                if ds<= d_std(ii)
                    disp('Standard size of the shaft (mm) using table 3.5(a) is : ')
                    ds = d_std(ii)
                    break
                else
                end
            end
            disp("Is it a hollow shaft?")
            choice = input("Y/N?",'s')
            if choice == 'Y'
                k = ("Enter the K value, i.e outer/inner diameter")
                Cm = 1.5;
                Ct = 1.0;
                do=((16*T)/(pi*Tu_all*(1-(k^4))))^(1/3);
                di=do*k;
                M=sqrt((((d^3)*(1-k^4)*pi*Tu_all)/(16))^2-((Ct*T)^2))/Cm;
                disp("-------------------------------------------------------------")
                disp("Results")
                fprintf("Outer diameter of hollow Shaft = %fmm\n",do);
                fprintf("Inner diameter of hollow Shaft = %fmm\n",di);
                fprintf("Moment of inertia = %fmm\n",M);
                disp("-------------------------------------------------------------")
            else
                disp("Value of k is taken as 0")
                k = 0;
                d=((16*T)/(pi*Tu_all*(1-(k^4))))^(1/3);
                Cm = 1.5;
                Ct = 1.0;
                M=sqrt((((d^3)*(1-k^4)*pi*Tu_all)/(16))^2-((Ct*T)^2))/Cm;
                disp("-------------------------------------------------------------")
                disp("Results")
                fprintf("Inner diameter of hollow Shaft = %fmm\n",d);
                fprintf("Moment of inertia = %fmm\n",M);
                disp("-------------------------------------------------------------")
            end
        else
            disp("INVALID INPUT")
            disp("If there is another procedure, this program dosent account for it.")
            disp("Thank you for participating.")
            disp("EXITING THE PROGRAM")
        end
        
    case 2
        disp("Design of Belt Drive")
        disp("Few questions will be asked to determine the")
        disp("----------------------------------------------------------------------")
        disp("Enter the required details as prompted by the respective input.")
        disp("----------------------------------------------------------------------")
        P = input("Enter the power to be transmitted: ")
        v = input("Enter the velocity of the belt: ")
        S = input("Enter the maximum stress : ")
        t = input("Enter the thickness of the belt: ")
        roh = input("Density of the belt : ")
        mu = input("Enter the coefficient of friction: ")
        N2 = input("Rpm of smaller pulley: ")
        N1 = input("Rpm of larger pulley: ")
        D2 = ((v*60*1000)/(pi*N1));
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
        D1 = ((D2*N1)/(N2));
        C = 2*D1;
        L = (2*C)+((pi/2)*(D+d))+(((D-d)^2)/(4*C));
        V=(pi*(D2+t)*N1)/(60*1000);
        tt_s=pi-((D-d)/C);
        g = 9.81;
        b=(P*1000)/(t*V*((S-((roh*g*(V^2))/(1e6*g)))*(((exp(mu*tt_s))-1)/(exp(mu*tt_s)))));
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
        syms T1 T2
        Tc=(roh*b*t*(V^2))/(1e6);
        eqns=[ (((T1-T2)*V)/1000)==(P) , ((T1-Tc)/(T2-Tc))==exp(mu*tt_s)];
        Solve=vpasolve(eqns);
        disp("-------------------------------------------------------------")
        disp("Results")
        fprintf("The diameter of the smaller pulley = %f mm\n",D2)
        fprintf("The diameter of the larger pulley = %f mm\n",D1)
        fprintf("The Length of the belt = %f mm\n",L)
        fprintf("The Width of the belt = %f mm\n",b)
        fprintf("Tension on the Tight Side = %f N\n",Solve.T1)
        disp("-------------------------------------------------------------")
        
    case 3
        disp("Design of Chain Drive")
        disp("Few questions will be asked to determine the")
        disp("----------------------------------------------------------------------")
        disp("Enter the required details as prompted by the respective input.")
        disp("----------------------------------------------------------------------")
        P = input("Enter the power to be transmitted: ")
        N2 = input("Rpm of smaller pulley: ")
        N1 = input("Rpm of larger pulley: ")
        i = N1/N2;
        if i>1 && i<2
            z1 = 29;
        elseif i>2 && i<3
            z1 = 26;
        elseif i>3 && i<4
            z1 = 24;
        elseif i>4 && i<5
            z1 = 22;
        elseif i>5 && i<7
            z1 = 19;
        elseif i==1
            z1 = 30;
        elseif i==2
            z1 = 27;
        elseif i==3
            z1 = 25;
        elseif i ==4
            z1 = 23;
        elseif i==5
            z1 = 21;
        elseif i==7
            z1 = 17;
        end
        z2 = i*z1;
        P = 10*(((60.67)/(N1/60))^(2/3));
        p_sd=[25.4 25.4 31.75 31.75 38.10 38.10 50.80 50.80 63.50 63.50 76.20 76.20 88.90 101.60];
        mld=[127.50 127.50 196.13 196.13 284.39 284.39 500.14 500.14 747.73 747.73 1108.15 1108.15 1510.22 2000.56];
        bld=[13.83 17.85 21.77 22.66 31.19 28.94 55.60 42.27 86.79 64.53 124.55 98.87 129.06 169.07];
        [q,w]=size(p_sd);
        for ii=1:w
            if p1>p_sd(ii)
            else
                W=mld(ii+1);
                Fu=bld(ii+1);
                return
            end
        end
        D1 = p1/(sind(180/z1));
        D2 = p1/(sind(180/z2));
        C1 = D1+D2;
        v = (P*z1*(N1/60))/1000;
        F = (1000*P)/v;
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
        FS = 11.7;
        Fw = (Fu*1000)/(FS*Ks);
        j = ceil(F/Fw);
        Fc = (W*(v^2))/9.81;
        K2 = 6;
        Fs = K2*W*(C1/1000);
        FS_actual = j*((Fu*1000)/(F+Fc+Fs));
        if FS_actual>FS
            disp('Chain is Safe');
        else
            disp("Chain is unsafe");
        end
        Cp = C1/P;
        alpha = asind((D2-D1)/(2*C1))
        Lp = 2*Cp*cosd(alpha) + 0.5*(z1+z2) + (alpha*(z2-z1))/180;
        L = P*Lp;
        Ce = (Lp - (0.5*(z1+z2))-(alpha*(z2-z1))/180)*p;
        Ce = Ce/2;
        disp("-------------------------------------------------------------")
        disp("Results")
        fprintf('Fs_actual:%f \n',FS_actual);
        fprintf('Alpha : %f \n',alpha);
        fprintf("Center distance = %f\n",Ce);
        fprintf("Chain length = %f\n",L);
        disp("-------------------------------------------------------------")
        
    case 4
        disp("Design of Springs")
        disp("Few questions will be asked to determine the")
        disp("----------------------------------------------------------------------")
        disp("Enter the required details as prompted by the respective input.")
        disp("----------------------------------------------------------------------")
        F = input("Enter the maximum force of the spring: ")
        y = input("Enter the deflectionf for max force: ")
        C = input("Enter the spring index: ")
        G = input("Rigidity of the spring: ")
        S_u = input("Ultimate tensile strength of the material: ")
        per = input("Percentage consideration between permissible and ultimate tensile strength: ")
        gap = input("Enter the gap between sucessive coils: ")
        tau = per*S_u
        K = ((4*C-1)/(4*C-4)) + ((0.615)/(C));
        d = sqrt((8*F*C*K)/(pi*tau));
        D = C*d;
        N = (y*G*d^4)/(8*F*D^3);
        N=ceil(N);
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
        y = (8*F*N*D^3)/(G*d^4);
        S_L=Nt*D;
        T_ag=(Nt-1)*gap;
        F_L=ceil(S_L+T_ag+y_act);
        p = F_L/(Nt-1);
        disp("-------------------------------------------------------------")
        disp("Results")
        fprintf("Wire diameter = %dmm\n",d)
        fprintf("Mean coil diameter = %dmm\n",D)
        fprintf("Finding the number of active coils) = %d\n",N)
        fprintf("Number of total coils = %\n",Nt)
        fprintf("Finding the free length of the spring = %f\n",F_L)
        fprintf("Pitch of the coil = %f\n",p)
        disp("-------------------------------------------------------------")
        
    case 5
        disp("Design of Bevel Gear")
        disp("Few questions will be asked to determine the")
        disp("type of procedure to be followed.")
        disp("Is the diameter known ?")
        choice = input("Y/N ?",'s')
        if choice == "Y"
            disp("Following the procedure if diameter is known:")
            disp("----------------------------------------------------------------------")
            disp("Enter the required details as prompted by the respective input.")
            disp("----------------------------------------------------------------------")
            d1 = input("Enter the diameter of the pinion: ")
            P = input("Enter the power supplied to the shaft: ")
            alpha = input("Enter the tooth angle:")
            ii = input("Enter the velocity ratio: ")
            N1 = input("Enter the rpm: ")
            disp("Do the worm gear and wheel made of same material ?")
            disp("Y/N ?")
            choice = input("Y/N :",'s')
            if choice == "Y"
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
                S_dp = S_d
                S_dg = S_dp;
                
            else
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
                S_dp = S_d
                disp("------------------")
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
                S_dg = S_d
            end
            d2 = ii*d1
            N2 = N1/ii
            del_p = atan(1/ii)*(180/pi);
            del_g = atan(ii)*(180/pi);
            z2 = ii*z1;
            zep = z1/cosd(del_p);
            zeg = z2/cosd(del_g);
            v = ((pi*d1*N1)/(60))
            Cv = ((6.1)/(6.1+v))
            Ft = ((1000*P)/(v))
            Y = pi*(0.124-((0.684)/(zep)))
            L = 0.5*(sqrt(d1^2+d2^2))
            b = L/3
            m = ((Ft*1000)/(S_dg*Cv*b*Y))*((L)/(L-b));
            M1 = [1,1.25,1.50,2.0,2.50,3,3.5,4,5,6,8,10,12,16,20,25,32,40,50];
            for iii = 19:-1:1
                if m <= M1(1,iii)
                    m_n_std = M1(1,iii);
                end
            end
            m = m_n_std;
            z1 = d1/m
            z2 = d2/m
            zep = z1/cosd(del_p);
            zeg = z2/cosd(del_g);
            Y_new = pi*(0.124- ((0.684)/(zep)))
            S_d_ind = ((Ft*1000)/(Ft*Cv*b*Y))*((L)/(L-b))
            
            K3 = 20.67;
            e1 = 0.0640;
            e2 = 0.06;
            C = 353.39;
            C = C/e2 * e1;
            Fd = Ft + ((K3*v*(C*b+Ft))/(K3*v+sqrt(C*b+Ft)));
            Q = ((2*zeg)/(zep+zeg));
            K = 1.324;
            Fw = ((d1*b*Q*K)/(cos(del_g)));
            
            disp("-------------------------------------------------------------")
            disp("Results")
            fprintf("Module = %dmm\n",m)
            fprintf("Face width = %dmm\n",b)
            fprintf("Diameter of the pinion = %dmm\n",d1)
            fprintf("Diameter of the gear = %dmm\n",d2)
            fprintf("No of teeth in pinion = %d\n",z1)
            fprintf("No of teeth in gear = %d\n",z2)
            if S_dg > S_d_ind
                disp("The calculated values are less than permissible values hence the assumed values are satisfactory.");
            else
                disp("The calculated values are greater than permissible values hence the assumed values are not satisfactory.");
            end
            if Fw >= Fd
                disp("Safe against wear");
            else
                disp("Not safe against wear");
            end
        elseif choice == "N"
            disp("Following the procedure if diameter is unknown:")
            disp("----------------------------------------------------------------------")
            disp("Enter the required details as prompted by the respective input.")
            disp("----------------------------------------------------------------------")
            Cv = input("Enter the service factor: ")
            P = input("Enter the power supplied to the pinion: ")
            alpha = input("Enter the tooth angle:")
            ii = input("Enter the velocity ratio: ")
            N1 = input("Enter the rpm: ")
            disp("Do the worm gear and wheel made of same material ?")
            disp("Y/N ?")
            choice = input("Y/N :",'s')
            if choice == "Y"
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
                S_dp = S_d
                S_dg = S_dp;
                
            else
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
                S_dp = S_d
                disp("------------------")
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
                S_dg = S_d
            end
            N2 = N1/ii
            del_p = atan(1/ii)*(180/pi);
            del_g = atan(ii)*(180/pi);
            z2 = ii*z1;
            zep = z1/cosd(del_p);
            zeg = z2/cosd(del_g);
            disp("Select the type of involute system")
            disp("1. 14.5 degree involute system")
            disp("2. 20 degree involute system")
            disp("3. 20 degree sub teeth system")
            c=input("Enter your choice : ");
            switch c
                case 1
                    y1=(0.124 - (0.684/z));
                case 2
                    y1=(0.154 - (0.912/z));
                case 3
                    y1=(0.175 - (0.95/z));
                otherwise
                    disp("Invalid input")
            end
            disp("Select the type of involute system")
            disp("1. 14.5 degree involute system")
            disp("2. 20 degree involute system")
            disp("3. 20 degree sub teeth system")
            c=input("Enter your choice : ");
            switch c
                case 1
                    y2=(0.124 - (0.684/z));
                case 2
                    y2=(0.154 - (0.912/z));
                case 3
                    y2=(0.175 - (0.95/z));
                otherwise
                    disp("Invalid input")
            end
            
            Mt = ((9.55*10^6*P)/(N2))
            temp = z1^2+z2^2;
            m = ((18*Mt)/(S_d*Cv*Y*z*(sqrt(temp))))^(1/3);
            M1 = [1,1.25,1.50,2.0,2.50,3,3.5,4,5,6,8,10,12,16,20,25,32,40,50];
            for iii = 19:-1:1
                if m <= M1(1,iii)
                    m_n_std = M1(1,iii);
                end
            end
            m = m_n_std;
            d1 = m*z1;
            d2 = ii*d1;
            L = (1/2)*sqrt(d1^2+d2^2);
            b = L/3;
            v = (pi*d2*N2)/(60);
            Cv = ((6.1)/(6.1+v));
            S_di = (Ft/(m*Cv*b*Y))*(L/(L-b));
            
            disp("-------------------------------------------------------------")
            disp("Results")
            fprintf("Module = %dmm\n",m)
            fprintf("Face width = %dmm\n",b)
            fprintf("Diameter of the pinion = %dmm\n",d1)
            fprintf("Diameter of the gear = %dmm\n",d2)
            fprintf("No of teeth in pinion = %d\n",z1)
            fprintf("No of teeth in gear = %d\n",z2)
            if S_d1*y1<S_d2*y2
                disp("Design is based on pinion")
                S_d=S_d1;
                Y=pi*y1;
                z=z1;
            else
                disp("Design is based on gear")
                S_d=S_d2;
                Y=pi*y2;
                z=z2;
            end
            if S_di < S_d
                disp("The calculated values lie between the permissible values");
            else
                disp("The calculated values lies outside the permissible values");
            end
        else
            disp("INVALID INPUT")
            disp("If there is another procedure, this program dosent account for it.")
            disp("Thank you for participating.")
            disp("EXITING THE PROGRAM")
        end
        
    case 6
        disp("Design of Helical Gear")
        disp("Few questions will be asked to determine the")
        disp("type of procedure to be followed.")
        choice = input("Y/N ?",'s')
        if choice == "Y"
        elseif choice == "N"
            disp("Following the procedure if center distance known:")
            disp("----------------------------------------------------------------------")
            disp("Enter the required details as prompted by the respective input.")
            disp("----------------------------------------------------------------------")
            P = input("Enter the power to be transmitted: ")
            alpha = input("Enter the tooth angle:")
            a = input("Enter the center distance: ")
            N1 = input("Enter the rpm of pinion: ")
            N2 = input("Enter the rpm of gear: ")
            beta = input("Enter the helix angle: ")
            i = N1/N2
            z_p = 20
            z_g = i*z_p
            z_ep = ceil(z_p/(cosd(beta))^3);
            Mt = (60*P*1e6)/(2*pi*N1);
            Cw = 1.15;
            Cv = 0.5;
            syms b m_n
            k = b/m_n;
            k = 15;
            m_n = (a*cosd(beta)*2)/(z_p + z_g);
            d_p = (z_p*m_n)/cosd(beta);
            d_g = i*d_p;
            b = k*m_n;
            b_min = (1.15*pi*m_n)/sind(beta);
            y = 0.154-(0.912/z_ep);
            Y = pi*y;
            S_d = (2*Mt*Cw*cosd(beta))/(m_n^3*Cv*k*Y*z_p);
            v = (pi*d_p*N1)/(60*1000);
            Cv = Eqn_12_25(v);
            Cs =1;
            Ft = ((2*Mt)/d_p)*Cs;
            S_ind = (Ft*Cw)/(Cv*b*Y*m_n);
            K3 = 20.67;
            E=[1 2 2.5 3 4 5 6 8 10 12 15 20 25 26;0.0960 0.0880 0.0840 0.0785 0.0710 0.0640 0.0590 0.0500 0.0386 0.0330 0.0230 0.0155 0.0130 0.0127];
            
            if  v<=26
                for ii=14:-1:1
                    if v <= E(1,ii)
                        diff1=E(1,ii)-v;
                        if ii <= 0
                            diff2=E(1,ii)-v;
                            diff_min=min(diff1,diff2);
                        else
                            diff_min=diff1;
                        end
                        if diff_min==diff1
                            e1 = E(2,ii);
                        else
                            e1 = E(2,ii-1);
                        end
                    end
                end
            elseif v>26
                e1 = E(2,14);
            else
                disp('Try again!!')
            end
            disp('Referring Table 12.12')
            disp('1.CAST IRON + CAST IRON & 14(1/2) deg')
            disp('2.CAST IRON + STEEL & 14(1/2) deg')
            disp('3.STEEL + STEEL & 14(1/2) deg')
            disp('4.CAST IRON + CAST IRON & 20-deg')
            disp('5.CAST IRON + STEEL & 20-deg')
            disp('6.STEEL + STEEL & 20-deg')
            disp('7.CAST IRON + CAST IRON & 20-deg stub')
            disp('8.CAST IRON + STEEL & 20-deg stub')
            disp('9.STEEL + STEEL & 20-deg stub')
            choice=input('CHOOSE 1-9 ACCORDING TO YOUR DESIGN REQUIREMENT: ')
            C1=[55.2 110.4 165.6 220.9 331.3 441.7 552.1 662.5 828.2];
            C2=[75.8 151.6 227.4 303.2 454.8 606.4 758.1 909.7 1137.1];
            C3=[110.3 220.6 330.9 441.3 662 882.6 1103.2 1323.9 1654.9];
            C4=[57.3 114.5 171.8 229.1 343.6 458.2 572.7 687.3 859.1];
            C5=[78.6 157.3 235.9 314.6 471.9 629.2 786.5 943.8 1180];
            C6=[114.4 228.9 343.3 457.8 686.7 915.6 1144.4 1373.3 1716.7];
            C7=[59.3 118.7 178 237.3 356 474.6 593.3 712 890];
            C8=[81.4 162.8 244.2 325.6 488.4 651.2 814 976.7 1221];
            C9=[118.7 237.3 356 474.6 712 949.3 1186.6 1423.9 1780];
            
            Cc = [C1;C2;C3;C4;C5;C6;C7;C8;C9];
            Err = [0.01 0.02 0.03 0.04 0.06 0.08 0.10 0.12 0.15];
            E = round(e1,2);
            for ii=1:9
                if E >= Err(ii)
                    C = Cc(choice,ii);
                    C = (e1*C)/E;
                end
            end
            Fd = Ft+((K3*v*cosd(beta)*((C*b*(cosd(beta))^2)+Ft))/((K3*v)+sqrt((C*b*(cosd(beta))^2)+Ft)));
            Fs = S_d*b*Y*m_n;
            m = m_n/cosd(beta);
            alpha_n = atand(tand(alpha)/cosd(beta));
            p = pi*m;
            p_a = p/tand(beta);
            d_ap = m_n*((z_p/cosd(beta))+2);
            d_dp = m_n*((z_p/cosd(beta))-2.5);
            Ft = (2*Mt)/d_p;
            Fa = Ft*tand(beta);
            Fr = (Ft*tand(alpha_n))/cosd(beta);
            if b>b_min
                disp('Calculated value for b is safe')
            else
                disp('Calculated value for b is not safe')
            end
            if S_ind < S_d
                disp('The assumed values are satisfactory')
            else
                disp('The assumed values are not satisfactory')
            end
            if Fs >= Fd
                disp('The material is safe against static tooth load')
            else
                disp('The material is not safe against static tooth load')
            end
        else
            disp("INVALID INPUT")
            disp("If there is another procedure, this program dosent account for it.")
            disp("Thank you for participating.")
            disp("EXITING THE PROGRAM")
        end
        
    case 7
        disp("Design of Spur Gear")
        disp("Few questions will be asked to determine the")
        disp("type of procedure to be followed.")
        disp("IS the center distance unknown ?")
        choice = input("Y/N ?",'s')
        if choice == "Y"
            disp("Following the procedure if center distance unknown:")
            disp("----------------------------------------------------------------------")
            disp("Enter the required details as prompted by the respective input.")
            disp("----------------------------------------------------------------------")
            P = input("Enter the power to be transmitted: ")
            alpha = input("Enter the tooth angle:")
            z1 = input("Enter the number of teeth: ")
            N1 = input("Enter the rpm of pinion: ")
            N2 = input("Enter the rpm of gear: ")
            Cs = input("Enter the service factor: ")
            disp("Do the worm gear and wheel made of same material ?")
            disp("Y/N ?")
            choice = input("Y/N ?")
            if choice == "Y"
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
                S_d1 = S_d
                S_d2 = S_d1;
                
            else
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
                S_d1 = S_d
                disp("------------------")
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
                S_d2 = S_d
            end
            i = N1/N2;
            z2 = i*z1;
            disp("Select the type of involute system")
            disp("1. 14.5 degree involute system")
            disp("2. 20 degree involute system")
            disp("3. 20 degree sub teeth system")
            c=input("Enter your choice : ");
            switch c
                case 1
                    y1=(0.124 - (0.684/z));
                case 2
                    y1=(0.154 - (0.912/z));
                case 3
                    y1=(0.175 - (0.95/z));
                otherwise
                    disp("Invalid input")
            end
            disp("Select the type of involute system")
            disp("1. 14.5 degree involute system")
            disp("2. 20 degree involute system")
            disp("3. 20 degree sub teeth system")
            c=input("Enter your choice : ");
            switch c
                case 1
                    y2=(0.124 - (0.684/z));
                case 2
                    y2=(0.154 - (0.912/z));
                case 3
                    y2=(0.175 - (0.95/z));
                otherwise
                    disp("Invalid input")
            end
            if S_d1*y1<S_d2*y2
                disp("Design is based on pinion")
                S_d=S_d1;
                Y=pi*y1;
                z=z1;
            else
                disp("Design is based on gear")
                S_d=S_d2;
                Y=pi*y2;
                z=z2;
            end
            Mt = ((P*60)/(2*pi*N2))*10^3;
            k = 10;
            Cv = 5;
            m = 3.4;
            
            
            Tb = [1 1.25 1.5 2 2.5 3 5 6 8 10 12 16 20 25 32 40 50];
            for ii = 1:length(Tb)
                if m==Tb[ii]
                    break
                elseif Tb(ii)<m && m<Tb(ii+1)
                    m=Tb(ii+1);
                end
            end
            d1 = m*z1;
            d2 = m*z2;
            b = 10*m;
            v = (pi*d2*N2)/(1000*60)
            if v<=8
                Cv1 = 3.05/(3.05+v);
            elseif v>8 && v<=13
                Cv1 = 4.58/(4.58+v);
            elseif v>13 && v<=20
                Cv1 = 6.1/(6.1+v);
            elseif v>20
                Cv1 = 5.55/(5.55+sqrt(v));
            end
            Ft = (2*Mt*Cs*1000)/(d2);
            S_d22 = Ft/(pi*Cv1*b*y2*m*10^3);
            if S_d22 >S_d2
                disp('Values are not satisfactory');
            else
                disp('Values are satisfactory');
            end
            K3 = 20.67;
            E=[1 2 2.5 3 4 5 6 8 10 12 15 20 25 26;0.0960 0.0880 0.0840 0.0785 0.0710 0.0640 0.0590 0.0500 0.0386 0.0330 0.0230 0.0155 0.0130 0.0127];
            
            if  v<=26
                for ii=14:-1:1
                    if v <= E(1,ii)
                        diff1=E(1,ii)-v;
                        if ii <= 0
                            diff2=E(1,ii)-v;
                            diff_min=min(diff1,diff2);
                        else
                            diff_min=diff1;
                        end
                        if diff_min==diff1
                            e1 = E(2,ii);
                        else
                            e1 = E(2,ii-1);
                        end
                    end
                end
            elseif v>26
                e1 = E(2,14);
            else
                disp('Try again!!')
            end
            e = 0.04
            k1 =8.7;
            C = 457.8;
            C = (C*e1)/e;
            Fd = Ft + (K3*v*(C*b+Ft))/((K3*v) + sqrt(C*b +Ft));
            Fd = Fd*10^-3;
            disp("-------------------------------------------------------------")
            disp("Results")
            fprintf("Module = %dmm\n",m)
            fprintf("Face width = %dmm\n",b)
            fprintf("Diameter of the pinion = %dmm\n",d1)
            fprintf("Diameter of the gear = %dmm\n",d2)
            fprintf("No of teeth in pinion = %d\n",z1)
            fprintf("No of teeth in gear = %d\n",z2)
        elseif choice == "N"
            disp("Following the procedure if center distance known:")
            disp("----------------------------------------------------------------------")
            disp("Enter the required details as prompted by the respective input.")
            disp("----------------------------------------------------------------------")
            P = input("Enter the power to be transmitted: ")
            alpha = input("Enter the tooth angle:")
            z1 = input("Enter the number of teeth: ")
            N1 = input("Enter the rpm of pinion: ")
            N2 = input("Enter the rpm of gear: ")
            Cs = input("Enter the service factor: ")
            disp("Do the worm gear and wheel made of same material ?")
            disp("Y/N ?")
            choice = input("Y/N ?")
            if choice == "Y"
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
                S_d1 = S_d
                S_d2 = S_d1;
                
            else
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
                S_d1 = S_d
                disp("------------------")
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
                S_d2 = S_d
            end
            d1 = (2*C)/4
            d2 = i*d1;
            z1 = 20;
            z2 =i*z1;
            disp("Select the type of involute system")
            disp("1. 14.5 degree involute system")
            disp("2. 20 degree involute system")
            disp("3. 20 degree sub teeth system")
            c=input("Enter your choice : ");
            switch c
                case 1
                    y1=(0.124 - (0.684/z));
                case 2
                    y1=(0.154 - (0.912/z));
                case 3
                    y1=(0.175 - (0.95/z));
                otherwise
                    disp("Invalid input")
            end
            disp("Select the type of involute system")
            disp("1. 14.5 degree involute system")
            disp("2. 20 degree involute system")
            disp("3. 20 degree sub teeth system")
            c=input("Enter your choice : ");
            switch c
                case 1
                    y2=(0.124 - (0.684/z));
                case 2
                    y2=(0.154 - (0.912/z));
                case 3
                    y2=(0.175 - (0.95/z));
                otherwise
                    disp("Invalid input")
            end
            if S_d1*y1<S_d2*y2
                disp("Design is based on pinion")
                S_d=S_d1;
                Y=pi*y1;
                z=z1;
            else
                disp("Design is based on gear")
                S_d=S_d2;
                Y=pi*y2;
                z=z2;
            end
            N2 = N1/i
            Mt = ((P*1000*60)/(2*pi*N2))*10^3;
            k = 10;
            Cv = 0.5;
            m = ((2*Mt)/(S_d*Cv*k*Y*z))^(1/3);
            Tb = [1 1.25 1.5 2 2.5 3 5 6 8 10 12 16 20 25 32 40 50];
            for ii = 1:length(Tb)
                if m==Tb[ii]
                    break
                elseif Tb(ii)<m && m<Tb(ii+1)
                    m=Tb(ii+1);
                end
            end
            d1 = m*z1;
            d2 = m*z2;
            b = 10*m;
            v = (pi*d2*N2)/(1000*60);
            if v<=8
                Cv1 = 3.05/(3.05+v);
            elseif v>8 && v<=13
                Cv1 = 4.58/(4.58+v);
            elseif v>13 && v<=20
                Cv1 = 6.1/(6.1+v);
            elseif v>20
                Cv1 = 5.55/(5.55+sqrt(v));
            end
            Ft = (2*Mt)/(d2);
            S_d22 = Ft/(pi*Cv1*b*y2*m*10^3);
            if S_d22 >S_d2
                disp('Values are not satisfactory');
            else
                disp('Values are satisfactory');
            end
            K3 = 20.67;
            E=[1 2 2.5 3 4 5 6 8 10 12 15 20 25 26;0.0960 0.0880 0.0840 0.0785 0.0710 0.0640 0.0590 0.0500 0.0386 0.0330 0.0230 0.0155 0.0130 0.0127];
            
            if  v<=26
                for ii=14:-1:1
                    if v <= E(1,ii)
                        diff1=E(1,ii)-v;
                        if ii <= 0
                            diff2=E(1,ii)-v;
                            diff_min=min(diff1,diff2);
                        else
                            diff_min=diff1;
                        end
                        if diff_min==diff1
                            e1 = E(2,ii);
                        else
                            e1 = E(2,ii-1);
                        end
                    end
                end
            elseif v>26
                e1 = E(2,14);
            else
                disp('Try again!!')
            end
            k1 = 8.7;
            C = 457.8;
            e = 0.04;
            C = (C*e1)/e;
            Fd = Ft + (K3*v*(C*b+Ft))/((K3*v) + sqrt(C*b +Ft));
            Fd = Fd*10^-3;
            Q = 2*z2/(z2+z1);
            S_es = 429;
            K = 0.657;
            Fw = d1*b*Q*K*10^-3;
            if Fw>Fd
                disp('Material is Safe against wear');
            else
                disp('Material is not safe against wear');
            end
            disp("-------------------------------------------------------------")
            disp("Results")
            fprintf("Module = %dmm\n",m)
            fprintf("Face width = %dmm\n",b)
            fprintf("Diameter of the pinion = %dmm\n",d1)
            fprintf("Diameter of the gear = %dmm\n",d2)
            fprintf("No of teeth in pinion = %d\n",z1)
            fprintf("No of teeth in gear = %d\n",z2)
        else
            disp("INVALID INPUT")
            disp("If there is another procedure, this program dosent account for it.")
            disp("Thank you for participating.")
            disp("EXITING THE PROGRAM")
        end
        
    case 8
        disp("Design of Worm Gear")
        disp("Few questions will be asked to determine the")
        disp("type of procedure to be followed.")
        disp("Is the center distance between the worm gear and wheel known ?")
        choice = input("Y/N :",'s')
        if choice == "Y"
            disp("Following the procedure if center distance known:")
            disp("----------------------------------------------------------------------")
            disp("Enter the required details as prompted by the respective input.")
            disp("----------------------------------------------------------------------")
            a = input("Enter the distance between the centers: ")
            P = input("Enter the power supplied to the shaft: ")
            ii = input("Enter the speed ratio given: ")
            N1 = input("Enter the worm speed: ")
            disp("Has the number of starts been given?")
            choice = input("Y/N :",'s')
            if choice == "Y"
                z1 = input("Enter the number of starts on the worm: ")
            else
                disp("Default number of start have been considered.")
                z1 = 1;
            end
            disp("----------------------------------------------------------------------")
            disp("Choose the pressure angle:")
            disp("1. 14.5 degrees")
            disp("2. 20 degrees")
            disp("3. 25 degrees")
            disp("4. 30 degrees")
            choice = input("Enter the degree choice:")
            switch choice
                case 1
                    alpha = 14.5;
                    y = 0.1;
                case 2
                    alpha = 20;
                    y = 0.125;
                case 3
                    alpha = 25;
                    y = 0.15;
                case 4
                    alpha = 30;
                    y = 0.175;
            end
            disp("----------------------------------------------------------------------")
            disp("Has the material for worm gear and wheel provided ? Y/N: ")
            choice = input("Y/N :",'s')
            if choice == "Y"
                disp("Do the worm gear and wheel made of same material ?")
                disp("Y/N ?")
                choice = input("Y/N :",'s')
                if choice == "Y"
                    S_d1 = input("Enter the design stress for worm gear and worm : ")
                    S_d2 = S_d1;
                else
                    S_d1 = input("Enter the design stress for worm gear : ")
                    S_d2 = input("Enter the design stress for worm wheel: ")
                end
            else
                disp("Default material has been chosen.")
                disp("Material for worm is Hardened Steel - 45 MPa.")
                S_d1 = 45;
                disp("Material for worm wheel is phosphorous - 52 MPa.")
                S_d2 = 52;
            end
            disp("----------------------------------------------------------------------")
            disp("The design is based on the weaker part of the two.")
            disp("The worm wheel is assumed to be weaker than worm since it is subjected to sliding action,")
            disp("thereby resulting in overheating and ultimately leading to failure.")
            %---------------------------calculations---------------------
            n1 = N1/60;
            n2 = n1/ii;
            d1 = (a^(0.875))/1.466;
            d2 = 2*a - d1;
            Mt = ((9.55*(10^6)*P)/(n2*60));
            disp("Choose the applicable load factors:")
            disp("---------------------------------------------------------------------------")
            disp("|  Driver     |                   Driver Machinery                |  Factor")
            disp("---------------------------------------------------------------------------")
            disp("| Steam       |1 Electric generator, steady load turbine blower   |   1.00 ")
            disp("|  Turbine    |2 Electric generator, uneven load, centrifugal pump|   1.25 ")
            disp("|             |3 Induced-draft fan; line shaft, gear drive        |   1.50 ")
            disp("|             |4 Rollin mill, gear drive                          |   2.00 ")
            disp("---------------------------------------------------------------------------")
            disp("|Electric     |5 Turbine blower; metal working machinery          |   1.25 ")
            disp("|  Motor      |6 Centrifugal pump;woodworking machinery           |   1.50 ")
            disp("|             |7 Line shaft; Ship propeller; double-acting pump   |   1.75 ")
            disp("|             |8 Triplex single-acting 'pump'; elevator; crane    |   1.75 ")
            disp("|             |9 Compressor,air or ammonia                        |   1.75 ")
            disp("|             |10 Rolling mill; rubber mill                       |   2.50 ")
            disp("---------------------------------------------------------------------------")
            disp("|  Steam      |11 Values for electric motor                       |    1.2 ")
            disp("|  Engine     |12                  multiplied by                  |    1.5 ")
            disp("---------------------------------------------------------------------------")
            disp("|Gas & Oil    |13 Values for electric- motor drive multiplied by  |   1.3  ")
            disp("|  Engines    |14 the factor depdign on the coefficienft of       |   1.6  ")
            disp("|             |  steadiness of the flywheel                       |        ")
            disp("---------------------------------------------------------------------------")
            choice = input("Enter the option:")
            switch choice
                case 1
                    Kt = 1;
                case 2
                    Kt = 1.25;
                case 3
                    Kt = 1.5;
                case 4
                    Kt = 2;
                case 5
                    Kt = 1.25;
                case 6
                    Kt = 1.5;
                case 7
                    Kt = 1.75;
                case 8
                    Kt = 1.75;
                case 9
                    Kt = 1.75;
                case 10
                    Kt = 2.50;
                case 11
                    Kt = 1.2;
                case 12
                    Kt = 1.5;
                case 13
                    Kt = 1.3;
                case 14
                    Kt = 1.6;
            end
            Ft = ((2*Mt*Kt)/(d2));
            v = ((pi*d2*n2)/(1000));
            Cv = ((6.1)/(6.1+v));
            b = ((a^0.875)/(2));
            m = ((Ft)/(S_d*Cv*b*pi*y));
            m_stand=[1 1.25 1.5 2 2.5 3 4 5 6 8 10 12 16 20 25 32 40 50];
            [q,w]=size(m_stand);
            for ii=1:w
                if m<m_stand(ii)
                    m=m_stand(ii);
                    return
                else
                end
            end
            gamma = atand((m*z1)/(d1));
            disp("Choose the material pair of worm gear and wheel:")
            disp("1.Steel-Phosphor Bronze")
            disp("2.Hardened steel-Phosohor Bronze")
            disp("3.Hardened steel- Chilled bronze")
            disp("4.Hardened steel - Antimony bronze")
            disp("5.Cast Iron-Phosphor bronze")
            choice = input("Enter the option:")
            switch choice
                case 1
                    if gamma >0 && gamma <= 10
                        K = 0.412;
                    elseif gamma > 10 && gamma <= 25
                        K = 0.515;
                    else
                        K = 0.618;
                    end
                case 2
                    if gamma >0 && gamma <= 10
                        K = 0.549;
                    elseif gamma > 10 && gamma <= 25
                        K = 0.687;
                    else
                        K = 0.824;
                    end
                case 3
                    if gamma >0 && gamma <= 10
                        K = 0.824;
                    elseif gamma > 10 && gamma <= 25
                        K = 1.030;
                    else
                        K = 1.236;
                    end
                case 4
                    if gamma >0 && gamma <= 10
                        K = 0.824;
                    elseif gamma > 10 && gamma <= 25
                        K = 1.030;
                    else
                        K = 1.236;
                    end
                case 5
                    if gamma >0 && gamma <= 10
                        K = 1.030;
                    elseif gamma > 10 && gamma <= 25
                        K = 1.285;
                    else
                        K = 1.46;
                    end
            end
            Fs = S_d2*b*Y*m;
            Fw = d2*b*K;
            disp("The dynamic and wear forces have been calculated. Verfying if the material safe agianst wear...")
            vr = ((pi*d1*n1)/(1000*cosd(gamma)))
            if vr > 2.75
                mu = 0.025 + ((3.281*vr)/(1000));
            else
                mu = ((0.0422)/(vr^(0.28)));
            end
            theta = atand(tand(alpha)*cosd(gamma));
            eta = (cosd(alpha)-(mu*cotd(gamma)))/(cosd(alpha)+(mu*tand(gamma)));
            Fn = ((Ft)/(cosd(gamma)*cosd(alpha)));
            Qg = ((mu*Fn*vr)/(cosd(gamma)));
            disp("Does the difference in temperature be accounted for")
            choice = input("Y/N :",'s')
            if choice == "Y"
                Dt = input("Enter the difference of temperature: ")
                Ag=(pi*d2^2)/4
                Lw=(14.14+0.063*z1)*m
                Aw=Lw*d1
                Qd = (0.407/1e3)*(Ag+Aw)*Dt;
            else
                Qd = 1000*P*(1-eta);
            end
            disp("The heat dissipated and generated are claculated. Verifying if artificial cooling is required...")
            disp("-------------------------------------------------------------")
            disp("Results")
            fprintf("Pitch diameter of the worm (d1) = %dmm\n",d1)
            fprintf("Pitch diameter of the worm gear (d2) = %dmm\n",d2)
            fprintf("Standard module (m) = %dmm\n",m)
            fprintf("Lead angle = %fdegree\n",gamma)
            fprintf("Dynamic tooth load (Fd) = %fN\n\n",Fs)
            fprintf("Tooth wear load (Fw) = %fN\n\n",Fw)
            if Fw>Fs
                disp("The material is safe against wear")
            else
                disp("The material is not safe against wear")
            end
            fprintf("Efficiency = %f%%\n",eta*100)
            fprintf("Heat generated = %fKW\n",Qg/1e3)
            fprintf("Heat dissipated = %fKW\n",Qd/1e3)
            if Qd>Qg
                disp("Artificial cooling is not necessary");
            else
                disp("Artificial cooling is necessary");
            end
            disp("---------------------------------------------------------------")
        elseif choice == "N"
            disp("Following the procedure if center distance unknown")
            disp("----------------------------------------------------------------------")
            a = input("Enter the distance between the centers: ")
            P = input("Enter the power supplied to the shaft: ")
            ii = input("Enter the speed ratio given: ")
            N1 = input("Enter the worm speed: ")
            disp("Has the number of starts been given?")
            choice = input("Y/N :",'s')
            if choice == "Y"
                z1 = input("Enter the number of starts on the worm: ")
            else
                disp("Default number of start have been considered.")
                z1 = 1;
            end
            disp("----------------------------------------------------------------------")
            disp("----------------------------------------------------------------------")
            disp("Choose the pressure angle:")
            disp("1. 14.5 degrees")
            disp("2. 20 degrees")
            disp("3. 25 degrees")
            disp("4. 30 degrees")
            choice = input("Enter the degree choice:")
            switch choice
                case 1
                    alpha = 14.5;
                    y = 0.1;
                case 2
                    alpha = 20;
                    y = 0.125;
                case 3
                    alpha = 25;
                    y = 0.15;
                case 4
                    alpha = 30;
                    y = 0.175;
            end
            disp("----------------------------------------------------------------------")
            disp("Has the material for worm gear and wheel provided ? Y/N: ")
            choice = input("Y/N :",'s')
            if choice == "Y"
                disp("Do the worm gear and wheel made of same material ?")
                disp("Y/N ?")
                choice = input("Y/N :",'s')
                if choice == "Y"
                    S_d1 = input("Enter the design stress for worm gear and worm : ")
                    S_d2 = S_d1;
                else
                    S_d1 = input("Enter the design stress for worm gear : ")
                    S_d2 = input("Enter the design stress for worm wheel: ")
                end
            else
                disp("Default material has been chosen.")
                disp("Material for worm is Hardened Steel - 45 MPa.")
                S_d1 = 45;
                disp("Material for worm wheel is phosphorous - 52 MPa.")
                S_d2 = 52;
            end
            disp("----------------------------------------------------------------------")
            disp("The design is based on the weaker part of the two.")
            disp("The worm wheel is assumed to be weaker than worm since it is subjected to sliding action,")
            disp("thereby resulting in overheating and ultimately leading to failure.")
            %---------------------------calculations---------------------
            z1 = 1;
            n1 = N1/60;
            n2 = n1/ii;
            a = ((P*(ii+5))/(0.02905))^(1/1.7);
            d1 = (a^(0.875))/1.466;
            d2 = 2*a - d1;
            Mt = ((9.55*(10^6)*P)/(n2*60));
            Kt = 1;
            disp("Choose the applicable load factors:")
            disp("---------------------------------------------------------------------------")
            disp("|  Driver     |                   Driver Machinery                |  Factor")
            disp("---------------------------------------------------------------------------")
            disp("| Steam       |1 Electric generator, steady load turbine blower   |   1.00 ")
            disp("|  Turbine    |2 Electric generator, uneven load, centrifugal pump|   1.25 ")
            disp("|             |3 Induced-draft fan; line shaft, gear drive        |   1.50 ")
            disp("|             |4 Rollin mill, gear drive                          |   2.00 ")
            disp("---------------------------------------------------------------------------")
            disp("|Electric     |5 Turbine blower; metal working machinery          |   1.25 ")
            disp("|  Motor      |6 Centrifugal pump;woodworking machinery           |   1.50 ")
            disp("|             |7 Line shaft; Ship propeller; double-acting pump   |   1.75 ")
            disp("|             |8 Triplex single-acting 'pump'; elevator; crane    |   1.75 ")
            disp("|             |9 Compressor,air or ammonia                        |   1.75 ")
            disp("|             |10 Rolling mill; rubber mill                       |   2.50 ")
            disp("---------------------------------------------------------------------------")
            disp("|  Steam      |11 Values for electric motor                       |    1.2 ")
            disp("|  Engine     |12                  multiplied by                  |    1.5 ")
            disp("---------------------------------------------------------------------------")
            disp("|Gas & Oil    |13 Values for electric- motor drive multiplied by  |   1.3  ")
            disp("|  Engines    |14 the factor depdign on the coefficienft of       |   1.6  ")
            disp("|             |  steadiness of the flywheel                       |        ")
            disp("---------------------------------------------------------------------------")
            choice = input("Enter the option:")
            switch choice
                case 1
                    Kt = 1;
                case 2
                    Kt = 1.25;
                case 3
                    Kt = 1.5;
                case 4
                    Kt = 2;
                case 5
                    Kt = 1.25;
                case 6
                    Kt = 1.5;
                case 7
                    Kt = 1.75;
                case 8
                    Kt = 1.75;
                case 9
                    Kt = 1.75;
                case 10
                    Kt = 2.50;
                case 11
                    Kt = 1.2;
                case 12
                    Kt = 1.5;
                case 13
                    Kt = 1.3;
                case 14
                    Kt = 1.6;
            end
            Ft = ((2*Mt*Kt)/(d2));
            v = ((pi*d2*n2)/(1000));
            Cv = ((6.1)/(6.1+v));
            b = ((a^0.875)/(2));
            m = ((Ft)/(S_d*Cv*b*pi*y));
            m_stand=[1 1.25 1.5 2 2.5 3 4 5 6 8 10 12 16 20 25 32 40 50];
            [q,w]=size(m_stand);
            for ii=1:w
                if m<m_stand(ii)
                    m=m_stand(ii);
                    return
                else
                end
            end
            gamma = atand((m*z1)/(d1));
            disp("Choose the material pair of worm gear and wheel:")
            disp("1.Steel-Phosphor Bronze")
            disp("2.Hardened steel-Phosohor Bronze")
            disp("3.Hardened steel- Chilled bronze")
            disp("4.Hardened steel - Antimony bronze")
            disp("5.Cast Iron-Phosphor bronze")
            choice = input("Enter the option:")
            switch choice
                case 1
                    if gamma >0 && gamma <= 10
                        K = 0.412;
                    elseif gamma > 10 && gamma <= 25
                        K = 0.515;
                    else
                        K = 0.618;
                    end
                case 2
                    if gamma >0 && gamma <= 10
                        K = 0.549;
                    elseif gamma > 10 && gamma <= 25
                        K = 0.687;
                    else
                        K = 0.824;
                    end
                case 3
                    if gamma >0 && gamma <= 10
                        K = 0.824;
                    elseif gamma > 10 && gamma <= 25
                        K = 1.030;
                    else
                        K = 1.236;
                    end
                case 4
                    if gamma >0 && gamma <= 10
                        K = 0.824;
                    elseif gamma > 10 && gamma <= 25
                        K = 1.030;
                    else
                        K = 1.236;
                    end
                case 5
                    if gamma >0 && gamma <= 10
                        K = 1.030;
                    elseif gamma > 10 && gamma <= 25
                        K = 1.285;
                    else
                        K = 1.46;
                    end
            end
            Fs = S_d2*b*Y*m;
            Fw = d2*b*K;
            disp("The dynamic and wear forces have been calculated. Verfying if the material safe agianst wear...")
            vr = ((pi*d1*n1)/(1000*cosd(gamma)))
            if vr > 2.75
                mu = 0.025 + ((3.281*vr)/(1000));
            else
                mu = ((0.0422)/(vr^(0.28)));
            end
            theta = atand(tand(alpha)*cosd(gamma));
            eta = (cosd(alpha)-(mu*cotd(gamma)))/(cosd(alpha)+(mu*tand(gamma)));
            Fn = ((Ft)/(cosd(gamma)*cosd(alpha)));
            Qg = ((mu*Fn*vr)/(cosd(gamma)));
            disp("Does the difference in temperature be accounted for")
            choice = input("Y/N :",'s')
            if choice == "Y"
                Dt = input("Enter the difference of temperature: ")
                Ag=(pi*d2^2)/4
                Lw=(14.14+0.063*z1)*m
                Aw=Lw*d1
                Qd = (0.407/1e3)*(Ag+Aw)*Dt;
            else
                Qd = 1000*P*(1-eta);
            end
            disp("The heat dissipated and generated are claculated. Verifying if artificial cooling is required...")
            disp("-------------------------------------------------------------")
            disp("Results")
            fprintf("Center Diameter Distance) = %dmm\n",a)
            fprintf("Pitch diameter of the worm (d1) = %dmm\n",d1)
            fprintf("Pitch diameter of the worm gear (d2) = %dmm\n",d2)
            fprintf("Standard module (m) = %dmm\n",m)
            fprintf("Lead angle = %fdegree\n",gamma)
            fprintf("Dynamic tooth load (Fd) = %fN\n\n",Fs)
            fprintf("Tooth wear load (Fw) = %fN\n\n",Fw)
            if Fw>Fs
                disp("The material is safe against wear")
            else
                disp("The material is not safe against wear")
            end
            fprintf("Efficiency = %f%%\n",eta*100)
            fprintf("Heat generated = %fKW\n",Qg/1e3)
            fprintf("Heat dissipated = %fKW\n",Qd/1e3)
            if Qd>Qg
                disp("Artificial cooling is not necessary");
            else
                disp("Artificial cooling is necessary");
            end
            disp("---------------------------------------------------------------")
        else
            disp("INVALID INPUT")
            disp("If there is another procedure, this program dosent account for it.")
            disp("Thank you for participating.")
            disp("EXITING THE PROGRAM")
        end
    otherwise
        disp("ENTER A VALID INPUT")
        disp("EXITING OUT OF THE PROGRAM")
        disp("-------------------------------------------------------------------------")
end