function I = edge_track_hysteresis(I,sv,wv)
    [y,x] = size(I);
    
    for j=1:1:y
        for i=1:1:x
            if I(j,i) == wv
                if (j-1 >= 1 && I(j-1,i) == sv)||(j+1<=y && I(j+1,i) == sv) || (i-1 >= 1 && I(j,i-1) == sv) || (i+1 <= x && I(j,i+1) == sv) || (j-1>=1 && i-1>=1 && I(j-1,i-1) == sv) || (j-1>=1 && i+1<=x && I(j-1,i-1) == sv) || (j+1<=y && i-1 >=1 && I(j+1,i-1) == sv) || (j+1<=y && i+1 <=x && I(j+1,i+1) == sv)
                    I(j,i) = sv;
                else
                    I(j,i) = 0;
                end
            end
        end
    end
end