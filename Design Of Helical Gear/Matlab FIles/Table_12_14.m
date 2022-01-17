function e = Table_12_14(v)
%  TABLE_12_14 Table 12.14
E=[1 2 2.5 3 4 5 6 8 10 12 15 20 25 26;0.0960 0.0880 0.0840 0.0785 0.0710 0.0640 0.0590 0.0500 0.0386 0.0330 0.0230 0.0155 0.0130 0.0127];
    if  v<=26
        for ii=14:-1:1
            if v <= E(1,ii)
                diff1=E(1,ii)-v;
                if ii <= 0
                diff2=E(1,ii)-v;
                diff_min=min(diff1,diff2);
                else
                diff_min=diff1;
                end
                if diff_min==diff1
                    e = E(2,ii);
                else 
                    e = E(2,ii-1);
                end
            end
        end
    elseif v>26
        e = E(2,14);
    else
        disp('Try again!!')
    end
end