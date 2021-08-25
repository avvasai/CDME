%% 
% Program for Design of Worm Gear, Problem 9.
% 
% Problem Statement: Design a worm gear for a speed reducer to transmit 30 kW 
% at a worm speed of 600 rpm. The required velocity ratio is 25:1. The worm is 
% made of C30 heat treated steel and the worm wheel is made of phosphor bronze. 
% The service conditions are intermittent operations with medium shock loads. 
% Also calculate the heat dissipation through the drive. 
% 
% Date: 20/10/2020
% 
% Name: Avva Sai Pranav
% 
% USN: PES1201800861

clc;
clear all;
%% 
% Intializing the given data:

P = 30
ii = 25
N1 = 600
n1 = N1/60
alpha = 14.5
S_d1 = 82.4
S_d2 = 220.6
%% 
% Finding n2 using equation 12.68(b)

[n2] = Eqn_12_68_b_n2(n1,ii)
%% 
% Finding the centre distance using Equation 12.68(a):

[a] = Eqn_12_68_a(P,ii)
%% 
% The worm gear is assumed to be weaker than worm since it is subjected to sliding 
% action, thereby resulting in over heating and leading to failures. The diameters 
% d1 and d2 are found as per AGMA using equation 12.51(a):

[d1] = Eqn_12_51_a(a)
[d2] = Eqn_12_47_a(a,d1)
z1 = 1
%% 
% Finding the permissible tooth load and Moment:

[Mt] = Eqn_3_3_a(P,n2)
K = 1
[Ft] = Eqn_12_53_d(K,d2,Mt)
%% 
% Finding the pitch line velocity of the gear and the velocity factor:

[v] = Eqn_12_48_b(d2,n2)
[Cv] = Eqn_12_53_c(v)
%% 
% Finding the face width using equation 12.64:

[b] = Eqn_12_64(a)
%% 
% Finding the module m using equation 12.53(a):

y = 0.1
[m] = Eqn_12_53_a_m(Ft,S_d1,Cv,b,y)
m = 15
%% 
% Finding the lead angle using equation 12.64(e):

[gamma] = Eqn_12_46_e(m,d1,z1)
%% 
% Finding the dynmaci strength of gears:

Y = pi*y
[Fs] = Eqn_12_54(S_d1,b,Y,m)
%% 
% Finding the wear tooth load:

K = 0.412
[Fw] = Eqn_12_62_a(d2,b,K)
if Fw>Fs
    disp("The material is safe against wear")
else
    disp("The material is not safe against wear")
end
%% 
% Finding vr using equation 12.60(b):

vr = ((pi*d1*n1)/(1000*cosd(gamma)))
if vr > 2.75
    mu = 0.025 + ((3.281*vr)/(1000))
else
    mu = ((0.0422)/(vr^(0.28)))
end
%% 
% Finding the efficiency using equation 12.57( C):

[theta,eta] = Eqn_12_57_c(alpha,gamma,mu)
%% 
% Finding the normal force:

[Fn] = normal_force(Ft,gamma,alpha)
%% 
% Fing the heat generatd using equation 12.63 (a):

[Qg] = Eqn_12_63_a(mu,Fn,vr,gamma)
%% 
% Fing the heat dissipated using equation 12.63 (b):

[Qd] = Eqn_12_63_b(P,eta)
if Qd>Qg
    disp("Artificial cooling is not necessary");
else
    disp("Artificial cooling is necessary");
end