function [] = BMD_plot(L1, L2, L3, Mb, Mc)
%  BMD_PLOT BMD Plot
% 
% Creates a bending moment plot.
x1 = 5;
y1 = 5;
x2 = x1 +L1;
y2 = y1 + (Mb/1000);
x3 = x2+L2;
y3 = y2 +(Mc/1000);
x4 = x3 + L3;
y4 = y1;
X = [x1 x2 x3 x4];
Y = [y1 y2 y3 y4];
figure
plot(X,Y)
fill(X,Y,([152 154 156]/255));
grid on
end