function features =normalize_full(features,sviv,ogrid)

%%%% ����һ�׶��أ�����ȥ���Բ�ͬ����Ϸ�ʽ�������������
if(size(features, 1)>0)

    %%%%%%%%%%%%%%%%%%%%%ע���أ��������仰����˼����˵��ÿ��grid��İ�ͨ����Ϣ����Ҫ���Ը�grid��İ뾶��ƽ�������ڲ���Ǹ�grid�� ����1�� 
    
%     sample_points_r=sviv.rs(ogrid(:,1));
%     
%     nm=1./(sqrt(sample_points_r)+(sample_points_r==0));
%     
%     features =features./repmat(nm,[size(features,1), 1, size(features,3)]);
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    nm=sum(features.^2,3);
    nm=sum(nm,2);%%%%�õ�һ����������
    nm=sqrt(nm);
%     nm(nm<0.001)=1;   %%%%%%%%%%%%%%%%%%%%% ��仰���ϻ��ǲ�������Ҫ���ؿ��ǡ�
    features=features./repmat(nm,[1 size(features, 2) size(features, 3)]);  %%%�������repmat�����أ�nm������ά��������[]����ָ������ά��������[]�е�ά��һ��Ҫ��nm��ά��Ҫ�ࡣ
end
    
end