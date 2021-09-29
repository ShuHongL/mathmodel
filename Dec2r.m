clc;clear all;close all;
%DEC2R
%加载数据
%输入量
X=[14.40,16.90,15.53,15.40,14.17,13.33,12.83,13,13.40,14;...
    0.65,0.72,0.72,0.76,0.76,0.69,0.61,0.63,0.75,0.84;...
    31.3,32.2,31.87,32.23,32.4,30.77,29.23,28.2,28.8,29.1];
%输出量
Y=[3621,3943,4086.67,4904.67,6311.67,8173.33,10263,12094.33,13603.33,14841;...
    0,0.09,0.07,0.13,0.37,0.59,0.51,0.44,0.58,1];
[m,n]=size(X);
s=size(Y,1);
epsilon=10^-10; %定义非阿基米德无穷小
f=[zeros(1,n) -epsilon*ones(1,m+s) 1];%目标函数的系数矩阵的系数为0，s-,s+的系数为-epsilog,theta的系数为1
A=zeros(1,n+m+s+1);%<=约束
b=0;
LB=zeros(n+m+s+1,1);
UB=[];%-inf表示下限为负无穷
for i=1:n
    Aeq=[X eye(m) zeros(m,s) -X(:,i);Y zeros(s,m) -eye(s) zeros(s,1)];
    beq=[zeros(m,1);Y(:,i)];
    w(:,i)=linprog(f,A,b,Aeq,beq,LB,UB);%解线性规划，得DMU的最佳权向量
end
lambda=w(1:n,:);%输出lambda
s_minus=w(n+1:n+m,:);%输出s-
s_plus=w(n+m+1:n+m+s,:);%输出s+
theta=w(n+m+s+1,:);%输出theta
sum_lambda=sum(lambda,2);
    