function res = get_jacob_at(nu1, nu2, nu3, nu4)
    global alpha beta k1 k2 f J u1 u2 u3 u4
    res = subs(J, [u1 u2 u3 u4], [nu1 nu2 nu3 nu4]);
end