%% 
% Program for Design of Bevel Gear, Problem 7.
% 
% Problem Statement: A pair of straigh t tooth bevel gears at right angles is 
% to transmit 5kW at 1200 rpm of the pinion. The diameter of the pinion is 80 
% mm and the vlocity ratio is 3.5. The tooth form is 14 1/2 degrees. Both pinion 
% and gear are cast iron with allowable stress of  55 N/m2. Determine the module, 
% face witdth from the standpoint of strength and also check tthe design from 
% stand point of dynamic load and wear.
% 
% Date: 21/10/2020
% 
% Name: Avva Sai Pranav
% 
% USN: PES1201800861

clc;
clear all;
%% 
% Intializing the variables:

theta = 90
P = 5
N1 = 1200
d1 = 80 
ii = 3.5
alpha = 14.5
S_dg = 55 
%% 
% Finding the diameter and rpm of the gear:

d2 = ii*d1
N2 = N1/ii
%% 
% As both are made of the same material , pinion is weaker. Finding the pitch 
% angel using equation 12.32(a):

del_p = Eqn_12_32_a(ii)
del_g = Eqn_12_32_b(ii)
%% 
% Finding the number of virtual teeth for pinion and gear:

z1 = 24
z2 = ii*z1
ze = Eqn_12_25_d(z1,del_p);
zep =ze
ze = Eqn_12_25_d(z2,del_g);
zeg =ze
%% 
% Find the velcoity and the velocity factor:

v = ((pi*d1*N1)/(60))
%Cv = ((6.1)/(6.1+v))
Cv = 0.5482
%% 
% Finding the tangential force using equation 12.38(b):

Ft = ((1000*P)/(v))
%% 
% Finding the format using expression below equation 12.37:

Y = pi*(0.124-((0.684)/(zep)))
%% 
% Fnding the cone using equation 12.33:

L = 0.5*(sqrt(d1^2+d2^2))
%% 
% Finding the face width usign equation 12.36(b)

b = L/3 
m = ((Ft*1000)/(S_dg*Cv*b*Y))*((L)/(L-b));
m = Table_12_24(m);
m = 4
%% 
% Findthen number of teeth on gears and pinion:

z1 = d1/m
z2 = d2/m
%% 
% Finding the zep and zeg values :

ze = Eqn_12_25_d(z1,del_p);
zep =ze
ze = Eqn_12_25_d(z2,del_g);
zeg =ze
%% 
% Finding the induced streess and the new form factor:

Y_new = pi*(0.124- ((0.684)/(zep)))
S_d_ind = ((Ft*1000)/(Ft*Cv*b*Y))*((L)/(L-b))
if S_dg > S_d_ind
    disp("The calculated values are less than permissible values hence the assumed values are satisfactory.");
else
    disp("The calculated values are greater than permissible values hence the assumed values are not satisfactory.");
end
%% 
% Finding the dynamic tooth load:

K3 = 20.67
e1 = 0.0640
e2 = 0.06
C = 353.39
C = C/e2 * e1
Fd = Ft + ((K3*v*(C*b+Ft))/(K3*v+sqrt(C*b+Ft)))
%% 
% For wear load(Fw) :

Q = ((2*zeg)/(zep+zeg))
K = 1.324
Fw = ((d1*b*Q*K)/(cos(del_g)))
if Fw >= Fd
    disp("Safe against wear");
else
    disp("Not safe against wear");
end
%% 
% 
% 
% 
% 
%