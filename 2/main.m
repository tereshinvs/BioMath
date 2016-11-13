EPS = 1e-3
gamma = 0 : EPS : 1
line1 = 4 .* (1 - gamma) .* (gamma + 1).^3 ./ (gamma.^2 + 2 .* gamma - 1).^2
x1 = -1 + sqrt(2)

hold on
plot(gamma, line1)
plot([x1 x1], [0 300], 'r')
plot([1 1], [0 300], 'g')
axis([0 1.3 0 300])
text('String', '$$\gamma$$', 'Interpreter', 'LaTex', 'Position', [0.7 -20.0], 'FontSize', 14);
text('String', '$$\alpha$$', 'Interpreter', 'LaTex', 'Position', [-0.125 170], 'FontSize', 14);

text('String', '1', 'Position', [0.15 50], 'FontSize', 18)
text('String', '2', 'Position', [0.32 50], 'FontSize', 18)
text('String', '3', 'Position', [0.45 50], 'FontSize', 18)
text('String', '4', 'Position', [0.8 50], 'FontSize', 18)
text('String', '5', 'Position', [1.2 50], 'FontSize', 18)

gca
cla
hold on
alpha = 20
gamma = 0.2
EPS_x = 0.1
EPS_y = 0.1
mysystem = @(x, y) [alpha .* x.^2 ./ (1 + x) .* (1 - x) - x.*y, -gamma .* y + x .* y]
[x, y] = meshgrid(0 : EPS_x : 2, 0 : EPS_y : 5);
u = alpha .* x.^2 ./ (1 + x) .* (1 - x) - x.*y
v = -gamma .* y + x .* y
quiver(x, y, u, v);
axis([0 2.1 0 5.1])
