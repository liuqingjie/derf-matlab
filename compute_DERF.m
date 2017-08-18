function [descriptors] = compute_DERF( I, setting)  %%%%%%%%% 
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here  

sviv=init_DERF(I, setting);
o=0; % 
 

descp=get_descriptors(I, sviv, sviv.ogrid(:,:,o+1), sviv.ostable, single(o)); 

descriptors=reshape(descp,size(descp,1),size(descp,2)*size(descp,3));

 
end

