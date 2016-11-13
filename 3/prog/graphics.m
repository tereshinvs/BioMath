% 15
% alpha = 0.1;
% beta = 0.8;
% k1 = 0.5;
% k2 = 1;

alpha = 0.1;
beta = 0.3;
k1 = 0.5;
k2 = 1;

tmp = 3*(alpha+beta) - k1 - k2;
tmp1 = alpha / tmp
tmp2 = alpha / tmp
tmp3 = alpha / tmp
tmp4 = (3*beta - k1 - k2) / tmp

hold on
xlabel('t');
ylabel('u');
for i = 1 : 10
    u1 = random('Uniform', 0, 1);
    u2 = random('Uniform', 0, 1 - u1);
    u3 = random('Uniform', 0, 1 - u1 - u2);
    u4 = 1 - u1 - u2 - u3;
    u0 = [u1; u2; u3; u4];
    tspan = 0 : 1 : 100;

    u = get_position_at(@odefunc, tspan, u0);

    plot(tspan, u(1, :));
    plot(tspan, u(2, :), 'g');
    plot(tspan, u(3, :), 'r');
    plot(tspan, u(4, :), 'm');
end
legend('u_1', 'u_2', 'u_3', 'u_4');
