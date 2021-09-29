function A=qujian(A,a,b,c,d)
M=max((a-c),d-b);
   for i=1:size(A,1)  
    if A(i)<a
        A(i)=1-(a-A(i))/M;
    else
        if (A(i)>a && A(i)<b)
        A(i)=1;
        else
            A(i)=1-(A(i)-b)/M;
        end
    end
   end
end