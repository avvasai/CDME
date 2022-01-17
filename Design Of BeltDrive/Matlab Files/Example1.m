%% 
% Program for Design of Belt Drive, Problem 1.
% 
% Problem Statement: The layout of a leather belt drive transmitting 15kW of 
% power is shown in Figure 1. THe centre distance between the pulleys is twice 
% the diameter of the bigger pulley. The belt should operate at a belcoity of 
% 20 m/s approximately and the stresses in the belt should not exceed 2.25 N/mm^2. 
% The desnity of leather is 0.95 g/cc and the coefficient of friction is 0.35. 
% The thickness of the belt is 5 mm. Calculate:
% 
% i. The diameter of pulleys
% 
% ii. THe length and widht of the belt
% 
% iii. The belt tensions
% 
% Date: 24/09/2020
% 
% Name: Avva Sai Pranav
% 
% USN: PES1201800861

clc;
clear all;
%% 
% Intializing the following values in the respective order:  Power, velocity 
% of the belt,  stress in the belt, thickness of the belt, density of the leather, 
% coefficient of friction and speed of rotation of smaller and larger pulley.

P = 15
v = 20
S = 2.25
t = 5
roh = 950
mu = 0.35
N2 = 480
N1 = 1440
%% 
% Finding the diameter of the smaller pulley and standardization:

D2 = ((v*60*1000)/(pi*N1))
D2 = Table_14_13_b(D2)
%% 
% Finding the diameter of the larger pulley and the center distance between 
% the two pulleys.

D1 = ((D2*N1)/(N2))
C = 2*D1
%% 
% Finding the total length using Equation 14.2(b). Also to find the actual velocity.

[L]=Eqn14_2b(C,D1,D2)
V=(pi*(D2+t)*N1)/(60*1000)
%% 
% Using equation 14.1a and 14.5_a_b:

[tt_s]=Eqn14_1_a(D1,D2,C)
g=9.81;
[b]=Eqn14_5a_b(P,S,t,V,roh,g,mu,tt_s)
%% 
% Standardizing table 14.9 (a)

b = Table_14_9_a(b)
%% 
% Solving the equation to find T1 and T2:

syms T1 T2
Tc=(roh*b*t*(V^2))/(1e6);
eqns=[ (((T1-T2)*V)/1000)==(P) , ((T1-Tc)/(T2-Tc))==exp(mu*tt_s)];
Solve=vpasolve(eqns);
%% 
% Printing out the answers:

fprintf("The diameter of the smaller pulley = %f mm\n",D2)
fprintf("The diameter of the larger pulley = %f mm\n",D1)
fprintf("The Length of the belt = %f mm\n",L)
fprintf("The Width of the belt = %f mm\n",b)
fprintf("Tension on the Tight Side = %f N\n",Solve.T1)