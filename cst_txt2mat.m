% 清空数据区域
clear
clc

% 定义一些基础变量
group = 1331;  % 整个文本包含多少组数据
length = 1001;  % 每组数据包含多少个结果，一般是多少个频点，比如1001
sample = 25;  % 采样点距离，即每两个采样点之间的间隔，如1与5的间隔是4
sample_num = 41;  % 每组的采样点个数，这个值可以是length/sample
txtPath = 'test3数据相位.txt';  % txt文档的路径，需存在于当前文件夹下
matName = 'test3数据相位.mat';  % mat文件的名称，这个文件将保存在当前路径下

% 初始化数组
cst_result = zeros(group, sample_num);

% 读取文件
fid = fopen(txtPath);  %打开文本文件
fre_index = 0;  % 频点索引(0~sample-1)
sample_index = 0;  % 采样点索引(1~sample_num)
group_index = 0;  % 组索引(1~group)

% 循环读取行
while ~feof(fid)  % 未达到文档结尾就一直循环
    str = fgetl(fid);   % 读取一行, str是字符串
    if contains(str, 'Frequency')  % 判断是否为每组的第一行
        display(str);  % 输出第一行的str
        group_index = group_index+1;  % 组数+1
        sample_index = 0;  % 采样点数归零
        fre_index = 0; % 频点归零
        
    elseif contains(str, '----------')  % 判断是否为每组的第二行
        continue
    elseif isempty(str)  % 如果是空行，跳过
        continue
    else  % 如果是数字
        if fre_index == 0  % 判断是否是采样点
            sample_index=sample_index+1;  % 采样点+1
            
            s = regexp(str, '[-\d+.]*\d+');  % 用正则表达式差分出数字
%             num1 = str2double(str(s(1):s(2)-1))  % 第一个数字，一般是频点
            num2 = str2double(str(s(2):end));  % 第二个数字，一般是值
            
            cst_result(group_index, sample_index)=num2;
        elseif fre_index >= sample-1
            fre_index = -1;  % 相当于归零
        end
        fre_index = fre_index+1;  % index自加一行
    end
end
fclose(fid);

% 保存这个矩阵
save(matName, 'cst_result');
