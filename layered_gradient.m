function [L]=layered_gradient(im, setting)

%%% first smooth the image 
hf = gaussian_1d(0.5, 0, 5);

im=conv2(im, hf, 'same');

im=conv2(im, hf', 'same');

 %%% T1 线性加权的梯度，T2正弦加权的梯度， T3方向可控滤波器，T4edge滤波器，T5，表示DAISY所用的梯度。

%%%%%test_settings{1}.gradientmanner='T1'; %%% T1 线性加权的梯度，T2 正弦加权的梯度， T3 方向可控滤波器， T4 edge滤波器， T0 DAISY所用的梯度。

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


