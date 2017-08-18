function  descriptors=assemblingdescriptors_multi_updown(I,sviv,ogrid,ostable,o,ii,jj)  %% 

[rows,cols,chnum,sc]=size(sviv.H);%%%%%% 

for channel=1:chnum %%%%%%%%%%% 
    for i=1:sviv.SQ  %%% 
         current_features=find((ogrid(:,1))'==i);%%%%% 
        
         for j=1:length(current_features) % 
         
              if i==1
                   %%% 
                   sample_ii1=ii-1; %%% 
                   sample_jj1=jj-1;
                   sample_ii2=ii-1;
                   sample_jj2=jj+1;
                   sample_ii3=ii+1;
                   sample_jj3=jj+1;
                   sample_ii4=ii+1;
                   sample_jj4=jj-1;
                   sample_ii=ii;
                   sample_jj=jj;
                   oob=((sample_ii1<1) + (sample_ii1>rows) + (sample_jj1<1) + (sample_jj1>cols) + (sample_ii2<1) + (sample_ii2>rows) + (sample_jj2<1) + (sample_jj2>cols) + (sample_ii3<1) + (sample_ii3>rows) + (sample_jj3<1) + (sample_jj3>cols) + (sample_ii4<1) + (sample_ii4>rows) + (sample_jj4<1) + (sample_jj4>cols)+(sample_ii<1)+(sample_ii>rows)...
                         +(sample_jj<1)+(sample_jj>cols))>0;

                   sample_ii1(oob)=1;
                   sample_jj1(oob)=1;
                   sample_ii2(oob)=1;
                   sample_jj2(oob)=1;
                   sample_ii3(oob)=1;
                   sample_jj3(oob)=1;
                   sample_ii4(oob)=1;
                   sample_jj4(oob)=1;
                   sample_ii(oob)=1;
                   sample_jj(oob)=1;  % 


                     

                   for m=0:sviv.numofver-1
                       descriptors(:,current_features(j)+m, channel)=( sviv.H(sample_ii1+(sample_jj1-1)*rows+(channel-1)*rows*cols+(i+m-1)*rows*cols*chnum)  +   sviv.H(sample_ii2+(sample_jj2-1)*rows+(channel-1)*rows*cols+(i+m-1)*rows*cols*chnum) +  sviv.H(sample_ii3+(sample_jj3-1)*rows+(channel-1)*rows*cols+(i+m-1)*rows*cols*chnum) + sviv.H(sample_ii4+(sample_jj4-1)*rows+(channel-1)*rows*cols+(i+m-1)*rows*cols*chnum) + sviv.H(sample_ii+(sample_jj-1)*rows+(channel-1)*rows*cols+(i+m-1)*rows*cols*chnum) )/5;
                       descriptors(oob,current_features(j)+m,channel)=0;
                   end   

           else
                   sample_ii=ii-ogrid(current_features(j),2);%%% 
                   sample_jj=jj+ogrid(current_features(j),3);%%%% 
                   %%% 
                   sample_ii1=floor(sample_ii);
                   sample_jj1=floor(sample_jj);
                                                      
                   
                   a=sample_ii-sample_ii1;
                   b=sample_jj-sample_jj1;
                   %%% 
                   sample_ii2=sample_ii1;
                   sample_jj2=sample_jj1+1;
                   %%%    
                   sample_ii3=sample_ii1+1;
                   sample_jj3=sample_jj1;
                   %%%% 
                   sample_ii4=sample_ii1+1;
                   sample_jj4=sample_jj1+1;  

                   oob=((sample_ii1<1) + (sample_ii1>rows) + (sample_jj1<1) + (sample_jj1>cols) + (sample_ii2<1) + (sample_ii2>rows) + (sample_jj2<1) + (sample_jj2>cols) + (sample_ii3<1) + (sample_ii3>rows) + (sample_jj3<1) + (sample_jj3>cols) + (sample_ii4<1) + (sample_ii4>rows) + (sample_jj4<1) + (sample_jj4>cols))>0;


                   sample_ii1(oob)=1;
                   sample_jj1(oob)=1;
                   sample_ii2(oob)=1;
                   sample_jj2(oob)=1;
                   sample_ii3(oob)=1;
                   sample_jj3(oob)=1;
                   sample_ii4(oob)=1;
                   sample_jj4(oob)=1;
                   
                   if  i==2
                       
                       for m=1:sviv.numofver  

                           descriptors(:,( current_features(j)- 1)*sviv.numofver +  m ,channel)=  sviv.H(sample_ii1+(sample_jj1-1)*rows+(channel-1)*rows*cols+((i-1-1)*sviv.numofver+m-1)*rows*cols*chnum).*(1-a).*(1-b)   +   sviv.H(sample_ii2+(sample_jj2-1)*rows+(channel-1)*rows*cols+((i-1-1)*sviv.numofver+m-1)*rows*cols*chnum).*b.*(1-a)  +  sviv.H(sample_ii3+(sample_jj3-1)*rows+(channel-1)*rows*cols+((i-2)*sviv.numofver+m-1)*rows*cols*chnum).*(1-b).*(a)   +   sviv.H(sample_ii4+(sample_jj4-1)*rows+(channel-1)*rows*cols+((i-2)*sviv.numofver+m-1)*rows*cols*chnum).*(b).*(a);
                           descriptors(oob,( current_features(j)- 1)*sviv.numofver +  m ,channel)=0;     
                       end

                   
                       
                       
                   elseif i==sviv.SQ
                          for m=1:sviv.numofver 

                              descriptors(:,( current_features(j)-1-sum( sviv.nthetas(3:sviv.SQ-1) ) )*sviv.numofver +   sum( sviv.nthetas(3:sviv.SQ-1) )*3*sviv.numofver+m ,channel)=  sviv.H(sample_ii1+(sample_jj1-1)*rows+(channel-1)*rows*cols+((i-1-1)*sviv.numofver+m-1)*rows*cols*chnum).*(1-a).*(1-b)   +   sviv.H(sample_ii2+(sample_jj2-1)*rows+(channel-1)*rows*cols+((i-1-1)*sviv.numofver+m-1)*rows*cols*chnum).*b.*(1-a)  +  sviv.H(sample_ii3+(sample_jj3-1)*rows+(channel-1)*rows*cols+((i-2)*sviv.numofver+m-1)*rows*cols*chnum).*(1-b).*(a)   +   sviv.H(sample_ii4+(sample_jj4-1)*rows+(channel-1)*rows*cols+((i-2)*sviv.numofver+m-1)*rows*cols*chnum).*(b).*(a);
                              descriptors(oob,( current_features(j)-1-sum( sviv.nthetas(3:sviv.SQ-1) ) )*sviv.numofver + sum( sviv.nthetas(3:sviv.SQ-1) )*3*sviv.numofver+m,channel)=0;     
                          end
                  
                   else
                        
                          for m=1:sviv.numofver*3 

                              descriptors(:,( current_features(j)-1-sum( sviv.nthetas(1:2) ) )*sviv.numofver*3  +   sum(  sviv.nthetas(1:2) )*sviv.numofver+m ,channel)=  sviv.H(sample_ii1+(sample_jj1-1)*rows+(channel-1)*rows*cols+((i-3)*sviv.numofver+m-1)*rows*cols*chnum).*(1-a).*(1-b)   +   sviv.H(sample_ii2+(sample_jj2-1)*rows+(channel-1)*rows*cols+((i-3)*sviv.numofver+m-1)*rows*cols*chnum).*b.*(1-a)  +  sviv.H(sample_ii3+(sample_jj3-1)*rows+(channel-1)*rows*cols+((i-3)*sviv.numofver+m-1)*rows*cols*chnum).*(1-b).*(a)   +   sviv.H(sample_ii4+(sample_jj4-1)*rows+(channel-1)*rows*cols+((i-3)*sviv.numofver+m-1)*rows*cols*chnum).*(b).*(a);
                              descriptors(oob,( current_features(j)-1-sum( sviv.nthetas(1:2) ) )*sviv.numofver*3  +   sum(  sviv.nthetas(1:2) )*sviv.numofver+m ,channel)=0;     
                          end
                       
                   end
                   
              end
           
 
         
         end
         
    
    end
end


end








