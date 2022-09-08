A=SE3.Ry(pi/2)*SE3.Rz(pi/2)*SE3(2,2,2)
B=SE3.eul(90,90,90,'deg')
C=SE3.rpy(45,50,60,'deg')
D=SE3.angvec(pi/2,[1,1,1])
E=SE3.oa([1,0,0],[0,1,0])

%CUBO%
F1=SE3(2,2,2)*SE3.Rx(pi)*SE3.Ry(0)*SE3.Rz(pi/2)
F2=SE3(2,2,-2)*SE3.Rx(0)*SE3.Ry(0)*SE3.Rz(pi)
F3=SE3(2,-2,2)*SE3.Rx(0)*SE3.Ry(pi)*SE3.Rz(0)
F4=SE3(2,-2,-2)*SE3.Rx(0)*SE3.Ry(0)*SE3.Rz(pi/2)
F5=SE3(-2,2,2)*SE3.Rx(pi)*SE3.Ry(0)*SE3.Rz(0)
F6=SE3(-2,2,-2)*SE3.Rx(pi/2)*SE3.Ry(0)*SE3.Rz(0)
F7=SE3(-2,-2,2)*SE3.Rx(-pi/2)*SE3.Ry(0)*SE3.Rz(0)
F8=SE3(-2,-2,-2)*SE3.Rx(0)*SE3.Ry(0)*SE3.Rz(0)

t=A.t
tr=A.transl
RPY=B.torpy('deg')
EUL=C.toeul('deg')
[a,v]=A.toangvec('deg')
F1.plot('rgb','notext','arrow','length',2,'axis',[-5,5,-5,5,-5,5]); hold on
F2.plot('rgb','notext','arrow','length',2,'axis',[-5,5,-5,5,-5,5])
F3.plot('rgb','notext','arrow','length',2,'axis',[-5,5,-5,5,-5,5])
F4.plot('rgb','notext','arrow','length',2,'axis',[-5,5,-5,5,-5,5])
F5.plot('rgb','notext','arrow','length',2,'axis',[-5,5,-5,5,-5,5])
F6.plot('rgb','notext','arrow','length',2,'axis',[-5,5,-5,5,-5,5])
F7.plot('rgb','notext','arrow','length',2,'axis',[-5,5,-5,5,-5,5])
F8.plot('rgb','notext','arrow','length',2,'axis',[-5,5,-5,5,-5,5])

%Reto: Dibujar los vertices de un cubo cuyo centro está en el origen