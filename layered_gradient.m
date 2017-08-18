function [L]=layered_gradient(im, setting)

%%% first smooth the image 
hf = gaussian_1d(0.5, 0, 5);

im=conv2(im, hf, 'same');

im=conv2(im, hf', 'same');

 %%% T1 ���Լ�Ȩ���ݶȣ�T2���Ҽ�Ȩ���ݶȣ� T3����ɿ��˲�����T4edge�˲�����T5����ʾDAISY���õ��ݶȡ�

%%%%%test_settings{1}.gradientmanner='T1'; %%% T1 ���Լ�Ȩ���ݶȣ�T2 ���Ҽ�Ȩ���ݶȣ� T3 ����ɿ��˲����� T4 edge�˲����� T0 DAISY���õ��ݶȡ�

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% compute various gradients  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if strcmp(setting.gradientmanner,'T0')
    L=computegradient_T0(im,setting);
elseif strcmp(setting.gradientmanner,'T1')
    L=computegradient_T1(im,setting);
elseif strcmp(setting.gradientmanner,'T2')
    L=computegradient_T2(im,setting);
elseif strcmp(setting.gradientmanner,'T3')
    L=computegradient_T3(im,setting);
elseif strcmp(setting.gradientmanner, 'T4')   
    L=computegradient_T4(im,setting);
elseif strcmp(setting.gradientmanner, 'T5')   
    L=computegradient_T5(im,setting);
end

%%%%%%%%%%%%%%%%% compute various gradients  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






end


