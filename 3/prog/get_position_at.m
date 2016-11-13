function res = get_position_at(func, T, u0)
    res = u0;
    for i = 2 : size(T, 2)
        tmp = res(:, end) + (T(i) - T(i - 1)) * func(T(i-1), res(:, end));
        res = [res, tmp];
    end
end