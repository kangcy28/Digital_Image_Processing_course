function ar = GaussianFilter(k,sigma)
    ar = zeros(k,k);
    for j=1:1:k
        for i=1:1:k
            a = i-floor(k/2+1);
            b = j-floor(k/2+1);
            ar(i,j) = 1/(2*pi*sigma^2)*exp(-(a^2+b^2)/(2*sigma^2));
        end
    end
    ar = ar / sum(sum(ar));
end