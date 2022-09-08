function [or,ol]=giro_radio(R,L,d,t,r)
    syms wr wl
    eq1 = R == L/2*(wr+wl)/(wr-wl);
    eq2 = d/t == r/2*(wr+wl);
    [or,ol] = solve([eq1, eq2], [wr, wl]) %Giro en R
end