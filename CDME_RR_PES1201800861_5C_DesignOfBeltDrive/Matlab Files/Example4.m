%% 
% Program for Design of Belt Drive, Problem 4.
% 
% Problem Statement: A flat belt is required to transmit 25 kW from apulley 
% 1 m effective diameter at 400 rom. THe angle of contact spread over 11/24 of 
% the circumference. If thickness of the belt is 8 mm, mu = 0.25, r = 1,000 kg/m^3 
% and working stress = 3 MPa, determine the width of the belt required
% 
% Date: 24/09/2020
% 
% Name: Avva Sai Pranav
% 
% USN: PES1201800861

clc;
clear all;
%% 
% Intializing the known variables:

P = 25;
D = 1000
N = 400
t = 8
mu = 0.25
roh  = 1000
g = 9.81
S_d = 3
%% 
% Finding the angle of contact:

tt = ((11*2*pi)/24)
%% 
% Finding the velocity of the belt:

V = ((pi*(D+t)*N)/(60*1000))
%% 
% Finding the width of the belt using Equation 14.5ab:

[b] = Eqn14_5a_b(P,S_d,t,V,roh,g,mu,tt)