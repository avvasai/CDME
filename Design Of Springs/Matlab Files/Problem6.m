%% 
% Program for Design of Springs, Problem 6 .
% 
% Problem Statement: A railway wagon moving at a velocity of 1.5 m/s is brought 
% to rest by a bumper consisting of two helical springs arranged in parallel. 
% The mass of the wagon is 15000 kg.. The sprngs are compressed by 150 mm in bringing 
% the wagon to rest. The sprin index can be taken as 6. The springs are made of 
% oil- hardened and tempered steel wire with ultimate tensile strength of 12500 
% N/mm^2 and modulusof rigidity of 81370 N/mm^2. The permissible shear stress 
% for the sprng wire can be taken as 50% of the ultimate tnesile strength. Design 
% th spring and calculate:
% 
% i) Wire diameter
% 
% ii) Mean coil diameter
% 
% iii) Number of active coils
% 
% iv) Total number of coils
% 
% v) SOlid length
% 
% vi) Free length
% 
% vii) pitch of the coil
% 
% viii) Require stifness of the spring
% 
% ix) Actual stifness of the spring
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

m = 1500
v = 1.5
y = 150
S_u = 1250
C = 6
G = 81370
%% 
% Finding the wire diameter:

KE=0.5*m*(v^2)*1e3;
syms F
E = 2*(0.5*F*y);
F=vpasolve(KE==E,F);
tau=0.5*S_u;
[K]=Eqn11_2a(C)
[d]=Eqn11_1d_d(F,C,K,tau);
[d]=Round(d)
%% 
% Finding the mean coil diameter:

D=C*d
%% 
% Finding the number of active coils:

[N]=Eqn11_5a_i(F,D,G,d,y)
N=ceil(N)
%% 
% Finding the total number of coils:

 [Nt,f] = Table_11_4(N)
%% 
% Finding the solid strength:

S_L=Nt*d
%% 
% Finding the free length of the spring:

[y_act]=Eqn11_5a(F,D,G,d,N)
g=2
T_ag=(Nt-1)*g
F_L=(S_L+T_ag+y_act)
[F_L]=ceil(F_L)
%% 
% Finding the pitch of the coil:

p=ceil(F_L/(Nt-1))
%% 
% Finding the required spring rate:

k=F/y
%% 
% Finding the actual spring rate:

k_act=ceil((G*d^4)/(8*D^3.*N))