%% 
% Program for Design of Springs, Problem 5 .
% 
% Problem Statement: A helical tension lspring is  used in the spring balance 
% to measure the weights. One end of the sprinh is attached to the rigid support 
% while the other end, which is frem carries the weights to be measured. The maximum 
% weight attached to the spring balance is 1500 N and the length of the scale 
% should be approximately 100 mm. The spring index can be taken as 6. The spring 
% is made of oil hardened and tempered steel wire with ultimate tensile strength 
% of 1360 N/mm2 and modulus of rigidty of 81,370 N/mm^2. The permissible shear 
% stress in the spring wire should be taken as 50% of te ultimate tensile strength. 
% Desing the spring and calculate:
% 
% i) Wire diameter
% 
% ii) Mean coil diameter
% 
% iii) Number of active coils
% 
% iv) Required spring rate 
% 
% v) Actual pring rate.
% 
% Date: 21/10/2020
% 
% Name: Avva Sai Pranav
% 
% USN: PES1201800861

clc;
clear all;
%% 
% Intializing the given values:

F = 1500
C = 6
S_u = 1360
G = 81370
y = 100;
%% 
% Finding the wire diameter:

tau=0.5*S_u
[K]=Eqn11_2a(C)
[d]=Eqn11_1d_d(F,C,K,tau)
d=ceil(d)
%% 
% Finding the coil diameter:

D = C*d
%% 
% Finding the number of active coils:

[N]=Eqn11_5a_i(F,D,G,d,y);
N=ceil(N)
%% 
% Finding the spring rate:

k = F/y
%% 
% Finding the actual spring rate:

k_act = ((G*d^4)/(8*(D^3)*N))