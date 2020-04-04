ws = 0.01:0.03:2;
iters = zeros(1, 67);
for i = 1:67
    [~, iters(i), ~] = sor_with_error(A, b, ws(i));
end

plot(ws, iters)
hold on
plot(ws(27), iters(27), 'rx', 'LineWidth',0.5, 'MarkerSize',10)
annotation('textarrow',[0.5, 0.45],[0.2, 0.14],'String','w_{min}','Color','red')


