function [G,theta] = intensity_gradient(I)
    Gx = [-1 0 1; -2 0 2; -1 0 1];
    Gy = [-1 -2 -1; 0 0 0; 1 2 1];
    
    IGx = Convolution(I,Gx,1);
    IGy = Convolution(I,Gy,1);
    
    
    
    G = sqrt(IGx.*IGx+IGy.*IGy);
    G = G / max(max(G));
    theta = atan(IGy/IGx+0.001);
end