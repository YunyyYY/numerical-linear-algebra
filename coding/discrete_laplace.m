clear;clc
%% initialization
s = 2;
n = 2^s;
h = 1/n;
v = zeros((n-1)^2, 1);
A = zeros((n-1)^2, (n-1)^2);
b = zeros((n-1)^2, 1);

%% Assignment
% extremely brainless solution
for i=2:n-2
    for j=2:n-2
        A(Vindex(i,   j,   n), Vindex(i,   j,   n)) = -4;
        A(Vindex(i,   j,   n), Vindex(i-1, j,   n)) = 1; 
        A(Vindex(i,   j,   n), Vindex(i,   j-1, n)) = 1;
        A(Vindex(i,   j,   n), Vindex(i,   j+1, n)) = 1; 
        A(Vindex(i,   j,   n), Vindex(i+1, j,   n)) = 1;
    end
end
for j=2:n-2
    A(Vindex(1,   j,   n), Vindex(1,   j,   n)) = -4;
    A(Vindex(1,   j,   n), Vindex(1,   j-1, n)) = 1; 
    A(Vindex(1,   j,   n), Vindex(1,   j+1, n)) = 1;
    A(Vindex(1,   j,   n), Vindex(2,   j,   n)) = 1;
    A(Vindex(n-1, j,   n), Vindex(n-1, j,   n)) = -4; 
    A(Vindex(n-1, j,   n), Vindex(n-2, j,   n)) = 1;
    A(Vindex(n-1, j,   n), Vindex(n-1, j-1, n)) = 1; 
    A(Vindex(n-1, j,   n), Vindex(n-1, j+1, n)) = 1;
end
for i=2:n-2
    b(Vindex(i,   1,   n)) = -i*h*(1-i*h);
    A(Vindex(i,   1,   n), Vindex(i,   1,   n)) = -4;
    A(Vindex(i,   1,   n), Vindex(i-1, 1,   n)) = 1; 
    A(Vindex(i,   1,   n), Vindex(i,   2,   n)) = 1;
    A(Vindex(i,   1,   n), Vindex(i+1, 1,   n)) = 1;
    A(Vindex(i,   n-1, n), Vindex(i,   n-1, n)) = -4; 
    A(Vindex(i,   n-1, n), Vindex(i-1, n-1, n)) = 1;
    A(Vindex(i,   n-1, n), Vindex(i,   n-2, n)) = 1; 
    A(Vindex(i,   n-1, n), Vindex(i+1, n-1, n)) = 1;
end

% four corners
b(Vindex(1,   1,   n)) = -h*(1-h);
A(Vindex(1,   1,   n), Vindex(1,   1,   n)) = -4;
A(Vindex(1,   1,   n), Vindex(1,   2,   n)) = 1; 
A(Vindex(1,   1,   n), Vindex(2,   1,   n)) = 1;

b(Vindex(1,   n-1, n)) = 0;
A(Vindex(1,   n-1, n), Vindex(1,   n-1, n)) = -4;
A(Vindex(1,   n-1, n), Vindex(1,   n-2, n)) = 1; 
A(Vindex(1,   n-1, n), Vindex(2,   n-1, n)) = 1;

b(Vindex(n-1, 1,   n)) = -(n-1)*h*(1-(n-1)*h);
A(Vindex(n-1, 1,   n), Vindex(n-1, 1,   n)) = -4;
A(Vindex(n-1, 1,   n), Vindex(n-2, 1,   n)) = 1; 
A(Vindex(n-1, 1,   n), Vindex(n-1, 2,   n)) = 1;

b(Vindex(n-1, n-1, n)) = -i*h*(1-i*h);
A(Vindex(n-1, n-1, n), Vindex(n-1, n-1, n)) = -4;
A(Vindex(n-1, n-1, n), Vindex(n-2, n-1, n)) = 1; 
A(Vindex(n-1, n-1, n), Vindex(n-1, n-2, n)) = 1;

%% solve with iterative method
[x, iter, ratio] = sor(A, b, 0.78, 1e-2, 1);

%% convert to Vmesh
V = zeros(n+1, n+1);
for i=1:(n+1)
    V(i, 1) = i*h*(1-i*h);
end
for i=2:n
    V(i, 2:n) = x((i-2)*(n-1)+1:(i-1)*(n-1))';
end

%% plot
[X,Y] = meshgrid(0:h:1);
surf(X,Y,V)
% mesh(X,Y,V)

%% helper function
function [index] = Vindex(i, j, n)
% assume i, j > 0 and i, j < n
index = (i-1)*(n-1) + j;
end