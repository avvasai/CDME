%% 
% Program for Design of Springs, Problem 7 .
% 
% Problem Statement:An automotive single plate clutch consists of two pairs 
% of friction surfaces, one between the friction lining and the prssure plate 
% and te other between the friction lining and the flywheel as shown in figure 
% 3. Eight identical helical compression srings, arranged in parallel, provide 
% the reqired axial thrust on the friction surface. The total spring force exerted 
% by all springs is 2400 N and the corresponding deflection of each spring is 
% approximately 15 mm. The spring index can be taken as 8. The springs are made 
% of patented and cold-drawn steel wire with ultimate tensile strength of 1390 
% N/mm2and tmodulus of rigidity of 8130 N/mm^2. The permissible shear stress for 
% the spring wire can be take as 30% of the ultimate tensile strength.
% 
% Date: 21/10/2020
% 
% Name: Avva Sai Pranav
% 
% USN: PES1201800861

clc;
clear all;
%% 
% Intializing the given data:

F = 2400
y = 15
S_u = 1390
C = 8
G = 81370
%% 
% Finding the wire diameter:

F = F/8
tau = 0.3*S_u
[K] = Eqn11_2_a(C)
[d] = Round(Eqn11_1d_d(F,C,K,tau))
%% 
% Finding the mean coil diameter:

D = C*d
%% 
% Finding the number of active coils:

[N]=ceil(Eqn11_5a_i(F,D,G,d,y))
%% 
% Finding the total number of coils:

[Nt,f] = Table_11_4(N)
%% 
% Finding the solid length:

S_L = Nt*d
%% 
% Finding the free length of the spring:

[y_act]=Eqn11_5a(F,D,G,d,N)
g=1
T_ag=(Nt-1)*g
F_L=(S_L+T_ag+y_act)
[F_L]=ceil(F_L)
%% 
% Finding the pitch of the coil:

p = F_L/(Nt-1)
%% 
% Finding the required spring rate:

k = F/y
%% 
% Finding the actual spring rate:

k_act=(G*d^4)/(8*D^3.*N)