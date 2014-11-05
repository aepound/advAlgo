function [C] = hw5p4(A,Y)
X = A;

n = length(A);
m = length(Y);

C = zeros(n+1,m+1);

L = zeros(n+1,n+1);
M = -inf(n+1,n+1);
F = zeros(size(C));

for iter = 2:n+1
    for jiter = 2:n+1
        
        if 0
        kiter = jiter;
        if A(iter-1) > M(iter-1,kiter) 
%            C(iter,jiter) = 1 + C(iter-1,jiter-1);
            L(iter,kiter) = L(iter - 1,kiter) + 1;
            M(iter,kiter) = A(iter-1);
            
        else
%            C(iter,jiter) = max(C(iter,jiter-1),C(iter-1,jiter));
            if L(iter-1,kiter-1)+1 > L(iter-1,kiter)
                M(iter,kiter) = A(iter-1);
                L(iter,kiter) = L(iter-1,kiter-1)+1;
            else
                L(iter,kiter) = L(iter-1,kiter);
                M(iter,kiter) = M(iter-1,kiter);
            end
        end
        else
            if X(iter-1) < Y(jiter-1)
                C(iter,jiter) = 1+C(iter-1,jiter-1);
                F(iter,jiter) = 1;
            else
                [C(iter,jiter) ii] = max([C(iter-1,jiter),C(iter,jiter-1)]);
                if ii == 1
                    F(iter-1,jiter) = 2;
                else
                    F(iter,jiter-1) = 3;
                end
            end
            
        end
    end
end

ii = n;
k = n;
while k ~= 0 && ii ~= 0
    if F(ii,k) == 1
        disp(A(iter-1))
        k = k-1;
        ii = ii-1;
    elseif F(ii,k) == 2
        ii = ii-1;
    else
        k = k-1;
    end
end


out = C;
%out = [L; M];



end
