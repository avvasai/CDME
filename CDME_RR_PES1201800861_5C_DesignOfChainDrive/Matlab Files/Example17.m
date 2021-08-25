%% 
% Program for Design of Chain Drive, Problem 3.
% 
% Problem Statement: A 15kW, 1100 rpm motor drives a line shaft at 200 rpm. 
% The shaft center distance is approximately 600 mm, The motor shaft has a diameter 
% of 50 mm. The starting torque on motor is  times  the running torque. The load 
% is applied with moderate shocks. Select a suitable roller chain drive. 
% 
% Date: 26/09/2020
% 
% Name: Avva Sai Pranav
% 
% USN: PES1201800861

clc;
clear all;
%% 
% Intializing the given values:

P = 15
N1 = 900
N2 = 225
C1 = 600
d1 = 50
%% 
% Finding the velocity ration and the number of teeth:

i = N1/N2;
[z2,z1] = Table_14_36_a(i)
%% 
% Finding the pitch:

[p] = Eqn14_22b(N1);
[p1,W,Fu] = Table_14_39_b(p)
%% 
% Finding the PCD of sprockets

D1 = p1/(sind(180/z1));
D2 = p1/(sind(180/z2));
%% 
% Finding the velocity of the chain and the tangential force:

[v] = Eqn14_22a(p1,z1,N1)
Mt = (P*60)/(2*pi*N1)
Mtmax = 2*Mt*10^3
F = (2*Mtmax*1000)/d1
%% 
% Finding the allowable lworking load per strand:

[Ks] = Table_14_35()
FS = 13.45         
[Fw] = Eqn14_22e(Fu,FS,Ks)
%% 
% Finding the number of strands and then finding the actual factor of safety:

j = ceil(F/Fw)
Fc = (W*(v^2))/9.81
%% 
% Finding the horizontal drive:

K2 = 6;             
Fs = K2*W*(C1/1000);
FS_actual = j*(Fu/(F+Fc+Fs))*1000;
fprintf('Fs_actual:%f \n',FS_actual);
if FS_actual>FS
    disp('Chain is Safe');
else
    disp("Chain is unsafe");
end
%% 
% Finding the chain length in pitches:

Cp = C1/p;
alpha = asind((D2-D1)/(2*C1))
[Lp] = Eq14_22_k(z1,z2,Cp,alpha)
%% 
% Finding the chain length from its pitch:

L = p*Lp
%% 
% Finding the exact center distance:

[Ce] = Eqn14_22_kCe(Lp,z1,z2,alpha,p);
Ce = Ce/2