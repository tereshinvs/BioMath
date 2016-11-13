format long

%STEP = 0.0001
%LAST_U = 1
%U0 = 0.1

%f = @(u) u.*exp(0.081 ./ u - 0.001 ./ (u.^2) - 0.305)
%u = 0 : STEP : LAST_U;
%hold on
%plot(u, f(u))
%plot(u, u, 'r')
%axis square

%ffzero = @(u) u*exp(0.081 / u - 0.001 / u - 0.305) - u
%x = fzero(ffzero, U0)

%us1 = (0.081 - sqrt(0.005341)) / 0.61
%us2 = (0.081 + sqrt(0.005341)) / 0.61
%fs = @(u) exp(0.081 ./ u - 0.001 ./ (u.^2) - 0.305) .* (1 + 0.002 ./ (u.^2) - 0.081 ./ u)
%fs_us1 = fs(us1)
%fs_us2 = fs(us2)

%ff = @(u) f(f(u))
%plot(u, ff(u), 'g')

%fff = @(u) f(f(f(u)))
%plot(u, fff(u), 'm')

%fffff = @(u) f(f(f(f(f(u)))))
%plot(u, fffff(u), 'm')

%legend('u_{t+1} = f(u_t)', 'u_{t+1} = u_t', 'u_{t+1} = f(f(u_t))')

figure
u = 0.001 : 0.005 : 1.0;
lyapunov = zeros(1, size(u, 2));
for i = 1 : size(u, 2)
	u(i)
	lyapunov(i) = get_lyapunov_exponent(u(i));
end
lyapunov
plot(u, lyapunov, 'm')
xlabel('u_0')
ylabel('h(u_0)')