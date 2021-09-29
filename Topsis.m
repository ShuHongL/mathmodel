%理想解法
data=xlsread('Graduate.xlsx');
A=data(:,2:end);%决策矩阵
[m,n]=size(A);
A(:,2)=qujian(A(:,2),5,6,2,10);
%对师生比指标做区间变化到极大型
for j=1:n
    B(:,j)=A(:,j)/norm(A(:,j));%规范化处理
end
w=[0.2 .3 0.4 0.1];%各指标权重向量
C=B.*repmat(w,m,1);%加权规范矩阵
Cstar=max(C);%按列取最大值，求正理想解
Cstar(4)=min(C(:,4));%第4个指标是负向指标（值越小越好）
C0=min(C);%按列取最小值，求负理想解
C0(4)=max(C(:,4));%第4个指标是负向指标（值越大越差）
for i=1:m
    Sstar(i)=norm(C(i,:)-Cstar);%求各样本到正理想解的距离
    S0(i)=norm(C(i,:)-C0);%求各样本到负理想解的距离
end
f=S0./(S0+Sstar);%求评价参考值
[sf,ind]=sort(f,'descend');%求各研究生院的排名
