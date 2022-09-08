function [or,ol]=recta(d,t,r)
    syms wr wl
    eq2 = d/t == r/2*(wr+wl);
    eq4 = wr == wl;
    [or,ol] = solve([eq2, eq4], [wr, wl]) %Linea Recta
end