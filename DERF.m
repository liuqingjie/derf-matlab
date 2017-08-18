
  
      
test_settings{1}.label = 'DERF';
 
test_settings{1}.NT = 3;  %%% NT==1£ºnormalize_full,  NT==2£º normalize_partial, NT==3£ºnormalize_sift.
test_settings{1}.SQ=6; % the number of the rings
 
test_settings{1}.rs=[0   4   6.5   10.5   16    23];
test_settings{1}.nthetas=[1  8  8  8  8  8 ];%%%[1 8 8 8 8 8 8 8 8 8 8 8 8 8 8 ];
test_settings{1}.ndescriptors=300; % 
test_settings{1}.HQ=8; %%% the number of gradient oirentations
test_settings{1}.gradientmanner='T0'; %%%T0  T1  T2   T3  different gradients
test_settings{1}.assemblingmanner='multi'; %%% multi£ºmulti-derf  £¬single£ºsingle-derf¡£
test_settings{1}.ASQ=3; %%% 
test_settings{1}.gridmanner='radial'; %%% 
test_settings{1}.confun='DOG'; %%% convolution kernel    DOG:DoG wavelet   Haar£ºHaar wavelet
test_settings{1}.numofver=1;  %% when TF-DoG£º the number of rotation directions for one grid point and one scale.

         
svivdescs1=compute_DERF(imgfile1,test_settings);%% imgfile1  is the  input  image patch
         
          
         
        
       
  