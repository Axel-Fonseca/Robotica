clear
close all
clc
l1=5;
l2=20;
l3=10;
qz=[0,0,0];
q1=[pi/2,-pi/2,0];
q2=[-pi/3,0,-pi/4];
L(1)=Link([0 l1 0 -pi/2 0]);
L(2)=Link('revolute','d',0,'a',l2,'alpha',0,'offset',0);
L(3)=Link([0 0 l3 0 0]);
antro=SerialLink(L,'name','antropomorfico')
%%
antro.teach(qz);
%%
[q,qd,qdd]=jtraj(q1,q2,50)
%%
antro.plot(q)
%%
T=simplify(antro.fkine(q1));
T2=simplify(antro.fkine(q2));

TC=ctraj(T,T2,50)

qi=antro.ikcon(TC);
qii=antro.ikunc(TC);

antro.plot(qi)
%%
figure
t=1:1:50;
subplot(3,1,1)
plot(t,q)
title('Coordenadas Articulares')
legend('q1','q2','q3','Location','bestoutside')

subplot(3,1,2)
plot(t,qd)
title('Velocidades Articulares')
legend('qd1','qd2','qd3','Location','bestoutside')

subplot(3,1,3)
plot(t,qdd)
title('Aceleraciones Articulares')
legend('qdd1','qdd2','qdd3','Location','bestoutside')

figure
subplot(2,1,1)
plot(t,TC.transl)
title('Posiciones Cartesianas')
legend('X','Y','Z','Location','bestoutside')

subplot(2,1,2)
plot(t,TC.torpy)
title('Orientación RPY')
legend('R','P','Y','Location','bestoutside')