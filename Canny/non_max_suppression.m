function re = non_max_suppression(I,dir)
    [y,x] = size(dir);
    for j = 2:1:y-1
        for i = 2:1:x-1
            if dir(j,i) >= 3/8 * pi
                dir(j,i) = 2;
            elseif dir(j,i) >= 1/8 * pi
                dir(j,i) = 1;
            elseif dir(j,i) >= -1/8 * pi
                dir(j,i) = 0;
            elseif dir(j,i) >= -3/8 * pi
                dir(j,i) = 3;
            else
                dir(j,i) = 2;
            end
        end
    end
    
    re = I;
    for j = 2:1:y-1
        for i = 2:1:x-1
            if dir(j,i) == 0
                if I(j,i)>I(j,i-1)&&I(j,i)>I(j,i+1)%上下
                else
                    re(j,i) = 0;
                end
            end    
             if dir(j,i) == 1
                if I(j,i)>I(j+1,i-1)&&I(j,i)>I(j-1,i+1)%右上左下
                else
                    re(j,i) = 0;
                end
             end
             if dir(j,i) == 2
                if I(j,i)>I(j-1,i)&&I(j,i)>I(j+1,i)%左右
                else
                    re(j,i) = 0;
                end
             end
             if dir(j,i) == 3
                if I(j,i)>I(j+1,i+1)&&I(j,i)>I(j-1,i-1)%右下左上
                else
                    re = 0;
                end
            end
        end
    end
end