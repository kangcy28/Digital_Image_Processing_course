function I = zeropadding(I,filter_size)
[sy,sx] = size(I);
k = floor(filter_size / 2);
preend = zeros(k,sx+2*k);
lr = zeros(sy,k);
I = [lr I lr];
I = [preend;I];
I = [I; preend];
end