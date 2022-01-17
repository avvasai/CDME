%% 
% Program for Design of Spur Gear, Problem 5.
% 
% Problem Statement: Specify the details of a spur gear to transmit 20 kW at 
% 1200 rp. THe teth are of 20 degrees full depth involute system, having 16th 
% theeth on pinion and a speed ration of 3:1. Asume that the starting torque is 
% 20 % more than the mean torque.
% 
% Date: 21/10/2020
% 
% Name: Avva Sai Pranav
% 
% USN: PES1201800861

clc;
clear all;
%% 
% Intializing the given details:

P = 20
N1 = 1200
z1 = 16
i = 3
alpha = 20
%% 
% FInding the number of teeth in gear:

z2  = i*z1
%% 
% Finding the stress:

[S_d] = Table_12_7();
S_d1 = S_d;
S_d2 = S_d;
%% 
% Finding the lewis form factor:

[y1]=Lewis(z1)
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
S_es = 345;
Fen = S_es*b*Y*m;
K = 0.539;
Fen = Fen/1000
[Fw] = Eqn_12_15_a(K,Q,b,d1)
if Fw>Fd
    disp('Material is Safe against wear');
else
    disp('Material is not safe against wear');
end
%% 
% As the material is not safe against wear the BHN numbe r should be changed 
% using table 12.16