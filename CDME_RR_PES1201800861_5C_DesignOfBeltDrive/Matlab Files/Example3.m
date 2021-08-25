%% 
% Program for Design of Belt Drive, Problem 3.
% 
% Problem Statement: A leather belt 9 x 250 mm is to drive a CI pulley 800 mm 
% in diameter at 400 rpm. If active arc on smaller pulley is 1500 and the stress 
% in the tight side 1.5 MPa, find the power transmitted. Take the density of leather 
% as 1,000 kg/m3 and mu = 0.25.
% 
% Name: Avva Sai Pranav
% 
% USN: PES1201800861

clc;
clear all;
%% 
% Intializing the known parameters:

D = 800
N = 400
t = 9
b = 250
tt = (150*pi)/180
mu = 0.25
roh = 1000
w = roh*9.81
S_d = 1.5
%% 
% Finding the velocity:

v = (pi*(D+t)*N)/(60*1000)
[P] = Eqn14_5_a(b,t,v,S_d,w,mu,tt)