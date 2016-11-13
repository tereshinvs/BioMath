N = 5;
dim2_system = @(u, v) [u .* exp(0.081 ./ u - 0.001 ./ v.^2 - 0.305), u];

u1 = 0.01298008924;
u2 = 0.25259368125;

u = zeros(N, 1);
v = zeros(N, 1);

u0 = [0.05 0.1 0.2 0.3 0.4 0.3 0.15 0.05 0.4 0.25 0.25];
v0 = [0.05 0.4 0.3 0.1 0.4 0.7 0.6 0.3	0.1 0.6 0.1];

hold on;
for i = 1 : size(u0, 2)
	u(1) = u0(i);
	v(1) = v0(i);
	for j = 2 : N
		res = dim2_system(u(j - 1), v(j - 1));
		u(j) = res(1);
		v(j) = res(2);
	end
	u
	v
	plot(u, v, 'Color', rand(3, 1), 'Marker', '.', 'MarkerSize', 8);
end
plot(u1, u1, 'Marker', 'o', 'MarkerSize', 8, 'MarkerEdgeColor', 'r');
plot(u2, u2, 'Marker', 'o', 'MarkerSize', 8, 'MarkerEdgeColor', 'r');

xlabel('u');
ylabel('v');