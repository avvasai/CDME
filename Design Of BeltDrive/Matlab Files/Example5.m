%% 
% Program for Design of Belt Drive, Problem 4.
% 
% Problem Statement: An electric motor is to drive an exhaust fan by means of 
% a flat leather belt. The following data is known: Motor pulley and Fan pulley 
% diameter 400 mm and 1200 mm respectively. The angle of contact is 2.5 radians 
% and 3.5 radians. Coefficient of friction is 0.3 and 0.25. The speed is 900 rpm 
% while the power to be transmitted is  25 kW. The thickness of the belt is 6mm 
% and the maximym permssible stress is 2.1 MPa. Take density as 1000 kg/m^3. Find 
% the width of the belt.
% 
% Date: 25/09/2020
% 
% Name: Avva Sai Pranav
% 
% USN: PES1201800861

clc;
clear all;
%% 
% Intializing the known values for the motor(1) and fan pulley(2):

P=25           
D1=400
D2=1200
N1=900
t=6
mu_1=0.3
mu_2=0.25
roh=1000
g=9.81
S_d=2.1
tt_1=2.5
tt_2=3.75
%% 
% Finding the velocity:

N2=(D1*N1)/D2
V=(pi*(D2+t)*N2)/(60*1000)
%% 
% As the coefficient of friction is varying for both the pulleys, the width 
% of the belt is dependent on the smaller value of mu*tt(angle of contact).
% 
% 
% 
% Hence we find the width using equation 14.5ab and standardize it using values 
% from Table 14.9a

if (mu_1*tt_1)<(mu_2*tt_2)
    fprintf("Design is based on motor pulley\n")
    [b]=Eqn14_5a_b(P,S_d,t,V,roh,g,mu_1,tt_1)
else
    fprintf("Design is based on fan pulley\n")
    [b]=Eqn14_5a_b(P,S_d,t,V,roh,g,mu_2,tt_2)
     b = Table_14_9_a(b)
end