%% (0) prepare data
f = @(x)sin(10*x);
m = 100;
n = 15;
xraw = linspace(0,1,m);
b = f(xraw)';
A = zeros(m,n); 

for r=1:m
    for c=1:n
        A(r,c) = xraw(r)^(c-1);
    end
end

%% (1) use modifed Gram Schmidt.
disp("--- Modifed Gram Schmidt ---")
[Qm, Rm] = mgs(A);
qb = Qm' * b;
xmgs = BackSubstitution(Rm, qb);
yinter1 = poly(xraw, xmgs');
polyPlot(xraw, b', yinter1);
disp(xmgs)

%% (2) use Householder
disp("--- Householder ---")
[Qm2, Rm2] = Household(A);
qb = Qm2' * b;
xhh = BackSubstitution(Rm2(1:n,:), qb(1:n,:));
yinter2 = poly(xraw, xhh');
polyPlot(xraw, b', yinter2);
disp(xhh)

%% (3) use SVD
[U,S,V] = svd(A);
bsvd = U' * b;
Rsvd = S * V';
xsvd = BackSubstitution(Rsvd(1:n,:), bsvd(1:n,:));
yinter3 = poly(xraw, xsvd');
polyPlot(xraw, b', yinter3);
disp(xsvd)

%% (4) MATLAB backslash
xbk = A \ b;
yinter4 = poly(xraw, xbk');
polyPlot(xraw, b', yinter4);
sprintf(' %5.f',xbk)

%% (5) helper functions
function y = poly(x, coef)
[~,m] = size(x);
[~,n] = size(coef);
y = zeros(1, m);
for idx=1:m
    for i=1:n
        y(idx) = y(idx) + coef(i)*x(idx)^i;
    end
end
end

function polyPlot(xx, ytrue, yinter)
hold on
scatter(xx, ytrue, 18,'xk')
plot(xx, yinter,'r','LineWidth',1.5)
end


