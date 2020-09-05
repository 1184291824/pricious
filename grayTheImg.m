clear all;clc;
s=0;

for f = 1:21 % 21个不同的频点
    for i = 1:70  % 70个不同的结构参数
        matName = ['100组电场图/EFXYZ/EFup1/EFup1_', num2str(f), '_', num2str(i), '.mat'];  % 导入的mat文件名称
        load(matName);  % 导入输入
        % 读取数据并归一化
%         f_1=c;  % 读取单个频点下的矩阵数据
        grayFigure_1=mat2gray(c);  % 将数据转换成灰度图
%         f_4=EFxy_4(:,:,i);
%         grayFigure_4=mat2gray(f_4,[3.218327978472583e-12,8.987519]);
        
        % 保存路径
        path_h1 = ['100组电场图的灰度图/f',num2str(f),'s',num2str(i),'.bmp'];
%         path_h2 = ['灰度图/r',num2str(r),'h4','f',num2str(i),'.bmp'];
        
        % 保存图片
        imwrite(grayFigure_1, path_h1);
%         imwrite(grayFigure_4, path_h2);
        clear c
    end   
%     clear c
    % 输出提示
    fprintf('频点%d的图片已经生成\n', f)
end