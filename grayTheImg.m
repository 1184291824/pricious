clear all;clc;
s=0;

for r = 1:100 % 100个不同的半径
    matName = ['100组数据/efxy14-', num2str(r), '.mat'];  % 导入的mat文件名称
    load(matName);  % 导入输入
    for i = 1:200  % 200个不同的频点

        % 读取数据并归一化
        f_1=EFxy_1(:,:,i);  % 读取单个频点下的矩阵数据
        grayFigure_1=mat2gray(f_1,[3.218327978472583e-12,8.987519]);  % 将数据转换成灰度图
        f_4=EFxy_4(:,:,i);
        grayFigure_4=mat2gray(f_4,[3.218327978472583e-12,8.987519]);
        
        % 保存路径
        path_h1 = ['灰度图/r',num2str(r),'h1','f',num2str(i),'.bmp'];
        path_h2 = ['灰度图/r',num2str(r),'h4','f',num2str(i),'.bmp'];
        
        % 保存图片
        imwrite(grayFigure_1, path_h1);
        imwrite(grayFigure_4, path_h2);
        
    end   
    clear EFxy_1 EFxy_4
    % 输出提示
    fprintf('半径%d的图片已经生成\n', r)
end