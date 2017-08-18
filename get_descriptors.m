function [descriptors]=get_descriptors(I,sviv,ogrid,ostable,o,M) 
%%%  
if(exist('M')==1) %%% 
[ii,jj]=find_interest_points(sviv,sviv.ndescriptors);%%% 
else
[ii,jj]=find_interest_points(sviv,sviv.ndescriptors);%%%%% 
end
  
 %   descriptors=assemblingdescriptors(I,sviv,ogrid,ostable,o,ii,jj);
 %  descriptors=assemblingdescriptors_multi_up(I,sviv,ogrid,ostable,o,ii,jj);
 %  descriptors=assemblingdescriptors_multi_down(I,sviv,ogrid,ostable,o,ii,jj);
    descriptors=assemblingdescriptors_multi_updown(I,sviv,ogrid,ostable,o,ii,jj);
 %  descriptors=assemblingdescriptors_multi_ascend(I,sviv,ogrid,ostable,o,ii,jj);
 %   descriptors=assemblingdescriptors_multi_all(I,sviv,ogrid,ostable,o,ii,jj);
if sviv.NT==0
         return;
elseif sviv.NT==1 
        descriptors=normalize_full(descriptors,sviv,ogrid);
elseif sviv.NT==2
        descriptors=normalize_partial(descriptors,sviv,ogrid);
elseif sviv.NT==3
 
         descriptors=normalize_sift(descriptors,sviv);
end

end
