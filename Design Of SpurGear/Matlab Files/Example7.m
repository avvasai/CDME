%% 
% Program for Design of Spur Gear, Problem 7.
% 
% Problem Statement: A 12 kW motor running at 1170 rpm drives a fan through 
% a pair of spur gears (forged steel SAE 1030 pinion and CI gear) with a reduction 
% ratio 3.9:1. Design the gear and check for dynamic and wear loads.
% 
% Date: 20/10/2020
% 
% Name: Avva Sai Pranav
% 
% USN: PES1201800861

clc;
clear all;
%% 
% Intialzing the given data:

P = 12
N1 = 1170
i = 3.9
N2  = N1/i
alpha = 14.5
%% 
% Finding the number of teeth ing pinion and gear:

z1 = 20
z2 =i*z1
%% 
% Finding the lewis form factor:

[y1]=Lewis(z1)
[y2]=Lewis(z2)
%% 
% Finding the stress value for both gear and pinion:

[S_d] = Table_12_7();
S_d1 = S_d;
[S_d] = Table_12_7();
S_d2 = S_d;
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

N2 = N1/i
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
S_es = 429;
K = 0.598
[Fw] = Eqn_12_15_a(K,Q,b,d1)
if Fw>Fd
    disp('Material is Safe against wear');
else
    disp('Material is not safe against wear');
end
%% 
% As the material is not safe against wear the BHN number should be changed 
% using table 12.16