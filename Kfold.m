Data = rand(9,3);%����ά��Ϊ9��3�������������
indices = crossvalind('Kfold', 9, 3);%��������������ָ�Ϊ3����
for i = 1:3 %ѭ��3�Σ��ֱ�ȡ����i������Ϊ����������������������Ϊѵ������
    test = (indices == i);
    train = ~test;
    trainData = Data(train, :);
    testData = Data(test, :);
end

[M,N]=size(data);%//���ݼ�Ϊһ��M*N�ľ�������ÿһ�д���һ������
indices=crossvalind('Kfold',data(1:M,N),10);%//��������ְ�
for k=1:10 %//������֤k=10��10����������Ϊ���Լ�
test = (indices == k); %//���test��Ԫ�������ݼ��ж�Ӧ�ĵ�Ԫ���
train = ~test; %//train��Ԫ�صı��Ϊ��testԪ�صı��
train_data=data(train,:); %//�����ݼ��л��ֳ�train����������
train_target=target(:,train); %//����������Ĳ���Ŀ�꣬�ڱ�������ʵ�ʷ������
test_data=data(test,:); %//test������
test_target=target(:,test);
end