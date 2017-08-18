function  SL = smooth_imagelayer(im,sigmaa)

fsz=filter_size(sigmaa);

hf=gaussian_1dnew(sigmaa,0,fsz);

SL=conv2(im,hf,'same');

SL=conv2(SL,hf','same');


end
