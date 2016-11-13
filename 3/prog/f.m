function res = odefunc(t, u)
    global alpha beta k f
    res = [u(1) * (alpha * u(4) + k * u(2) + k * u(3) - f);
        u(2) * (alpha * u(4) + k * u(1) + k * u(3) - f);
        u(3) * (alpha * u(4) + k * u(1) + k * u(2) - f);
        beta * u(4) - f];
end