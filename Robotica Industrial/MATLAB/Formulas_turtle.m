clear, close all, clc
syms wr wl
L = 0.16; %Metros
r = 0.033; %Metros
d = 0.5;
t = 5;
%VMax = 0.22 m/s
%tpmax = 2.84 rad/s

%eq1 = R==L/2*(wr+wl)/(wr-wl);
eq2 = d/t == r/2*(wr+wl);
%eq3 = rad/t == r/L*(wr-wl);
eq4 = wr == wl;
eq5 = wr == -wl;

[or,ol] = solve([eq2, eq4], [wr, wl]) %Linea Recta
% [or,ol] = solve([eq3, eq5], [wr, wl]) %Giro propio eje
% [or,ol] = solve([eq1, eq2], [wr, wl]) %Giro en R