N = 10
F = @(x) 2 * x(1)^3 - x(2)^2 - 1
G = @(x) x(1) * x(2)^3 - x(2) - 4
dFdx = @(x) 6 * x(1)^2
dFdy = @(x) -2*x(2)
dGdx = @(x) x(2)^3
dGdy = @(x) 3 * x(1) * x(2)^2 - 1
x0 = [1; 1]
for i = 1 : N
	A = [dFdx(x0) dFdy(x0); dGdx(x0) dGdy(x0)];
	b = [-F(x0) + x0(1) * dFdx(x0) + x0(2) * dFdy(x0); -G(x0) + x0(1) * dGdx(x0) + x0(2) * dGdy(x0)];
	x0 = linsolve(A, b)
end
