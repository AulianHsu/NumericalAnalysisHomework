function x = symzg(n)
% ׷�Ϸ��������ԽǾ���ֽ�������Է�����ķ���,����ʹ��LU�ֽ�,�����Խ��ߵ�4���ζԽ���Ϊ-1�����ԽǾ��������������
% �������nΪ���̵Ľ�����bΪ�Ҳೣ����˴�Ϊ f*h^2
    b = -3;
    % ���Խ���Ԫ������A�����LU�ֽ���U
    U = 4*ones(1,n);
    % ���´ζԽ���Ԫ��B���������в�������
    B = -1*ones(1,n-1);
    L = zeros(1,n-1);
    % ����LU�ֽ⣬L���-1�Խ��ߵ�Ԫ�أ�U���0�Խ���Ԫ�أ�+1�Խ���Ԫ�ز���
    for j=1:n-1
        L(j) = -B(j)/U(j);
        U(j+1) = B(j)*L(j)+U(j+1);
    end
    L,U
    % ���Ly=b
    y = zeros(1,n);
    y(1) = b;
    for k=2:n
        y(k) = b-L(k-1)*y(k-1);
    end
    % ���Ux=y
    x(n) = y(n)/U(n);
    for k =n-1:-1:1
        x(k) = (y(k)+x(k+1))/U(k);
    end
end