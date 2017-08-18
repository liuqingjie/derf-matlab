function [H]=GetConDOGWav(L, setting)    %%% 2014.07.05 ÓÚfisherÍ¼Êé¹Ý¡£

layeredsigma=[ 1     1.5874      2.916666    4.70588    7.47011  11.4094];

 

 

 
for r=1:3
    sigmaa=layeredsigma(r);
    CL(:,:,:,r)=smooth_layers(L,sigmaa);
end

for r=4:length(layeredsigma)
          
    if r==1
       sigmaa=layeredsigma(r);
       CL(:,:,:,r)=smooth_layers(L,sigmaa);
    else
       sigmaa=sqrt(layeredsigma(r)^2-layeredsigma(r-1)^2);
              
       CL(:,:,:,r)=smooth_layers(CL(:,:,:,r-1),sigmaa);
    end
end




       
       
H(:,:,:,1)=CL(:,:,:,1)-CL(:,:,:,2); 
H(:,:,:,2)=CL(:,:,:,2)-CL(:,:,:,3);
H(:,:,:,3)=CL(:,:,:,3)-CL(:,:,:,4);
H(:,:,:,4)=CL(:,:,:,4)-CL(:,:,:,5);
H(:,:,:,5)=CL(:,:,:,5)-CL(:,:,:,6);
 
   
       
      
for maxindex=1:size(H,4)
    H(:,:,:,maxindex)=abs(H(:,:,:,maxindex));    
                  
end
   
 


 
for i=1:setting.SQ-1
    for j=1:setting.numofver
        H(:,:,:,(i-1)*setting.numofver+j)=smooth_layers(H(:,:,:,(i-1)*setting.numofver+j),1.2);
    end
end




end
