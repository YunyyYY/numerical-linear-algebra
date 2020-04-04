%% main
function  [x, iter, ratio] = gauss_seidel(A, b, threshold, relative)
% for Gauss Seidel: w = 1; M = D + L; N = U
M = tril(A);
N = triu(A,1);
[~, n] = size(A);
x = zeros(n,1);
iter = 0;
if relative == 1
    % relative threshold set
    threshold = threshold * norm(A*x - b);
end
old = x;
while norm(A*x - b) > threshold
    old = x;
    iter = iter + 1;
    x = M\(b-N*x);
end
ratio = norm(A*x - b)/norm(A*old - b);
end


%% return with error
function  [x, iter, e] = gauss_seidel_with_error(A, b)
% for Gauss Seidel: w = 1; M = D + L; N = U
% Assume A is 3x3, hard-coded
M = tril(A);
N = triu(A,1);
x = zeros(3,1);
iter = 0;
e = zeros(1,40);
while norm(A*x - b) > 1e-7
    iter = iter + 1;
    x = M\(b-N*x);
    if iter < 41
        e(iter) = norm(A*x - b);
    end
end
if iter < 40
    e(iter+1:end) = e(iter);
end
end