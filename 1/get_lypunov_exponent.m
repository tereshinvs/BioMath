function result = get_lyapunov_exponent(u)
	EPS = 1e-6;
	f = @(u) u.*exp(0.081 ./ u - 0.001 ./ (u.^2) - 0.305);
	fs = @(u) exp(0.081 ./ u - 0.001 ./ (u.^2) - 0.305) .* (1 + 0.002 ./ (u.^2) - 0.081 ./ u);
	res = abs(fs(u));
	last = res;
	cur = u;
	n = 1;
	while abs(last - (res * abs(fs(cur))^(1/n)) > EPS
		res = res * abs(fs(cur);
		last = res^(1/n);
		cur = f(cur);
		n = n + 1;
	end
	result = last;
end