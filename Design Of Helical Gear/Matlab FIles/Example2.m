%% 
% Program for Design of Helical Gear, Problem 2.
% 
% Problem Statement: A helical gear of 250 mm diameter transmits a torque of 
% 200 N-m. The pressure angle in a plane normal to the teeth is 20 degrees . The 
% helix angle is 45 degrees. Determine the gear tooth loads. 
% 
% 
% 
% Date: 18/10/2020
% 
% Name: Avva Sai Pranav
% 
% USN: PES1201800861

clc;
clear all;
%% 
% Intializing the given data:

d = 250
Mt = 200*1e3
alpha_n = 20
beta = 45
%% 
% Tagential force, axial force and radial component in Newtons is found using 
% the figure 12.7:

[Ft,Fa,Fr] = Figure_12_7(Mt,d,beta,alpha_n)
%% 
%