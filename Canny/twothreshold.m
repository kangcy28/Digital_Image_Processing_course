function [res] = twothreshold(I,strong,weak,sv,wv)
[x,y] = size(I);

ht = max(max(I)) * strong;
lt = ht * weak;
res = zeros(x,y);
for j = 2:1:y-1
    for i = 2:1:x-1
        if I(j,i) >= ht
            res(j,i) = sv;
        end
        
        if I(j,i) >= lt && I(j,i) <= ht
            res(j,i) = wv;
        end
    end
end

end