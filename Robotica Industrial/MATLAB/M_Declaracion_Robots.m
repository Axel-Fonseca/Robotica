%% ---DOBLE PENDULO (RR)--- OPCION A
l1=5; l2=10;
t1=0; t2=0;
L(1)=Link([t1 0 l1 0 0]);
L(2)=Link([t2 0 l2 pi 0]);
L(1).qlim=[-pi pi];
L(2).qlim=[-pi pi];
DP=SerialLink(L,'name','Doble Pendulo')
DP.teach()

%% ---SCARA (RRP)--- OPCION B
l1=350; l2=300; l3=0;
d1=100; d2=0;
t3=0;
E(1)=Link('revolute', 'd', d1, 'a', l1, 'alpha', 0);
E(2)=Link('revolute', 'd', d2, 'a', l2, 'alpha', pi);
E(3)=Link('prismatic', 'theta', t3, 'a', l3, 'alpha', 0);
E(1).qlim=[-pi pi];
E(2).qlim=[-pi pi];
E(3).qlim=[0 100];
SCARA=SerialLink(E,'name','SCARA')
SCARA.teach()

%% ---SEIKO (RPP)--- OPCION C
l1=0; l2=0; l3=0;
t2=pi/2; t3=0;
d1=0;
LR=Revolute('d',d1,'a',l1,'alpha',0);
LP(1)=Prismatic('theta',t2,'a',l2,'alpha',pi/2);
LP(2)=Prismatic('theta',t3,'a',l3,'alpha',pi/2);
LR.qlim=[-pi pi];
LP(1).qlim=[0 50];
LP(2).qlim=[0 50];
SEIKO=SerialLink([LR LP],'name','SEIKO') 
SEIKO.teach()