function [L,Lq,W,Wq]=paidui(s)
%%M/M/S
% s=2;%����̨����
mu=4;%��λʱ�����˿͵�ƽ����
lambda=3;%��λʱ���ڵ���˿͵�ƽ����
ro=lambda/mu;%���з���̨�ķ���ǿ��
ros=ro/s;%��������̨�ķ���ǿ��
sum1=0;

for i=0:(s-1)
    sum1=sum1+ro.^i/factorial(i);%factorial �׳�
end

sum2=ro.^s/factorial(s)/(1-ros);

p0=1/(sum1+sum2);
p=ro.^s.*p0/factorial(s)/(1-ros);
Lq=p.*ros/(1-ros);
L=Lq+ro;
W=L/lambda;
Wq=Lq/lambda;
% fprintf('�Ŷӵȴ���ƽ������Ϊ%5.2f��\n',Lq)
% fprintf('ϵͳ�ڵ�ƽ������Ϊ%5.2f��\n',L)
% fprintf('ƽ������ʱ��Ϊ%5.2f����\n',W*60)
% fprintf('ƽ���ȴ�ʱ��Ϊ%5.2f����\n',Wq*60)
end

clc;clear all;close all;
for i=1:20
    [L,Lq,W,Wq]=paidui(i);
    if (Wq*60)<10
        break;
    end
end
