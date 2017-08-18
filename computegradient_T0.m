
function [L] =computegradient_T0(im,setting) 


%%% compute x and y derivatives
hf=[1 0 -1]/2;

vf=hf';

dx=conv2(im, hf, 'same');

dy=conv2(im, vf, 'same');

%%% compute layers

[h,w]=size(im);

L(h,w, setting.HQ)=single(0); %%% 

for l=0:setting.HQ-1
    
    th=2*l*pi/setting.HQ;
    kos=cos(th);
    zin=sin(th);
    L(:,:,l+1)=max(kos*dx+zin*dy, 0);%%  
    
end  

