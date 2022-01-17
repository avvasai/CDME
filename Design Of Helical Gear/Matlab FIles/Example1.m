%% 
% Program for Design of Helical Gear, Problem 1.
% 
% Problem Statement:A pair of parallel helical gears consists of a 20 teeth 
% pinion mesing with a 40 teeth gear. THe helix angle is 25 degrees and the normal 
% pressure angle is 20 degrees. THe normal module is 3mm. Calculate:
% 
% a. The transverse module
% 
% b. The transverse pressure angel 
% 
% c. The axial pitch
% 
% d. The pitch circle diameters of the pinion and the gear
% 
% e. The centre distance
% 
% f. The addendum and dedendum circle diameterds of the pinion
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

z_p = 20
z_g = 40
m_n = 3
beta = 25
alpha_n = 20
%% 
% The transverse module in mm using Equation 12.19 ( c ):

[m] = Eqn_12_19_c(m_n,beta)
%% 
% The transverse pressure angle in degree using Equation 12.22 (b):

[alpha] = Eqn_12_22_b(alpha_n,beta)
%% 
% Finding the axial pitch:

p = pi*m
p_a = p/tand(beta)
%% 
% Pitch circle diameter of the pinion gear:

d_p = Eqn_12_19_e(z_p,m_n,beta)
%% 
% Pitch circle diameter of the gear :

d_g = Eqn_12_19_e(z_g,m_n,beta)
%% 
% Finding the center distance :

a = Eqn_12_20(z_p,z_g,m_n,beta)
%% 
% Finding the addendm circle diameter of the pinion:

d_ap = m_n*((z_p/cosd(beta))+2)
%% 
% Finding the dendendum circle diameter of the pinion:

d_dp = m_n*((z_p/cosd(beta))-2.5)