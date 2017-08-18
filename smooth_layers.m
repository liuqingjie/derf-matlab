function [SL]= smooth_layers(L, sigmaa)
fsz=filter_size(sigmaa);

hf=gaussian_1d(sigmaa,0,fsz);

ln=size(L,3);

[h, w]=size(L(:,:,1));
SL(h,w,ln)=0;

for l=1:ln
    
    SL(:,:,l)=conv2(L(:,:,l),hf,'same');
    SL(:,:,l)=conv2(SL(:,:,l),hf', 'same');
end




end

