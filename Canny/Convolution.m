function ar = Convolution(I,Filter,stride)
    [sy,sx] = size(I);
    [fy,fx] = size(Filter);
    ar = zeros(floor(sy/stride),floor(sx/stride));
    ix=1;
    iy=1;
    t = zeropadding(I,fy);
    for y = floor(fy/2)+1:stride:sy-floor(fy/2)
        for x = floor(fx/2)+1:stride:sx-floor(fx/2)
            tmp = zeros(fy,fx);
            tx = 1;
            ty = 1;
            for cy = -floor(fy/2):1:floor(fy/2)
                for cx = -floor(fx/2):1:floor(fx/2)

                    tmp(ty,tx) = Filter(cy+floor(fy/2)+1,cx+floor(fx/2)+1) * t(y+cy,x+cx);
                    tx = tx + 1;
                end
                ty = ty + 1;
            end
            ar(y,x) = sum(sum(tmp));
            
            ix = ix + 1;
        end
        iy = iy + 1;
    end
end