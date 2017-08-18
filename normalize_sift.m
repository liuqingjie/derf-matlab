function  dsc = normalize_sift(descriptors,sviv)

 threshold= 1.6/sqrt(size(descriptors,2)*size(descriptors,3));  %      
 changed=1;
 iter=0;
 max_iter=10;
 
 dsc=descriptors;
 
 while(changed && iter < max_iter)
 iter=iter+1;
 changed=0;
 
 dsc=normalize_full(dsc);
   
 if sum( sum(sum(dsc > threshold, 3 )) ) >0
     
     dsc(dsc > threshold)= threshold;
    
      changed =1;
 
 
 
 end


 end
 

end