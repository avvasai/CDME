%% 
% Program for Design of Springs, Problem 1 .
% 
% Problem Statement: It is required to design a helical spring subjected to 
% a max force of  1250 N. The deflection of the spring corresponding to the ma 
% force should be approximately 30mm. The spring index can be taken as 6. The 
% spring is made of patented and cold-draw steel wire. The ultimate tensile strength 
% and modulus of rigidity of the spring material are 1090 and 81370 N/mm^2 respectively. 
% The permissible shear stress of the spring material shoud be taken as 50% of 
% the ultimate tensile strength. Design the spring and calculate:
% 
% i) Wire diameter
% 
% ii) Mean Coil diameter
% 
% iii) Number of active coils
% 
% iv) Total number of coils
% 
% v) Free length of the spring
% 
% vi) Pitch of the coil
% 
% Date: 21/10/2020
% 
% Name: Avva Sai Pranav
% 
% USN: PES1201800861

clc;
clear all;
%% 
% Intializing the known values:

F = 1250
y = 30
S_u = 1090
C = 6
G = 81370
%% 
% Finding the wire diameter:

tau=0.5*S_u
[K] = Eqn11_2_a(C)
[d]=Eqn11_1d_d(F,C,K,tau);
d=ceil(d)
%% 
% Finding the mean coil diameter:

D = C*d
%% 
% Finding the number of active coils:

[N]=Eqn11_5a_i(F,D,G,d,y);
N=ceil(N)
%% 
% Finding the toal number of coils:

[Nt,f] = Table_11_4(N)
%% 
% Free length of the spring:

[y_act]=Eqn11_5_a(F,D,G,d,N)
S_L=Nt*D
gap=1
T_ag=(Nt-1)*gap
F_L=ceil(S_L+T_ag+y_act)
%% 
% Finding the pitch of the coil:

p = F_L/(Nt-1)