function out= hw5p3(A,V,M)

n = length(A);

P = zeros(n+1,M+1);
V = zeros(size(P));
for iter = 0:n
    P(iter+1,1) = 1; 
end
for kiter = 1:M
    P(1,kiter+1) = 0;
end
for kiter = 2:M+1
    for iter = 2:n+1
        if kiter >= A(iter-1)
            p1 = P(iter-1,kiter);
            if kiter - A(iter-1) >=1
                p2 = P(iter-1,kiter-A(iter-1));
            else
                p2 = 0;
            end
            P(iter,kiter) = max(p1,p2);
        else
            P(iter,kiter) = P(iter-1,kiter);
        end
    end
    
end

out = [[0 A]' P];
end














