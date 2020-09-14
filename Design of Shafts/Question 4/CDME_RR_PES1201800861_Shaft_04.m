%% 
% Program for design of shaft, Problem Number 4.
% 
% Problem Statement:A shaft is mounted between bearings located 9.5 m apart 
% and transmits 10, 000 kW at 90 rpm. The shaft weighs 66,000 N has outside diameter 
% 450 mm and inner diameter 300 mm. Determine the stresses induced in the shaft 
% and the angular deflection between the bearings. Do not neglect the weight the 
% shaft. Take G = 80 kN/mm2 . 
% 
% Name: Avva Sai Pranav
% 
% USN : PES1201800861
% 
% Date : 14/09/2020

clc;
clear all;
%% 
% Given Data: 
% 
% L = 9.5 m = 9,500 mm 
% 
% P = 10, 000 kN 
% 
% n = 90 rpm 
% 
% W = 66, 000 N 
% 
% d0 = 450 mm 
% 
% di= 300 mm

L = 9500
P = 1*10^4
n = 90
W = 66000
do = 450
di = 300
%% 
% Finding the k value

k = di/do
%% 
% Finding the value of torque.

T = Eqn_3_3_a(P,n)
%% 
% Consider the weight of the shaft, it is like UDL For simply supported beam 
% with UDL, we have :

M_max = (W*L)/8
%% 
% Finding the max stress and max shear using the theories.

[S_n, S_s] = Eqn_3_5_h(do,M_max,T,k)