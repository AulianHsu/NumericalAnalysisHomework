clc,clear;
% n =
n = 10;
A = diag(4*ones(1,n))+diag(-ones(1,n-1),-1)+diag(-ones(1,n-1),1);
I = -eye(n);
AA = zeros(n*n);
for i = 1:n
    AA(n*i-n+1:n*i,n*i-n+1:n*i) = A;
end
for i =1:n-1
    AA(n*i-n+1:n*i,n*(i+1)-n+1:n*(i+1)) = I;
    AA(n*(i+1)-n+1:n*(i+1),n*i-n+1:n*i) = I;
end
h = 1/(n-1);
f = (3-2)*h^2*ones(n*n,1);
x = linspace(0,1,n);
v = meshgrid(x.*(1-x));
% ·�Ӵ��ˣ���Ȼ������ֱ�ӷ������Է����������������⣬�����ܴ��б߽�����
% ֮�󽫸��õ�������������
U = LUsolve(AA,f);
U = reshape(U,10,10);
U = U + v;
surf(U);
