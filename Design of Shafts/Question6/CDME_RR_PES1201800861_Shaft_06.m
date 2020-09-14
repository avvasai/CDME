%% 
% Program for design of shaft, Problem Number 6.
% 
% Problem Statement:A line shaft is to transmit 30 kW at 160 rpm. It is driven 
% by a motor placed directly below it by means of a belt running on a 1 m diameter 
% pulley keyed to the end of shaft. The tension on the tight side of the belt 
% is 2.5 times that on the slack side and the centre of the pulley overhangs 150mm 
% beyond the centre line of the end bearing. Determine the diameter of the shaft, 
% if the allowable shear stress is 60 N/mm2 and the pulley weighs 1600 N. Assume 
% minor shock conditions. 
% 
% Name: Avva Sai Pranav
% 
% USN : PES1201800861
% 
% Date : 13/09/2020

clc;
clear all;
%% 
% Given Data:
% 
% P = 30 kw
% 
% n =160rpm
% 
% d = 1000mm
% 
% r = 500mm
% 
% 𝑇1 = 2.5𝑇2
% 
% Tu_all = 60 N/mm^2

P = 30;
n =160;
d_pulley = 1000;
r = d_pulley/2;
W = 1600;
L = 150;
Tu_all = 60;
Tu_max = Tu_all;
%% 
% Finding the toruque for given power:

T = Eqn_3_3_a(P,n)
%% 
% For a belt drive:
% 
% T = (T1-T2)xr

syms T1_temp  T2_temp;
eqn = [T1_temp ==2.5*T2_temp , T == (T1_temp - T2_temp)*r]
T_sol = solve(eqn,[T1_temp,T2_temp]);
T1 = T_sol.T1_temp
T2 = T_sol.T2_temp
%% 
% Total load acting on the shaft = total belt tension + weight of the pulley

F = T1 + T2 + W
%% 
% Find the Moment of the shaft

M = -F*L
M_max = M;
%% 
% Using the table for loads we get:

Cm = 2;
Ct = 1.5;
%% 
% Using the maximum shear stress theory.
% 
% Maximan stress is taken as one for the sake of the function to short circuit. 
% zero could be given but it would yield and inf value.

S_max = 1
[d_n, d_s] = Eqn_3_6(1,Tu_max,M_max,T,Cm,Ct);
d = d_s
%% 
% Find the standard diameter from the table:

d = Table_3_5_a(d)