function B=fce(A,R,type)
[n,m]=size(R);
B=zeros(1,m);
for j=1:m
    switch type
        case 1 %取小取大，主因素决定型
            B(j)=max(min([A;R(:,j)']));
        case 2 %乘积最大，主因素突出型
           B(j)=max([A.*R(:,j)']);
        case 3 %乘加，加权平均型
            B(j)=sum(A.*R(:,j)');
        case 4 %取小上界和型
            B(j)=min(1,sum(min([A;R(:,j)'])));
        case 5 %均衡平均型
            r0=sum(R(:,j)');
            B(j)=sum(min([A;R(:,j)'./r0]));
    end
end
B=B./sum(B); %归一化
            
            