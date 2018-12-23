function x = PGCsolve(A,b)
% Ԥ��������б�����������Է�����
    M = diag(diag(A));
    x = b;
    r = b-A*x;
    Z = LUsolve(M,r)';
    p = Z;
    % 2.�������ϵĲ��������е���
    for k =1:2000
        a = dot(Z,r)/dot(A*p,p);
        x = x +a*p;
        r1 = r - a*A*p;
        Z1 = LUsolve(M,r1)';
        if sum(abs(r1))<0.00000001
            break
        end
        beta = dot(Z1,r1)/dot(Z,r);
        r = r1; Z = Z1;
        p = Z + beta*p;
    end
end 