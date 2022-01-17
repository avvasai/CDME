%% 
% Program for Design of Springs, Problem 2 .
% 
% Problem Statement:
% 
% Problem Statement: It is required to design a helical compresion spring for 
% the valve mechanism. The axial force acting on the spring is 300 N when the 
% valve is open adn 150 N when the valve is closed. The length of the spring is 
% 30 mm when the valve is open and 35 mm when the valve is closed. The spring 
% is made of oil hardened and tempered valve spring wire and the limate tensile 
% strength is 1,370 N/mm2. The permissible shear stress for the spring wire should 
% be taken as 30% of the ultimate tensile strength.The modulus of rigity is 81,370 
% N/mm2. The spring is to be fitted over a valve rod and the minimum inside diameter 
% of the spring should be 20 mm. Design the spring and calcuate:
% 
% i) Wire diameter
% 
% ii) Mean coil diameter
% 
% iii)Number of active coils
% 
% iv) Total number of coils
% 
% v) Free length of the sprin
% 
% vi) Pitch of the coil
% 
% Assume the clearance between adjacent coils or clash allowance is 15% of the 
% deflection under the maximum load.
% 
% Date: 21/10/2020
% 
% Name: Avva Sai Pranav
% 
% USN: PES1201800861

clc;
clear all;
%% 
% Intialing the given data:

F_max = 300
F_min = 150
y_max = 35
y_min = 30
Di = 20
S_u = 1370
G = 81370
%% 
% Finding the wire diameter:

syms d
tau = 0.3*S_u
D = Di + d
K = 1
d=vpasolve(tau==(8*F_max*D*K)/(pi*d^3),d);
d=ceil(d(1))
%% 
% Finding the mean coil diameter:

D=Di+d 
C=D/d
[K] = Eqn11_2_a(C);
[tau_ind] = Eqn11_1d(F_max,D,K,d);
if tau_ind < tau
    disp("Design is safe")
else
    disp("Design is not safe")
end
%% 
% Finding the number of active coils:

F = F_max - F_min
y=y_max-y_min
[N]=Eqn11_5a_i(F,D,G,d,y)
N=ceil(N)
%% 
% Finding the number of coils:

[Nt,f] = Table_11_4(N)
%% 
% Finding the free length of the spring:

[y_act]=Eqn11_5_a(F_max,D,G,d,N);
S_L=Nt*d
T_ag=0.15*y_act;         
F_L=ceil(S_L+T_ag+y_act)
%% 
% Pitch of the coil:

p=ceil(F_L/(Nt-1))