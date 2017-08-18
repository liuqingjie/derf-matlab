function features =normalize_full(features,sviv,ogrid)

%%%% 在这一阶段呢，我们去尝试不同的组合方式组成特征向量。
if(size(features, 1)>0)

    %%%%%%%%%%%%%%%%%%%%%注意呢，下面三句话的意思呢是说，每个grid点的八通道信息，都要除以该grid点的半径的平方，最内层的那个grid点 除以1。 
    
%     sample_points_r=sviv.rs(ogrid(:,1));
%     
%     nm=1./(sqrt(sample_points_r)+(sample_points_r==0));
%     
%     features =features./repmat(nm,[size(features,1), 1, size(features,3)]);
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    nm=sum(features.^2,3);
    nm=sum(nm,2);%%%%得到一个列向量。
    nm=sqrt(nm);
%     nm(nm<0.001)=1;   %%%%%%%%%%%%%%%%%%%%% 这句话加上还是不加上需要慎重考虑。
    features=features./repmat(nm,[1 size(features, 2) size(features, 3)]);  %%%关于这个repmat函数呢，nm的行列维数，乘以[]中所指的行列维数，但是[]中的维度一定要比nm的维度要多。
end
    
end