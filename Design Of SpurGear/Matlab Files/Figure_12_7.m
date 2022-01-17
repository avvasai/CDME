function [Ft,Fa,Fr] = Figure_12_7(Mt,d,beta,alpha_n)
%  FIGURE_12_7 Figure 12.7
    Ft = (2*Mt)/d;
    Fa = Ft*tand(beta);
    Fr = (Ft*tand(alpha_n))/cosd(beta);
end