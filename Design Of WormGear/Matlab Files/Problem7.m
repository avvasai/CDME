%% 
% Program for Design of Worm Gear, Problem 7.
% 
% Problem Statement:Design a worm gear drive to transmit 2 kW of power at 1000 
% rpm. The speed ratio is 20 and centre distance is 200 mm. Assume the number 
% of teeth on worm wheel to be 40 and number of starts on worm to be 2. Assume 
% hardened steel worm and phosphor bronze wheel for which σd = 55 N/mm2 . Check 
% the gear from stand point of strength and wear if load stress factor, K = 0.69 
% MPa. If the amount of heat generated is 1.7 kW, check whether artificial cooling 
% is necessary or not for a temperature rise for 40 degree C. 
% 
% Date: 7/11/2020
% 
% Name: Avva Sai Pranav
% 
% USN: PES1201800861

clc;
clear all;
%% 
% Intializing the given data:

P = 2;
ii = 20;
alpha = 14.5;
a = 200;
N1 = 1e3;
n1 = N1/60;
z2=40;
S_d2 = 55;
Qg=1.7;
Dt=40;
%% 
% Finding n2 using equation 12.68(b)

[n2] = Eqn_12_68_b_n2(n1,ii)
%% 
% The worm gear is assumed to be weaker than worm since it is subjected to sliding 
% action, thereby resulting in over heating and leading to failures. The diameters 
% d1 and d2 are found as per AGMA using equation 12.51(a):

[d1] = Eqn_12_51_a(a)
[d2] = Eqn_12_47_a(a,d1)
z1 = 2
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
[m] = Eqn_12_53_a_m(Ft,S_d2,Cv,b,y)
m = 3
%% 
% Finding the lead angle using equation 12.64(e):

[gamma] = Eqn_12_46_e(m,d1,z1)
%% 
% Finding the dynmaci strength of gears:

Y = pi*y
[Fs] = Eqn_12_54(S_d2,b,Y,m)
%% 
% Finding the wear tooth load:

K=0.69
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
% Fing the heat dissipated using equation 12.63 (b):

Ag=(pi*d2^2)/4
Lw=(14.14+0.063*z1)*m
Aw=Lw*d1
[Qd]=Eqn_12_63_c(Ag,Aw,Dt)
if Qd>Qg
    disp("Artificial cooling is not necessary");
else
    disp("Artificial cooling is necessary");
end