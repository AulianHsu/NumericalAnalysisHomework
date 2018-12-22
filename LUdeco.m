function [L,U] = LUdeco(A)
% �����LU�ֽ⣬���뷽��A�����L U����
    [n,m] = size(A);
    if n~=m
        error('����ľ������Ϊ����')
    end
    L = zeros(n);
    for j=1:n
        for i=j+1:n
            if A(j,j)~=0
                L(i,j) = -A(i,j)/A(j,j);
                A(i,:) = L(i,j)*A(j,:)+A(i,:);
            end
        end
    end
    L = eye(n)-L;
    U = A;
end