function B=fce(A,R,type)
[n,m]=size(R);
B=zeros(1,m);
for j=1:m
    switch type
        case 1 %ȡСȡ�������ؾ�����
            B(j)=max(min([A;R(:,j)']));
        case 2 %�˻����������ͻ����
           B(j)=max([A.*R(:,j)']);
        case 3 %�˼ӣ���Ȩƽ����
            B(j)=sum(A.*R(:,j)');
        case 4 %ȡС�Ͻ����
            B(j)=min(1,sum(min([A;R(:,j)'])));
        case 5 %����ƽ����
            r0=sum(R(:,j)');
            B(j)=sum(min([A;R(:,j)'./r0]));
    end
end
B=B./sum(B); %��һ��
            
            