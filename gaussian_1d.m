function flt= gaussian_1d(sigmaa, mean, fsz)


sz=floor((fsz-1)/2);

v=sigmaa*sigmaa*2;

x=-sz:sz;

flt=exp(-((x-mean).^2)/v);%%% 

n=sum(flt); %%%% 

flt=flt/n;

end
