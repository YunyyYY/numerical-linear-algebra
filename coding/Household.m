function [Q, R] = Household(A)
% QR decomposition via the Household method
    [W, R] = house(A);
    Q = formQ(W);
end

function [W, A] = house(A)
% computes factor R for A
    [m, n] = size(A);
    W = zeros(m, n);
    for k = 1:n
        v = A(k:m, k);
        v(1) = sign(v(1))*norm(v) + v(1); 
        v = v/norm(v);
        W(k:m, k) = v/norm(v);
        A(k:m, k:n) = A(k:m, k:n) - 2*v*(v'*A(k:m, k:n));
    end
end

function Q = formQ(W)
% compute Q in reverse, from the innest layer to the outside
    [m,n] = size(W);
    Q = eye(m);
    for k = n:-1:1
        v = W(k:m,k);
        Q(k:m,:) = Q(k:m,:) - 2*v*(v'*Q(k:m, :));
    end 
end