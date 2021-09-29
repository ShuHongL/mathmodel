function [L,Lq,W,Wq]=paidui(s)
%%M/M/S
% s=2;%服务台个数
mu=4;%单位时间服务顾客的平均数
lambda=3;%单位时间内到达顾客的平均数
ro=lambda/mu;%所有服务台的服务强度
ros=ro/s;%单个服务台的服务强度
sum1=0;

for i=0:(s-1)
    sum1=sum1+ro.^i/factorial(i);%factorial 阶乘
end

sum2=ro.^s/factorial(s)/(1-ros);

p0=1/(sum1+sum2);
p=ro.^s.*p0/factorial(s)/(1-ros);
Lq=p.*ros/(1-ros);
L=Lq+ro;
W=L/lambda;
Wq=Lq/lambda;
% fprintf('排队等待的平均人数为%5.2f人\n',Lq)
% fprintf('系统内的平均人数为%5.2f人\n',L)
% fprintf('平均逗留时间为%5.2f分钟\n',W*60)
% fprintf('平均等待时间为%5.2f分种\n',Wq*60)
end

clc;clear all;close all;
for i=1:20
    [L,Lq,W,Wq]=paidui(i);
    if (Wq*60)<10
        break;
    end
end
