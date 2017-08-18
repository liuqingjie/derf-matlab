function [sviv] = init_DERF(I,setting)
%UNTITLED Summary of this function goes here
 
grid=compute_grid(setting); 
ogrid=compute_oriented_grid(grid,360);

if size(I, 3)~=1
   im=rgb2gray(I);
else
   im=single(I);
end
 
L=layered_gradient(im, setting);
 
sig_inc=sqrt(1.6^2-0.5^2);
L=smooth_layers(L,sig_inc);


sviv.H( size(im,1),size(im,2),setting.HQ, setting.SQ)=single(0);
% 
if  strcmp(setting.confun,'DOG')            
    sviv.H=GetConDOGWav(L, setting);      
elseif strcmp(setting.confun,'SVIVlet')    
    sviv.H=GetConSVIVWav(L, setting);
elseif strcmp(setting.confun,'Haar')
    sviv.H=GetConHarrWav(L, setting);
 
end

sviv.gradientmanner='T1';
sviv.assemblingmanner='multi';
sviv.gridmanner='radial'; 
sviv.confun='DOG';
sviv.numofver=setting.numofver;
       
sviv.h=size(im,1);
sviv.w=size(im,2);
sviv.SQ=setting.SQ;
sviv.HQ=setting.HQ;

sviv.rs=setting.rs;
sviv.nthetas= setting.nthetas;
sviv.ndescriptors=setting.ndescriptors;
sviv.HN=size(grid, 1);
sviv.grid=grid;
sviv.ogrid=ogrid; 
sviv.csigma=[1 1.2599 1.5874 2 2.5198 3.1748 4  5.03968 6.34960 8 10.07936 12.6992 16 20.1587368  25.3984168]; %这个参数在日后处理的时候，可以根据图像大小来设置这个参数！！！！！！！！！！！！！！
sviv.ostable=compute_orientation_shift(setting.HQ,1);
sviv.SI=setting.SI;
sviv.LI=setting.LI;
sviv.NT=setting.NT;

end




function grid=compute_grid(setting)%%  
gs=sum(setting.nthetas);%%%%% 

grid(gs,3)=single(0); %%%%%

 
count=0;

for i=1:setting.SQ 

    thetas=( [0:(setting.nthetas(i)-1)]/setting.nthetas(i) )*2*pi;
    grid(count+1:count+setting.nthetas(i),3)=setting.rs(i)*cos(thetas)';  
    grid(count+1:count+setting.nthetas(i),2)=setting.rs(i)*sin(thetas)';%  
    grid(count+1:count+setting.nthetas(i),1)=i;    
    count=count+setting.nthetas(i);
    
end

end




function ogrid=compute_oriented_grid(grid, GOR) 

GN=size(grid,1);
ogrid(GN,3,GOR)=single(0);  
for i=0:GOR-1
    th=-i*2*pi/GOR;
    kos=cos(th);
    zin=sin(th);
    
    for k=1:GN
        y=grid(k,2);
        x=grid(k,3);
        ogrid(k,1,i+1)=grid(k,1);
        ogrid(k,2,i+1)=-x*zin+y*kos; 
        ogrid(k,3,i+1)=x*kos+y*zin;
        
        
    end
end

end




function  ostable=compute_orientation_shift(hq,res)

if nargin==1
    res=1;
end

ostable=single(0:res:359)*hq/360;
return;

end




function tc = transpose_cube( cube )
[h, w, n]=size(cube);
tc(w,h,n)=single(0);
for i=1:n
    tc(:,:,i) = transpose(cube(:,:,i));
end
end

