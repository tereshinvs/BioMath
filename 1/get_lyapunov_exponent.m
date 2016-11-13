function result = get_lyapunov_exponent(u)
	EPS = 1e-9;
	f = @(u) u.*exp(0.081 ./ u - 0.001 ./ (u.^2) - 0.305);
	fs = @(u) exp(0.081 ./ u - 0.001 ./ (u.^2) - 0.305) .* (1 + 0.002 ./ (u.^2) - 0.081 ./ u);
	sum = log(abs(fs(u)));
	res = sum;
	cur = u;
	n = 1;
	while abs(res - (sum + log(abs(fs(f(cur)))))/(n + 1)) > EPS
		cur = f(cur);
		sum = sum + log(abs(fs(cur)));
		n = n + 1;
		res = sum / n;
		n = n + 1;
	end
	result = res;
end