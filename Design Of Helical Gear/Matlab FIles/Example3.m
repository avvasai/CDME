%% 
% Program for Design of Helical Gear, Problem 3.
% 
% Problem Statement: A pair of helical gears is to transmit 15 kW. The teeth 
% re 20 degree stub in diametral plane and have a helix angle of 45 degree . The 
% pinion runs at 10000 rpm and has 80 mm pitch diameter. The gear has a pitch 
% diameter of 320 mm. If the gears are made of cast steel having allowable static 
% strength of 100 MPa; determine module and face width from static strength considerations 
% and check the gears for wear, given stress endurance is 618 MPa.
% 
% Date: 18/10/2020
% 
% Name: Avva Sai Pranav
% 
% USN: PES1201800861

clc;
clear all;
%% 
% Intializing the given :

P = 15
alpha = 20
beta = 45
N_p = 1e4
d_p = 80
d_g = 320
S_p = 100
S_g = S_p
S_es = 618
%% 
% Finding the velocity ratio and the virtual number of teeth:

i = d_g/d_p
z_p = 20
z_g = i*z_p
z_ep = Eqn_12_22_a(z_p,beta)
%% 
% Finding the strength factor and dependent of pinion and gear:

SF_p = S_p*Eqn_12_5_e(z_p)
SF_g = S_g*Eqn_12_5_e(z_g)
SF_min = min(SF_p,SF_g)
%% 
% Finding the module:

v = (pi*d_p*N_p)/(60*1000)
Cv = Eqn_12_25(v)
Cs = 1
Ft = Eqn_12_7_a(P,Cs,v)
y = Eqn_12_5_e(z_ep)
Y = pi*y
%% 
% Assuming k and Cw referring table 12.21:

syms b m_n
k = b/m_n
k = 15
Cw = 1.15
%% 
% Find the module:

m_n = Eqn_12_24_b(Ft,Cw,S_p,Cv,k,Y)
m_n = Table_12_2(m_n)
%% 
% Find the nuber of teeth in pinion:

z_p = Eqn_12_19_d(d_p,beta,m_n)
%% 
% Finding the number of teeth on gear:

z_g = i*z_p
%% 
% Finding the virtual number of teeth:

z_ep = Eqn_12_22_a(z_p,beta)
z_eg = i*z_ep
%% 
% Finding the face width and verifying the claculated value is safe or not:

b = ceil(k*m_n)
b_min = Eqn_12_23_b(m_n,beta)
if b>b_min
    disp('Calculated value for b is safe')
else
    disp('Calculated value for b is not safe')
end
%% 
% Finding the dynamic tooth load from table 12.12 for cast steel:

K3 = 20.67;
e = Table_12_14(v)
m_n = Table_12_2(m_n)
C = 474.6
Fd = Eqn_12_26_a(v,C,Ft,K3,b,beta)
%% 
% Limiting load for wear and verifying if its in the permissible limits or not:

E1 = 2.1*1e5;
E2 = E1;
Fw = Eqn_12_26_c(S_es,alpha,E1,E2,d_p,d_g,b,beta)

if Fw>Fd
    disp('The material is safe against wear')
else 
    disp('The material is not safe against wear')
end