%% 
% Program for Design of Chain Drive, Problem 2.
% 
% Problem Statement: A 900 rpm, 30 kW squirrel cage induction motor is to drive 
% a recuoricatubg oyno at 225 rpm. The pump is to run at full load for 24 hours 
% a day. Select a suitable roller chain drive, if the center distance is as short 
% as possible
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

P = 30
N1 = 900
N2 = 225
%% 
% Finding the velocity ratio. Finding the number of teeth using the Table.14.36a

i = N1/N2
[z2,z1] = Table_14_36_a(i)
%% 
% Finding the pitch and using the table Equation 14.22 b:

[p] = Eqn14_22_b(N1)

[p1,W,Fu] = Table_14_39_b(p)
%% 
% PCD of the sprockets:

D1 = p1/(sind(180/z1));         
D2 = p1/(sind(180/z2));         
C1 = D1+D2;
%% 
% Velocity of chain  and the tangential Force:

[v] = Eqn14_22a(p1,z1,N1)
F = (1000*P)/v
[Ks] = Table_14_35()
%% 
% From table 14.37 and interpolation:

FS = 11.7        
[Fw] = Eqn14_22e(Fu,FS,Ks)
Fw = Fw*1000
%% 
% Finding the number of strand sand the actual factor of safety:

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
%% 
%