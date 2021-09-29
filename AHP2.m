function [w, CR] = AHP2(A)
% n= [ 1    2    3    4    5    6    7    8    9
RI = [ 0.00 0.00 0.58 0.90 1.12 1.24 1.32 1.41 1.45];%检验

n = size(A,1);
[V, D] = eig(A);%计算特征值D和特征向量V:A*V=V*D

[lamda, i] = max(diag(D));%取最大特征值与位置
CI=(lamda-n)/(n-1);%一致性指标
CR = CI/RI(n);%一致性比例

W = V(:,i);%最大特征值的特征向量
w = W/sum(W);%归一化