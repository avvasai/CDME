%% 
% Program for Design of Belt Drive, Problem 2.
% 
% Problem Statement: Two pulleys 200mm in diameter and other 150mm in diameter 
% are connected by means of a crossbeltdrive, 2m apart. Find the length of belt 
% required and lap angle between each pulley and belt. If the larger pulley rotates 
% at 300 rpm, find power transmitted assuming maximum tension in belt as 1kN and 
% coeffecient of friction between belt and pulley as 0.3.
% 
% Name: Avva Sai Pranav
% 
% USN: PES1201800861

clc;
clear all;
%% 
% Intializing the diameters, distance between the centers, tensions and coeffecients 
% of frictions.

D1 = 200
D2 = 150
N1 = 300
C = 2e3
T1 = 1e3
mu = 0.3
%% 
% Finding the length of the belt:

[L] = Eqn14_2_c(D1,D2,C)
%% 
% Finding the angle of contact and velocity:

[tt] = Eqn14_2_a(D1,D2,C)
v=(pi*D1*N1)/(1000*60)
%% 
% Finding the power:

T2=T1/exp(mu*tt)
P=((T1-T2)*v)/1000