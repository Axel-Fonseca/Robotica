clear, close all, clc
L = 0.16;% Longitud entre ruedas TurtleBot(mts)
r = 0.033;% Radio de ruedas TurtleBot(mts)
%% Cuadrado
d = 0.1;% Distancia a recorer (mts)
t = 1;% Tiempo (s)
rad = pi/4;% Radianes
%tpmax = 2.84 rad/s         VMax = 0.22 m/s

recta(d,t,r)% Funcion linea recta
giro_eje(rad,t,r,L);% Funcion giro propio eje







giro_radio(R,L,d,t,r);% Funcion giro en radio

