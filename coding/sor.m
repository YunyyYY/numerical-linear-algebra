%% main
function  [x, iter, ratio] = sor(A, b, w, threshold, relative)
D = diag(diag(A)); % diag returnr column vec for matrix and matrix for vec
U = triu(A, 1);
L = tril(A, -1);
M = w*D + L;
N = (1-w)*D + U ;
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
function  [x, iter, e] = sor_with_error(A, b, w)
D = diag(diag(A)); % diag returnr column vec for matrix and matrix for vec
U = triu(A, 1);
L = tril(A, -1);
M = w*D + L;
N = (1-w)*D + U ;
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