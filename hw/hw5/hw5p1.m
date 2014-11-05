function out = unionfind(N)

A = -ones(1,N);
H = ones(size(A));


if 0
    for iter = 1:3:N
        if iter+1 <= N
            [A,H] = unionx(A,H,iter,iter+1);
        end
        if iter+2 <= N
            [A,H] = unionx(A,H,iter,iter+2);
        end
    end
    step = 3;
    while step < N/2
        for iter = 1:2*step:N
            if iter+step <= N
                [A, H] = unionx(A,H,iter, iter+step);       
            end
        end
        step = 2*step;    
    end
    [A,H] = unionx(A,H,1,N);

else
   
    step = .75;
    while step < N/2
        for iter = 1:max(2*step,3):N
            if iter+step <= N
                [A, H] = unionx(A,H,iter, iter+ceil(step));       
            end
        end
        step = 2*step;    
    end
    [A,H] = unionx(A,H,1,N);
    
end


out = [A; H];
end


function x = findx(A,i)
    if A(i) == -1;
        x = i;
        return;
    else
        x = findx(A,A(i));
    end
end
function [Ap H] = unionx(A,H,x,y)
    rootx = findx(A,x);
    rooty = findx(A,y);
    if rootx == rooty
        Ap = A;
        return;
    else
        if H(rootx) < H(rooty)
            A(rootx) = rooty;
        elseif H(rooty) < H(rootx)
            A(rooty) = rootx;
        else
            A(rooty) = rootx;
            H(rootx) = H(rootx)+1;
        end
        Ap = A;
    end
end
            