clc;clear all;close all;
load carbig %��������
x = Displacement; y = Acceleration;%��ȡ������������Ҫ��ʾ����
% ��carbig�У�Displacement(x)Ϊ�γ���״�Ĵ�С;
%Acceleration(y)Ϊ�γ��γ��ٶȴ�0��60��������ʱ�䡣
N = length(x);
% NΪx����=406
sse = 0;
for k = 1:10 %10����֤
%     Indices = crossvalind('Kfold', N, 10); %K�۽���
      [train,test] = crossvalind('LeaveMOut',N,1);
    %��M�� [train,test] = crossvalind('LeaveMOut',N,M) M����1����Ϊ����һ����
    yhat = polyval(polyfit(x(train),y(train),2),x(test));%ģ��Ԥ��ֵ,�˴������װģ��
    %polyfit(x(train),y(train),2)xΪ�����꣬yΪ�����꣬���2�ζ���ʽ
    %polyval(p,x)��������x�������Ԥ��ֵy
    %����������Ϊ�߼�ֵʱ��Ϊ1ʱ�����ֵ��Ϊ0ʱ�������ֵ
    sse = sse + sum((yhat - y(test)).^2);
end
CVerr = sse / 10;
% sse=353.10 CVerr������֤���Ϊsse/100=3.5310 
