function x = GaussElim(A,b)
% ԭʼ��Gauss��Ԫ��
    [n,m] = size(A);
    if n~=m
        error('����������Ϊ����');
    end
    B = [A,b];
    for j=1:n
        for i=j+1:n
            if B(j,j)~=0
                m = -B(i,j)/B(j,j);
                B(i,:) = m*B(j,:)+B(i,:);
            end
        end
    end
    x = zeros(1,n);
    for j=n:-1:1
        x(j) = (B(j,n+1)-sum(B(j,j+1:n).*x(j+1:n)))/B(j,j);
    end
end