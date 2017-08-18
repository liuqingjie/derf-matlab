function fsz=filter_size(sigma)

fsz=ceil(5*sigma);

if mod(fsz,2)==0

fsz=fsz+1;
end


if fsz<3
    
fsz=3;
end



end

