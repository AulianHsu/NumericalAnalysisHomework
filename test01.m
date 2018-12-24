clc,clear;
%% �����㷨��������ʱ��

% �������Է������븨�������ĸ�ֵ
% �����ܶ�n
n = 10;
% �ԽǾ���Aii
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
% ���췽���Ҷ�
h = 1/(n-1);
f = (3-2)*h^2*ones(n*n,1);
x = linspace(0,1,n);
% v = u - x(1-x)
v = meshgrid(x.*(1-x))';
%% ʱ����Կ�ʼ

%% LU�ֽⷨ�����ʱ�䣬�������ͼ
tic
U = LUsolve(AA,f);
toc
u = reshape(U,n,n)+v;
surf(u);

%% ��˹��Ԫ�������ʱ�估�����ͼ
tic
U = GaussElim(AA,f);
toc
u = reshape(U,n,n)+v;
surf(u);

%% Cholesky�ֽ����ʱ�估�����ͼ
tic
U = ChlskSolve(AA,f);
toc
u = reshape(U,n,n)+v;
surf(u);

%% Jacobi������ʽ�����ʱ�估�����ͼ
u = Jacobi(10);
surf(u);

%% Gauss-Seidel ������ʽ�����ʱ�估�����ͼ
u = GSiter(10);
surf(u);

%% ���ɳڵ�����Gauss-Seidel�������ʱ�估�����ͼ
u = GSiterSOR(10,1.5);
surf(u);

%% ��Gauss-Seidel ������ʽ�ĵ���ʱ�估�����ͼ
u = GSBlockIter(10);
surf(u);

%% �鳬�ɳڵ����ⷨ �ĵ���ʱ�估������ͼ
u = GSBSORiter(10,1.5);
surf(u)

%% ����б���� ������ʱ�估������ͼ
tic
U = GCsolve(AA,f);
toc
u = reshape(U,n,n)+v;
surf(u);

%% Ԥ�����Ĺ���б����
tic
U = PGCsolve(AA,f);
toc
u = reshape(U,n,n)+v;
surf(u);
