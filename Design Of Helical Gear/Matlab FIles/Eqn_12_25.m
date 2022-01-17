function Cv = Eqn_12_25(v)
%  EQN_12_25 Equation 12.25.
    if v < 5
            Cv = 4.58/(4.58+v);
    elseif v<10 && v>=5
            Cv = 6.1/(6.1+v);
    elseif v<20 && v>=10
            Cv = 15.25/(15.25+v);
    elseif v>=20
            Cv = 5.55/(5.55+sqrt(v));
    else
            disp('Use non-metallic gear')
            
    end
end