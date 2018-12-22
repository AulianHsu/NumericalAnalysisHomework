function [L,U] = LUdeco2(A)
% ��Ա����⣨���Խ��������LU�ֽ�
    [n,~] = size(A);
    L = zeros(n);
    for j=1:n-1
        L(j+1,j) = -A(j+1,j)/A(j,j);
        A(j+1,:) = L(j+1,j)*A(j,:)+A(j+1,:);
    end
    L = eye(n)-L;
    U = A;
end