function [or,ol]=giro_eje(rad,t,r,L)
    syms wr wl
    eq3 = rad/t == r/L*(wr-wl);
    eq5 = wr == -wl;
    [or,ol] = solve([eq3, eq5], [wr, wl]) %Giro propio eje
end