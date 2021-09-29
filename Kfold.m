Data = rand(9,3);%创建维度为9×3的随机矩阵样本
indices = crossvalind('Kfold', 9, 3);%将数据样本随机分割为3部分
for i = 1:3 %循环3次，分别取出第i部分作为测试样本，其余两部分作为训练样本
    test = (indices == i);
    train = ~test;
    trainData = Data(train, :);
    testData = Data(test, :);
end

[M,N]=size(data);%//数据集为一个M*N的矩阵，其中每一行代表一个样本
indices=crossvalind('Kfold',data(1:M,N),10);%//进行随机分包
for k=1:10 %//交叉验证k=10，10个包轮流作为测试集
test = (indices == k); %//获得test集元素在数据集中对应的单元编号
train = ~test; %//train集元素的编号为非test元素的编号
train_data=data(train,:); %//从数据集中划分出train样本的数据
train_target=target(:,train); %//获得样本集的测试目标，在本例中是实际分类情况
test_data=data(test,:); %//test样本集
test_target=target(:,test);
end