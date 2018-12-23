function x = GCsolve(A,b)
% ����б�����������Է�����
% 1.x0,r0,p0��ʼ��
    x = b;
    r = b-A*x;
    p = r;
    % 2.�������ϵĲ��������е���
    for k =1:2000
        a = dot(r(:),r(:))/dot(A*p,p);
        x = x +a*p;
        r1 = r - a*A*p;
        if sum(abs(r1))<0.00000001
            break
        end
        beta = dot(r1,r1)/dot(r,r);r = r1;
        p = r + beta*p;
    end
end 