function  [Q, R] = GramSchmidt(A)
% Assume that A is full rank
    [m, n] = size(A);
    Q = zeros(m, n);
    R = zeros(n, n);
    for j = 1:n
        q = A(:, j);
        for k = 1:j-1
            R(k,j) = Q(:, k)' * q;
            q = q - R(k,j) * Q(:, k);
        end
        R(j, j) = norm(q);
        Q(:, j) = q / R(j, j);  % assumed A is full rank here
    end
end