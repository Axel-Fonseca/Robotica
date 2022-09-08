%% ---ROBOT 2 (RRPR)--- OPCION B
l2=32.5; l3=27.5;
d1=38.7; d4=0;
E(1)=Link('revolute', 'd', d1, 'a', l2, 'alpha', 0);
E(2)=Link('revolute', 'd', 0, 'a', l3, 'alpha', pi);
E(3)=Link('prismatic', 'theta',0, 'a', 0, 'alpha',0);
E(4)=Link('revolute', 'd', 0, 'a', 0, 'alpha',0);
E(1).qlim=[-pi pi];
E(2).qlim=[-pi pi];
E(3).qlim=[0 21];
E(4).qlim=[-pi pi];
Robot2=SerialLink(E,'name','Robot2')
Robot2.teach()
Robot2.plot([0 pi 15 pi])