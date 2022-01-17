%% 
% Program for Design of Helical Gear, Problem 5.
% 
% Problem Statement : Design pair of equal diameter 20 degrees stub teeth helical 
% gears to transmit 37.5 kW with moderate shocks at 1200 rpm. The two shafts are 
% parallel and 0.45 m apart. Each gear is made of steel with β = 30 degrees
% 
% Date: 19/10/2020
% 
% Name: Avva Sai Pranav
% 
% USN: PES1201800861

clc;
clear all;
%% 
% Intialization of the given data:

P = 37.5
alpha = 20
a = 0.45
%% 
% Finding the velocity ratio:

syms d1 d2 z1 z2
d1 = d2
i = d2/d1
beta = 30
N1 = 1200
N2 = i*N1
%% 
% Finding the virtual number of teeth:

z_p = 20
z_g = i*z_p
z_ep = Eqn_12_22_a(z_p,beta)
%% 
% Finding the module: 

Mt = (60*P*1e6)/(2*pi*N1);
Cw = 1.15;
Cv = 0.5;
syms b m_n
k = b/m_n
k = 15;
m_n = (a*cosd(beta)*2)/(z_p + z_g)
%% 
% FInding the diameter of both motor and compressor gears:

d_p = Eqn_12_19_e(z_p,m_n,beta)
d_g = i*d_p
%% 
% Finding the face width and verfying if its within safe permissible stress:

b = k*m_n
b_min = Eqn_12_23_b(m_n,beta)
if b>b_min
    disp('Calculated value for b is safe')
else
    disp('Calculated value for b is not safe')
end
%% 
% Finding the stress inuced and verfying it they are satisfactory:

y = Eqn_12_5_d(z_ep)
Y = pi*y;
S_d = (2*Mt*Cw*cosd(beta))/(m_n^3*Cv*k*Y*z_p)
v = (pi*d_p*N1)/(60*1000)
Cv = Eqn_12_25(v)
Cs =1;
Ft = ((2*Mt)/d_p)*Cs;
S_ind = Eqn_12_24_a(Ft,Cw,Cv,b,Y,m_n)
if S_ind < S_d
    disp('The assumed values are satisfactory')
else
    disp('The assumed values are not satisfactory')
end
%% 
% Dynamic tooth load:

K3 = 20.67;
e = Table_12_14(v)
[C] = Table_12_12_1(e)
Fd = Eqn_12_26_a(v,C,Ft,K3,b,beta)
%% 
% Dynamic strength of the gear and verfying if its sage against static tooth 
% load:

Fs = Eqn_12_26_b(S_d,b,Y,m_n)
if Fs >= Fd
    disp('The material is safe against static tooth load')
else
    disp('The material is not safe against static tooth load')
end
%% 
% Find the transverse module and normal pressure angle:

[m] = Eqn_12_19_c(m_n,beta)
[alpha_n] = Eqn_12_22_b(alpha,beta)
%% 
% Finding the axial pitch:

p = pi*m;
p_a = p/tand(beta)
%% 
% Finding the addendum circle diameter and the dedendum circle diameter  of 
% the pinion:

d_ap = m_n*((z_p/cosd(beta))+2)
d_dp = m_n*((z_p/cosd(beta))-2.5)
%% 
% Finding the tangential, axial and radial force components on the gear i.ie 
% gear tooth loads:

[Ft,Fa,Fr] = Figure12_7(Mt,d_p,beta,alpha_n);
eval(Ft)
eval(Fa)
eval(Fr)