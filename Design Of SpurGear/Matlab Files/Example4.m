%% 
% Program for Design of Spur Gear, Problem 4.
% 
% Problem Statement:Design a pair of spur gears to transmit 20 kW of power while 
% operating for 8 to 10 hours per day sustaining medium shock, from a shaft rotating 
% at 1000 rpm to a parallel shaft which is to rotate at 310 rpm. Assume the number 
% of teeth on pinion to be 31 and 20 degree full depth involute tooth profile. 
% The material of the pinion is C40 steel, untreated whose Su   = 206.81 N/mm^2 
% and for gear is cast steel, 0.2% C untreated whose Su = 137.34 N/mm^2. Check 
% the design for dynamic load if load fact C - 5.22.464 N/mm and also for wear 
% load taking load stress factor K  = 0.297 N/mm^2. Suggest suitable hardness.
% 
% Date: 21/10/2020
% 
% Name: Avva Sai Pranav
% 
% USN: PES1201800861

clc;
clear all;
%% 
% Intializing the know values:

N1 = 1000
N2 = 310
alpha = 20
P = 20
z1 = 31
S_d1 = 206.81
S_d2 = 137.34
C = 522.464
K = 0.279
%% 
% Finding the velocity ratio and the number of teeth on pinion and gear respectiely:

i = N1/N2
z1
z2 = z1*i
%% 
% Finding the lewis form factor:

[y1]=Lewis(z2)
[y2]=Lewis(z2)
%% 
% Finding the strength factor to decide what the design is based on:

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
%% 
% Finding the module and standardizing it:

Mt = ((P*1000*60)/(2*pi*N2))*10^3;
k = 10
Cv = 0.5
[m] = Eqn_12_5_b(Mt,S_d,Cv,k,Y,z)
[m] = Tb12_2_1a(m)
%% 
% Finding the PCD of pinion and gear respectively:

d1 = m*z1
d2 = m*z2
%% 
% Finding the face width, velocity and Tangential Force :

b = 10*m
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
Ft = (2*Mt)/(d2)
%% 
% Verifying if the values found are satifactory:

S_d22 = Ft/(pi*Cv1*b*y2*m*10^3);
if S_d22 >S_d2
    disp('Values are not satisfactory');
else
    disp('Values are satisfactory');
end
%% 
% Finding the dynamic load:

K3 = 20.67
e1 = Table_12_14(v)
k1 = 8.7;
C = 457.8
e = 0.04
C = (C*e1)/e
[Fd] = Eqn_12_12(Ft,K3,v,C,b);
Fd = Fd*10^-3
%% 
% Finding the Wear and finding if the material is safe against wear:

[Q] = Eqn_12_15_c(z1,z2)
S_es = 617.8;
K = (Fd*1000)/(d1*b*Q);
[Fw] = Eqn_12_15_a(K,Q,b,d1)
if Fw>Fd
    disp('Material is Safe against wear');
else
    disp('Material is not safe against wear');
end
%% 
% As the material is not safe against wear, the BHN values of both should be 
% increased or a different gear and pinion material need to be used.