%% main
function  [x, iter, ratio] = jacobi(A, b, threshold, relative)
% assuming input satisfies the convergence criterion
[~, n] = size(A);
x = zeros(n, 1);
iter = 0;
if relative == 1
    % relative threshold set
    threshold = threshold * norm(A*x - b);
end
old = x;
while norm(A*x - b) > threshold
    old = x;
    iter = iter + 1;
    for i=1:n
        sigma = 0;
        for j=1:n
            if j ~= i
                sigma = sigma + A(i,j)*x(j);
            end
        end
        x(i) = (b(i) - sigma)/A(i,i);
    end
end
ratio = norm(A*x - b)/norm(A*old - b);
end
    
%% return with iteration and loss

function  [x, iter, e] = jacobi_with_error(A, b)
% assuming input satisfies the convergence criterion
[~, n] = size(A);
x = zeros(n, 1);
iter = 0;
e = zeros(1,40);
while norm(A*x - b) > 1e-7
    iter = iter + 1;
    for i=1:n
        sigma = 0;
        for j=1:n
            if j ~= i
                sigma = sigma + A(i,j)*x(j);
            end
        end
        x(i) = (b(i) - sigma)/A(i,i);
    end
    % for plot use
    if iter < 41
        e(iter) = norm(A*x - b);
    end
end
if iter < 40
    e(iter+1:end) = e(iter);
end
end

    