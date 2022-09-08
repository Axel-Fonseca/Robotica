L(1)=Link([0 0 10 0 0]);
L(2)=Link([0 0 8 -pi 0]);
DP=SerialLink(L,'name','DP');
MTH=transl(5, 7, 0);
qz=DP.ikcon(MTH,[0 0])
MT2=DP.fkine(qz)