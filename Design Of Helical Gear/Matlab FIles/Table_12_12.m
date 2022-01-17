function [C] = Table_12_12()
%  TABLE_12_12 Table 12.12
    disp('Referring Table 12.12')
    disp('1.CAST IRON + CAST IRON & 14(1/2) deg')
    disp('2.CAST IRON + STEEL & 14(1/2) deg')
    disp('3.STEEL + STEEL & 14(1/2) deg')
    disp('4.CAST IRON + CAST IRON & 20-deg')
    disp('5.CAST IRON + STEEL & 20-deg')
    disp('6.STEEL + STEEL & 20-deg')
    disp('7.CAST IRON + CAST IRON & 20-deg stub')
    disp('8.CAST IRON + STEEL & 20-deg stub')
    disp('9.STEEL + STEEL & 20-deg stub')
    choice=input('CHOOSE 1-9 ACCORDING TO YOUR DESIGN REQUIREMENT: ')
    C1=[55.2 110.4 165.6 220.9 331.3 441.7 552.1 662.5 828.2];
    C2=[75.8 151.6 227.4 303.2 454.8 606.4 758.1 909.7 1137.1];
    C3=[110.3 220.6 330.9 441.3 662 882.6 1103.2 1323.9 1654.9];
    C4=[57.3 114.5 171.8 229.1 343.6 458.2 572.7 687.3 859.1];
    C5=[78.6 157.3 235.9 314.6 471.9 629.2 786.5 943.8 1180];
    C6=[114.4 228.9 343.3 457.8 686.7 915.6 1144.4 1373.3 1716.7];
    C7=[59.3 118.7 178 237.3 356 474.6 593.3 712 890];
    C8=[81.4 162.8 244.2 325.6 488.4 651.2 814 976.7 1221];
    C9=[118.7 237.3 356 474.6 712 949.3 1186.6 1423.9 1780];
    
    Cc = [C1;C2;C3;C4;C5;C6;C7;C8;C9];
    Err = [0.01 0.02 0.03 0.04 0.06 0.08 0.10 0.12 0.15];
    E = round(e,2);
    for ii=1:9
        if E >= Err(ii)
            C = Cc(choice,ii);
            C = (e*C)/E;
        end
    end
end