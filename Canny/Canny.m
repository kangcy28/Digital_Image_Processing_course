sigma = 1.4;
filter_size = 5;
sv = 255;
wv = 100;
I = imread('lenna-RGB.tif');
tmp = I;
I = im2double(rgb2gray(I));

smooth = GaussianSmooth(I,filter_size,sigma);
[G, theta] = intensity_gradient(I);
T = non_max_suppression(G,theta);
[mix] = twothreshold(T,0.7,0.1,sv,wv);
output = edge_track_hysteresis(mix,sv,wv);
subplot(1,2,1);imshow(mix);
subplot(1,2,2);imshow(output);
