clear
global alpha beta k1 k2 u1 u2 u3 u4 f J
syms alpha beta k1 k2 u1 u2 u3 u4 S
S = u1 + u2 + u3;
f = (alpha + beta)*(1 - S)*S + (k1 + k2)*(u1*u2 + u1*u3 + u2*u3);
L1 = u1*(alpha*u4 + k1*u2 + k2*u3 - f);
L2 = u2*(alpha*u4 + k1*u3 + k2*u1 - f);
L3 = u3*(alpha*u4 + k1 *u1 + k2*u2 - f);
L4 = u4*(beta*(u1+u2+u3) - f);
sol = solve([L1 L2 L3 L4], u1, u2, u3, u4)
sol.u1
sol.u2
sol.u3
sol.u4
%return;

J = jacobian([L1 L2 L3 L4], [u1 u2 u3 u4]);
syms k_1 k_2 u_1 u_2 u_3 u_4
latex(simplify(subs(J, [k1 k2 u1 u2 u3 u4], [k_1 k_2 u_1 u_2 u_3 u_4])))

% 1
tmp1 = 0;
tmp2 = 0;
tmp3 = 0;
tmp4 = 1;
res = simplify(get_jacob_at(tmp1, tmp2, tmp3, tmp4))
simplify(eig(res))

% 2-4
tmp1 = 1;
tmp2 = 0;
tmp3 = 0;
tmp4 = 0;
res = simplify(get_jacob_at(tmp1, tmp2, tmp3, tmp4))
latex(subs(res, [k1 k2 u1 u2 u3 u4], [k_1 k_2 u_1 u_2 u_3 u_4]))
simplify(eig(res))

% 5
tmp1 = 1/3;
tmp2 = 1/3;
tmp3 = 1/3;
tmp4 = 0;
res = simplify(get_jacob_at(tmp1, tmp2, tmp3, tmp4))
latex(subs(res, [k1 k2 u1 u2 u3 u4], [k_1 k_2 u_1 u_2 u_3 u_4]))
simplify(eig(res))

% 6-8
tmp1 = alpha / (alpha + beta);
tmp2 = 0;
tmp3 = 0;
tmp4 = beta / (alpha + beta);
res = simplify(get_jacob_at(tmp1, tmp2, tmp3, tmp4))
latex(subs(res, [k1 k2 u1 u2 u3 u4], [k_1 k_2 u_1 u_2 u_3 u_4]))
simplify(eig(res))

% 9-11
tmp1 = k1 / (k1+k2);
tmp2 = k2 / (k1+k2);
tmp3 = 0;
tmp4 = 0;
res = simplify(get_jacob_at(tmp1, tmp2, tmp3, tmp4))
latex(subs(res, [k1 k2 u1 u2 u3 u4], [k_1 k_2 u_1 u_2 u_3 u_4]))
simplify(eig(res))

% 12-14
tmp = (alpha+beta)*(k1+k2) - k1*k2;
tmp1 = alpha * k1 / tmp;
tmp2 = alpha * k2 / tmp;
tmp3 = 0;
tmp4 = (k1+k2)*beta - k1*k2;
res = simplify(get_jacob_at(tmp1, tmp2, tmp3, tmp4))
latex(subs(res, [k1 k2 u1 u2 u3 u4], [k_1 k_2 u_1 u_2 u_3 u_4]))
simplify(eig(res))

% 15
tmp = 3*(alpha+beta) - k1 - k2;
tmp1 = alpha / tmp;
tmp2 = alpha / tmp;
tmp3 = alpha / tmp;
tmp4 = (3*beta - k1 - k2) / tmp;
res = simplify(get_jacob_at(tmp1, tmp2, tmp3, tmp4))
latex(subs(res, [k1 k2 u1 u2 u3 u4], [k_1 k_2 u_1 u_2 u_3 u_4]))
simplify(eig(res))

