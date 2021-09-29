clc;clear all;close all;
load carbig %加载数据
x = Displacement; y = Acceleration;%读取加载数据中需要表示的量
% 在carbig中，Displacement(x)为轿车形状的大小;
%Acceleration(y)为轿车轿车速度从0到60公里所用时间。
N = length(x);
% N为x长度=406
sse = 0;
for k = 1:10 %10次验证
%     Indices = crossvalind('Kfold', N, 10); %K折交叉
      [train,test] = crossvalind('LeaveMOut',N,1);
    %留M法 [train,test] = crossvalind('LeaveMOut',N,M) M等于1是留为‘留一法’
    yhat = polyval(polyfit(x(train),y(train),2),x(test));%模型预测值,此处放入封装模型
    %polyfit(x(train),y(train),2)x为横坐标，y为纵坐标，拟合2次多项式
    %polyval(p,x)，将测试x代入输出预测值y
    %当矩阵索引为逻辑值时，为1时输出该值，为0时不输出该值
    sse = sse + sum((yhat - y(test)).^2);
end
CVerr = sse / 10;
% sse=353.10 CVerr交叉验证误差为sse/100=3.5310 
