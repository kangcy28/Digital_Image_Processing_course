function ar = GaussianSmooth(I,filter_size,sigma)
    f = GaussianFilter(filter_size,sigma);
    ar = Convolution(I,f,1);
end