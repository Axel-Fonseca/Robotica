% Robot Puma
L(1)=Link([0 0 0 pi/2 0]);
L(2)=Link([0 0 43 0 0]);
L(3)=Link([0 15 2 -pi/2 0]);
L(4)=Link([0 43 0 pi/2 0]);
L(5)=Link([0 0 0 -pi/2 0]);
L(6)=Link([0 0 0 0 0]);
L(1).qlim=[-2.8 2.8];
L(2).qlim=[-pi/4 5*pi/4];
L(3).qlim=[-5*pi/4 pi/4];
L(4).qlim=[-2 pi];
L(5).qlim=[-pi/2 pi/2];
L(6).qlim=[-3*pi/2 3*pi/2];
puma=SerialLink(L,'name','PUMA');
%% Movimiento
P1=SE3(-40,0,-10)
x=58;
y=30;
P2=SE3(x,y,-40)
q1=puma.ikine6s(P1);
q2=puma.ikine6s(P2);
t=[0:0.05:5]';
q=jtraj(q1,q2,t)
Lin={'b','LineWidth',1};
puma.plot(q,'noshadow','nobase','trail',Lin,'noname','notiles','ortho','movie','gato1.avi')
pause(3)
q=jtraj(q2,q1,t);
puma.plot(q,'noshadow','nobase','trail',Lin,'noname','notiles','ortho','movie','gato2.avi')