%% 
% Program for Design of Chain Drive, Problem 1.
% 
% Problem Statement: An 800 rpm, 25 kW squirrel cage induction motor is to drive 
% a reciprocating pump at 200 rpm. The pump is to run at full load for 24 hours 
% a day. Select a suitable roller chain drive, if the center distance is as short 
% as possible.
% 
% Date: 26/09/2020
% 
% Name: Avva Sai Pranav
% 
% USN: PES1201800861

clc;
clear all;
%% 
% Intializing the given variables:

P = 25
N1 = 800
N2 = 200
%% 
% Finding the velocity ratio:

i = N1/N2
[z2,z1] = Table_14_36_a(i);
z1
z2
%% 
% Finding the pitch using equation 12.22 b:

[p] = Eqn14_22_b(N1)
[p1,W,Fu] = Table_14_39_b(p)
%% 
% PCD of sprockets

D1 = p1/(sind(180/z1));
D2 = p1/(sind(180/z2));    
C1 = D1+D2;
%% 
% Finding the velocity of the chain using equation 14.22 a:

[v] = Eqn14_22_a(p1,z1,N1)
%% 
% Finding the tangential force:

F = (1000*P)/v
%% 
% Finding the allowable working load per strand, given that the service condition 
% is 24 hr a day and EasyStarting, smooth and Steady Load:

[Ks] = Table_14_35()
%% 
% Finding the number of strands and the actual factor of safety:

FS = 11.7
[Fw] = Eqn14_22_e(Fu,FS,Ks)
j = ceil(F/Fw)
Fc = (W*(v^2))/9.81
%% 
% Assuming horizontal drive:

K2 = 6;            
Fs = K2*W*(C1/1000);
FS_actual = j*((Fu*1000)/(F+Fc+Fs));
fprintf('Fs_actual:%f \n',FS_actual);
if FS_actual>FS
    disp('Chain is Safe');
else
    disp("Chain is unsafe");
end
%% 
% Finding the chain length in pitches:

Cp = C1/P
alpha = asind((D2-D1)/(2*C1))
fprintf('Alpha : %f \n',alpha)
[Lp] = Eq14_22_k(z1,z2,Cp,alpha)
%% 
% Finding the chain length and exact center distance :

L = P*Lp
[Ce] = Eqn14_22_kCe(Lp,z1,z2,alpha,P)
Ce = Ce/2