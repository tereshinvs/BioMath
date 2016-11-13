function res = odefunc(t, u)
    global alpha beta k1 k2
    S = u(1) + u(2) + u(3);
    f = (alpha + beta) * (1 - S) * S + (k1 + k2) * (u(1) * u(2) + u(2) * u(3) + u(1) * u(3));
    res = [u(1) * (alpha * u(4) + k1 * u(2) + k2 * u(3) - f);
        u(2) * (alpha * u(4) + k1 * u(3) + k2 * u(1) - f);
        u(3) * (alpha * u(4) + k1 * u(1) + k2 * u(2) - f);
        u(4) * (beta * (u(1) + u(2) + u(3)) - f)];
end