%% 
% Program for Design of Helical Gear, Problem 4.
% 
% Problem Statement:The following data refers to the design of a helical gear 
% drive: 
% 
% i. Power transmitted 34 kW at 2,800 rpm of pinion
% 
% ii. Speed ratio 4.5, number of teeth on pinion 18
% 
% iii. Helix angle 250 , pressure angle α = 200 stub 
% 
% iv. Material for both pinion and gear is medium carbon steel whose allowable 
% stress may be taken as 230 MPa
% 
% v. Pinion diameter is limited to 120 mm Determine the axial thrust on the 
% shaft and check the gears for dynamic and wear loads  
% 
% Date: 18/10/2020
% 
% Name: Avva Sai Pranav
% 
% USN: PES1201800861

clc;
clear all;
%% 
% Intalizing the given values:

P = 34   
N_p = 2800 
z_p = 18  
i = 4.5  
alpha = 20
beta = 25
d_p = 120  
S_p = 230
S_g = S_p
S_es = 618
%% 
% Finding the gear diameter and the teeth on gear:

d_g = i*d_p
z_g = i*z_p
z_ep = Eqn_12_22_a(z_p,beta)
%% 
% Finding the strength factor deciding on if the design is based on pinion or 
% gear:

SF_p = S_p*Eqn_12_5_e(z_p)
SF_g = S_g*Eqn_12_5_e(z_g)
SF_min = min(SF_g,SF_p)
%% 
% Finding the module:

v = (pi*d_p*N_p)/(60*1000)
Cv = Eqn_12_25(v)
Cs = 1
Ft = Eqn_12_7_a(P,Cs,v)
%% 
% Finding the axial thrust on the shaft:

Fa = Ft*tand(beta)
y = Eqn_12_5_e(z_ep);
Y = pi*y;
syms b m_n
%% 
% Assuming k = 15 and Cw =1.5 reffering to table 12.21 wear and lubrication 
% factor:

k = b/m_n
k = 15
Cw = 1.15
m_n = Eqn_12_24_b(Ft,Cw,S_p,Cv,k,Y)
e = Table_12_14(v)
[C] = Table_12_12_1(e)
%% 
% Finding the face width and verifying its under permissible limits for safety:

b = ceil(k*m_n)
b_min = Eqn_12_23_b(m_n,beta)
if b>b_min
    disp('Calculated value for b is safe')
else
    disp('Calculated value for b is not safe')
end
%% 
% Finding the dynamic tooth load:

K3 = 20.67
Fd = Eqn_12_26_a(v,C,Ft,K3,b,beta)
%% 
% Finding the limiting load for wear and verfying if its in permissible limits:

E1 = 2.1*1e5
E2 = E1
Fw = Eqn_12_26_c(S_es,alpha,E1,E2,d_p,d_g,b,beta)
if Fw>Fd
    disp('The material is safe against wear')
else
    disp('The material is not safe against wear')
end