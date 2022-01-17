%% 
% Program for Design of Spur Gear, Problem 2.
% 
% Problem Statement: A pair of spur gears has to transit 20 kW from a shaft 
% rotating at 1,000 rpm to a parallel shaft which is to rotate at 310 rpm. Number 
% of teeth on pinion is 31 with 20 degree full depth involute tooth form. The 
% material for pinion is steel SAE 1040 untreated with allowable static stress 
% 206.81 MPa and the material for the gear is cast steel 0.20% C untreated with 
% allowable static stress 137.34 MPa. Determine the module and face width of the 
% gear pair. Also find the dynamic tooth load on the gears. Take the service factor 
% as 1.5.
% 
% Date: 20/10/2020
% 
% Name: Avva Sai Pranav
% 
% USN: PES1201800861

clc;
clear all;
%% 
% Intializing the known data from the quesiton:

P = 20
N1 = 1000
N2 = 310
z1 = 31
alpha =20
S_d1 = 206.81
S_d2 = 137.34
Cs = 1.5
%% 
% Finding the velocity ration and the number of teeth:

i = N1/N2
z2 = i*z1
%% 
% Finding the lewis form factor:

[y1]=Lewis(z2)
[y2]=Lewis(z2)
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
% Trial 1:
% 
% Assuming m and standardizing it:

Mt = ((P*60)/(2*pi*N2))*10^3;
k = 10;
Cv = 5;
m = 3.4;
[m] = Tb12_2_1a(m)
%% 
% Finding the PCD of pinion and gear respectively:

d1 = m*z1
d2 = m*z2
b = 10*m
%% 
% Finding the velocity and identifying the Cv value:

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
%% 
% Finding the tangential force:

Ft = (2*Mt*Cs*1000)/(d2)
%% 
% Verifying if the values found are satifactory:

S_d22 = Ft/(pi*Cv1*b*y2*m*10^3);
if S_d22 >S_d2
    disp('Values are not satisfactory');
else
    disp('Values are satisfactory');
end
%% 
% As the values are satisfactory, no futher trials required.
%% 
% Finding the dynamic load:

K3 = 20.67
e1 = Table_12_14(v)
e = 0.04
k1 =8.7;
C = 457.8
C = (C*e1)/e 
[Fd] = Eqn_12_12(Ft,K3,v,C,b);
Fd = Fd*10^-3