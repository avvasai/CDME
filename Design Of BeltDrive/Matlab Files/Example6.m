%% 
% Program for Design of Belt Drive, Problem 6.
% 
% Problem Statement: A horizontal drive is required to drive a compressor by 
% means of an electric motor, select suitable flat belt drive from the following 
% details: Power = 6 kW
% 
% Slip = 2.5%
% 
% Speed of motor pulley = 1,400 rpm
% 
% Service factor = 1.2
% 
% Working stress = 2 Mpa
% 
% Speed of compressor = 500 rpm
% 
% Date: 25/09/2020
% 
% Name: Avva Sai Pranav
% 
% USN: PES1201800861

clc;
clear all;
%% 
% Intalizing the following details:

P = 6
E = 0.025
N = 1400
n = 500
Cs = 1.2
S_d = 2
eta = 0.9
%% 
% Finding the power using service fator.

Pd = P*Cs
%% 
% Finding the diameter of the smaller pulley and standrdizing it:

Wmax = (2*pi*N)/60
D2 = 630*((Pd/Wmax)^(1/3))
D2 = Table_14_13_b(D2)
%% 
% Finding the diameter of the driven pulley and standardizing it:

i = N/n
D1 = (1-E)*D2*i;
D1 = Table_14_13_b(D1)
%% 
% Finding the belt speed:

v = (pi*D2*N*(1-E))/(1000*60)
%% 
% Finding the distance between the centers of the pulleys:

C = 2*(D1+D2)
%% 
% Find the coefficient of friction using Barths Formla:

[mu]=Barths_Formula(v)
%% 
% Finding the length of the belt:

[L]= Eqn14_2b(C,D1,D2)
%% 
% Finding the angle of Contact:

tt_l = pi + (D1-D2)/C
tt_s = pi - (D1-D2)/C
%% 
% Finding the width of the belt when the design is based on the pulley i.e mu*theta_s

t = 0.02*D2;
roh=1000;
g=9.81;
[b]=Eqn14_5a_b(P,S_d,t,v,roh,g,mu,tt_s);
[b] = Table(b)
%% 
% Finding the centrifugal tension:

[Tc] = Eqn14_3_e(b,t,v)
syms T1 T2 To
%% 
% Finding the tensions at each pulley:

E = [(T1-T2)==(Pd*1000./v),(T1-Tc)/(T2-Tc)==exp(mu*tt_s)]
S = solve(E,T1,T2);
To = (((vpa(S.T1))^0.5 + (vpa(S.T2))^0.5)/2)^2
%% 
%