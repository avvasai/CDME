%% 
% Program for Design of Spur Gear, Problem 3.
% 
% Problem Statement: In a spur gear arrangement, a pinion made of cast steel 
% is rotating at 900 rpm and is driving a cast iron gear at 150rpm. The teeth 
% are to have standard 20 degree stub involute profiles and the maximum power 
% to be transmitted is 25 kW. Determine the module and face width. Find the dynamic 
% and wear load also. The pinion has 16 teeth with surface hardness of 250 BHN, 
% take static stress for pinion as 103 MPa and for gear as 55 MPa. Assuming Ep 
% = 96 GN/m^2 and Eg = 207 GN/m^2
% 
% Date: 20/10/2020
% 
% Name: Avva Sai Pranav
% 
% USN: PES1201800861

clc;
clear all;
%% 
% Intializing the given data from the question:

N1 = 900
N2 = 150
alpha = 20
P = 25
z1 = 16
S_d1 = 103
S_d2 = 55
Ep = 96*10^3
Eg = 207*10^3
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
e = Table_12_14(v)
k1 =8.7;
C = e/(k1*(Ep^-1 + Eg^-1))
[Fd] = Eqn_12_12(Ft,K3,v,C,b);
Fd = Fd*10^-3
%% 
% Finding the Wear and finding if the material is safe against wear:

[Q] = Eqn_12_15_c(z1,z2)
S_es = 617.8;
[K] = Eqn_12_15_b(S_es,alpha,Ep,Eg);
[Fw] = Eqn_12_15_a(K,Q,b,d1)
if Fw>Fd
    disp('Material is Safe against wear');
else
    disp('Material is not safe against wear');
end