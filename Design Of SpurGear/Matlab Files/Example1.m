%% 
% Program for Design of Spur Gear, Problem 1.
% 
% Problem Statement:A pair of straight teeth spur gear is to transmit 20 kW 
% when pinion rotates at 300 rpm. The velocity ratio is 3:1. The allowable stress 
% for pinion and gear materials are 120 MPa and 100 MPa respectively. The pinion 
% has 15 teeth and its face width is 10 times the module. 
% 
% Determine:
% 
% a) Module
% 
% b) Face width
% 
% c) PCD of gears from stnadpoint of strength only
% 
% Date: 20/10/2020
% 
% Name: Avva Sai Pranav
% 
% USN: PES1201800861

clc;
clear all;
%% 
% Intializing the known variables:

P=20;
N1=300;
vr=3;
S_d1=120;
S_d2=100;
z1=15;
z2=vr*z1;
k=10;
%% 
% Finding the lewis form factor:

[y1]=Lewis(z2)
[y2]=Lewis(z2)
%% 
% Finding the strength factor to decide what the design is based on:

if S_d1*y1<S_d2*y2
    disp("Design is based on pinion")
    S_d=S_d1;
    Y=pi*y1;
    z=z1;
else
    disp("Design is based on gear")
    S_d=S_d2;
    Y=pi*y2;
    z=z2;
end
%% 
% To find the module value and the face width(b) :

syms m
d1=z1*m;
v=(pi*d1*N1)/(60*1000)
Cv=3/(3+v)
Mt=(9.55e6*P)/N1
x=vpasolve(((2*Mt)/(S_d*Cv*k*Y*z))==(m^3) , m);
m=x(1);
[m_n] = Table_12_2(m)
b = k*m
%% 
% Finding the PCD of pinion and gear respectively:

m*z1
m*z2