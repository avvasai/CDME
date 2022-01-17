%% 
% Program for Design of Springs, Problem 8 .
% 
% Problem Statement: A safety valve operated by a helical tension spring through 
% a leverl mecanism is chematically illustraed. The diameter of the valve is 50 
% mm. In normal operating conditions, the vlave is closed and pressure inside 
% is the chamber is 0.5 N/mm^2. The vlave is opened when the pressure inside the 
% chamber increases to 0.6N/mm^2. The maximum lift of the valve is 5mm. The spring 
% index can be taken as 8. The spring is made of patented and cold-drawn steel 
% wire with the ultimate tensile strength of 1200 N/mm^2 and the modulus of rigidit 
% of 81360 N/mm^2. The permissible shear stress for the spring wire can be taken 
% as 30% of the ultimate tensile strength.
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

d1 = 75
d2 = 150
D = 50
Pc=0.5
Po=0.6
ymax=5
S_u = 1200
C = 8
G = 81370
%% 
% FInding the wire diameter under the following conditions:
% 
% i)When the valve is closed:

Pvc=(pi/4)*D^2.*Pc
Psc=d1*Pvc/d2
%% 
% ii) When the valve si closed:

Pvo=(pi/4)*D^2.*Po
Pso=d1*Pvo/d2
y=ymax*d2/d1
k=(Pso-Psc)/y
F=max(Psc,Pso)
tau=0.3*S_u
[K]=Eqn11_2a(C)
[d]=Eqn11_1d_d(F,C,K,tau);
[d]=ceil(d)
%% 
% Finding the mean coil diameter:

D = C*d
%% 
% Finding the number of active coils:

N=(G*d^4)/(8*k*D^3)
N=ceil(N)