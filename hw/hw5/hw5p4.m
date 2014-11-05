function out = hw5p4(X,Y)
n = length(X);
m = length(Y);

C = zeros(n+1,m+1);
for iter = 2:n+1
    for jiter = 2:m+1
        if X(iter-1) == Y(jiter-1)
            C(iter,jiter) = 1 + C(iter-1,jiter-1);
        else
            C(iter,jiter) = max(C(iter,jiter-1),C(iter-1,jiter));
        end
    end
end


out = C;



end
