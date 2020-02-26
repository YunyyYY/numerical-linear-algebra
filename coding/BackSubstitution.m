function x = BackSubstitution(R, y)
[n, ~] = size(y);
x = zeros(n,1);
for r=n:-1:1
    rx = y(r) - sum(R(r, r+1:n)*x(r+1:n,1));
    x(r, 1) = rx / R(r, r);
end
end