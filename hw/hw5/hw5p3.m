function [out V]= hw5p3(A,v,M)

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
            v1 = V(iter-1,kiter);
            if kiter - A(iter-1) >=1
                p2 = P(iter-1,kiter-A(iter-1));
                v2 = V(iter-1,kiter-A(iter-1));
            else
                p2 = 0;
                v2 = 0;
            end
            P(iter,kiter) = max(p1,p2);
            %if P(iter,kiter)
            if (p1 && p2)
                if v1 >= (v2 + v(iter-1))   
                    V(iter,kiter) = V(iter-1,kiter);
                else
                    V(iter,kiter) = V(iter-1,kiter-A(iter-1)) + v(iter-1);
                end
            elseif p2
                V(iter,kiter) = V(iter-1,kiter-A(iter-1)) + v(iter-1);
            else
                V(iter,kiter) = V(iter-1,kiter);
            end
                
        else
            P(iter,kiter) = P(iter-1,kiter);
            V(iter,kiter) = V(iter-1,kiter);
        end
    end
    
end

out = [[0 A]' P];
V = [ [0 0  0:M];
      [[0 A]' [ 0 v]' V]];
end














