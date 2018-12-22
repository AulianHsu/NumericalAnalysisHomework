function x = symzg(n)
% 追赶法，对三对角矩阵分解求解线性方程组的方法,这里使用LU分解,对主对角线的4，次对角线为-1的三对角矩阵进行求解与分组
% 传入参数n为方程的阶数，b为右侧常数项此处为 f*h^2
    b = -3;
    % 主对角线元素数组A，存放LU分解后的U
    U = 4*ones(1,n);
    % 上下次对角线元素B，在运算中不做更新
    B = -1*ones(1,n-1);
    L = zeros(1,n-1);
    % 进行LU分解，L存放-1对角线的元素，U存放0对角线元素，+1对角线元素不变
    for j=1:n-1
        L(j) = -B(j)/U(j);
        U(j+1) = B(j)*L(j)+U(j+1);
    end
    L,U
    % 求解Ly=b
    y = zeros(1,n);
    y(1) = b;
    for k=2:n
        y(k) = b-L(k-1)*y(k-1);
    end
    % 求解Ux=y
    x(n) = y(n)/U(n);
    for k =n-1:-1:1
        x(k) = (y(k)+x(k+1))/U(k);
    end
end