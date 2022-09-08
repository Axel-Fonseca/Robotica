clear all, clc
%% ---ROBOT PIZZA (RRRR)--- 
syms t1 t2 t3 t4; %Variables para qs
qh=[0,0,2.7,-1.3]; %Posición HOME
qs=[t1,t2,t3,t4]; %Posición para MTH simbólica
q1=[-1.2,1,0,-1.6]; %Posición media
q2=[0,1.53,0,0]; %Posición final
l1=5; l2=20; l3=15; l4=10; %Longitudes eslabones
 
%% Robot
E(1)=Link('revolute', 'd', l1, 'a', 0, 'alpha', pi/2);  %Eslabón rotacional 1
E(2)=Link('revolute', 'd', 0, 'a', l2, 'alpha', 0);     %Eslabón rotacional 2
E(3)=Link('revolute', 'd', 0, 'a', l3, 'alpha', 0);     %Eslabón rotacional 3
E(4)=Link('revolute', 'd', 0, 'a', l4, 'alpha', 0);     %Eslabón rotacional 4
E(1).qlim=[-pi pi]; E(2).qlim=[-pi pi]; E(3).qlim=[-pi pi]; E(4).qlim=[-pi pi]; %Rango de movimiento eslabones
 
Lirusisa=SerialLink(E,'name','Pikza') %Creación robot con eslabones E
Lirusisa.teach(qh) %Posición robot inicial HOME (qh)
 
%% Trayectoria de posición articular (joint)
[q,qd,qdd]=jtraj(qh,q1,50) %Trayectoria de posición articular y matrices articulares (posición, velocidad y aceleración)
Lin={'b','LineWidth',1}; %Linea trayectoria
Lirusisa.plot(q) %Plot trayectoria posición
q_matlab=abs(q*0.318309886) %Conversion q a Matlab-servos
 
%% Trayectoria cartesiana 
T=simplify(Lirusisa.fkine(q1)); %Matriz de posición 1 (q1) en coordenadas cartesianas
T2=simplify(Lirusisa.fkine(q2)); %Matriz de posición 2 (q2) en coordenadas cartesianas
TC=ctraj(T,T2,50); %Trayectoria cartesiana entre 2 puntos
 
qi=Lirusisa.ikcon(TC); %Iteraciones
qii=Lirusisa.ikunc(TC);
qiii=Lirusisa.fkine(qi);
 
Lirusisa.plot(qi) %Trayectoria plot
 
%% Matriz Transformación Homogénea simbólica y Jacobiano
MTH=double(vpa(Lirusisa.fkine(qs),4)) %MTH(qs)
XYZ=simplify(transl(MTH)) %Jacobiano
t1d=diff(XYZ,t1) %Jacobiano articulacion 1
t2d=diff(XYZ,t2) %Jacobiano articulacion 2
t3d=diff(XYZ,t3) %Jacobiano articulación 3
t4d=diff(XYZ,t4) %Jacobiano articulación 4
 
MTH2=double(vpa(Lirusisa.fkine(qh),4))%Matriz Transformación Homogénea (qh) HOME
 
%% Gráficas 
figure
t=1:1:50;
subplot(3,1,1)
plot(t,q)
title('Coordenadas Articulares')
legend('q1','q2','q3','q4','Location','bestoutside')
 
subplot(3,1,2)
plot(t,qd)
title('Velocidades Articulares')
legend('qd1','qd2','qd3','qd4','Location','bestoutside')
 
subplot(3,1,3)
plot(t,qdd)
title('Aceleraciones Articulares')
legend('qdd1','qdd2','qdd3','qdd4','Location','bestoutside')
 
figure
subplot(3,1,1)
plot(t,TC.transl)
title('Posiciones Cartesianas')
legend('X','Y','Z','Location','bestoutside')
 
subplot(3,1,2)
plot(t,TC.torpy)
title('Orientación RPY')
legend('R','P','Y','Location','bestoutside')
 
subplot(3,1,3)
plot(t,TC.toeul)
title('Orientación Euler')
legend('Phi','Theta','Psi','Location','bestoutside')
