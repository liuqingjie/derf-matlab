function fbr = compute_channels_oe_nms(I)

I=im2double(I);

 

if (3==size(I,3))
  img=rgb2gray(I);
else
    img=I;
end

[FB,o]=make_fb(4,3,4,15);%%%   

for i=1:size(FB,3)
    
 fbr(:,:,i)=abs(conv2(img,   flipud(fliplr(FB(:,:,i))), 'same')   );  %%% 
 
 fbr(:,:,i)=conv2( fbr(:,:,i), fspecial('gaussian',15 ,2), 'same' );  %%%% 
 
  
 
 fbr(:,:,i)=nonmax(fbr(:,:,i),-o(i)*2*pi/360 );
 
end
 
    
fbr(1:3,:,:)=0;
fbr(end-2:end,:,:)=0;
fbr(:,1:3,:)=0;
fbr(:,end-2:end,:)=0;



end