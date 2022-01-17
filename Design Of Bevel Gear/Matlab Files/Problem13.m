%% 
% Program for Design of Bevel Gear, Problem 13.
% 
% Problem Statement: A pair of 20 degrees full depth ivolute teeth bevel gear 
% connects two shafts at right angles having velocity ratio 3:1. The gear is made 
% of cast steel, 0.20% untreated and the pinion material is of steel, C30 heat 
% treated. The pinion has 20 numbers of teeth and transmits 40 kW at 750 rpm. 
% 
% Determine:
% 
% i. Module
% 
% ii. Face Width
% 
% iii. Pitch diameter.
% 
% Assume width of gear face as 1.3rd of the length of pitch
% 
% Date: 27/10/2020
% 
% Name: Avva Sai Pranav
% 
% USN: PES1201800861

clc;
clear all;
%% 
% Intializing the given data:

alpha = 20
theta = 90
ii = 3
z1 = 20
P = 40 
N1 = 750
Cv = 0.5
%% 
% Finding the number of teeth on gear and rpm of the gear respectively:

z2 = z1*ii
N2 = N1/ii
%% 
% Finding the delta values for pinion and gear using equation 12.32(a) and 12.32 
% (b):

del_p = Eqn_12_32_a(ii)
del_g = Eqn_12_32_b(ii)
%% 
% Finding the lewis form factor:

ze = Eqn_12_25_d(z1,del_p);
zep = ze
ze = Eqn_12_25_d(z2,del_g);
zeg = ze
[y1]=Lewis(zep)
[y2]=Lewis(zeg)
%% 
% Finding the design stress using table 12.7:

[S_d] = Table_12_7()
S_d1 = S_d;
[S_d] = Table_12_7()
S_d2 = S_d;
%% 
% Find the strength factor, find the weaker part and deciding what the design 
% is based on:

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
% Finding the torque:

Mt = ((9.55*10^6*P)/(N2))
%% 
% Finding the module:

m = module(Mt,S_d,Cv,Y,z1,z2,z);
m = Table_12_24(m)
%% 
% Finding the pitch diameter of pinion and gear using Equation 12.1(e) respectively 
% :

d1 = m*z1
d2 = ii*d1
%% 
% Finding the core distance(L):

L = (1/2)*sqrt(d1^2+d2^2)
%% 
% Finding the face width using equation 12.36(b):

b = L/3
%% 
% Finding the velocity and the 

v = (pi*d2*N2)/(60)
Cv = ((6.1)/(6.1+v))
%% 
% FInding the tangential force using Equation 12.38(b):

Ft = ((1000*P)/(v))
%% 
% Finding the design stress induced and if it lies between the permissible values:

S_di = (Ft/(m*Cv*b*Y))*(L/(L-b))
if S_di < S_d
    disp("The calculated values lie between the permissible values");
else
    disp("The calculated values lies outside the permissible values");
end