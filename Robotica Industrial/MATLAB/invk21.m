L(1)=Link([0 0 10 0 0]);
L(2)=Link([0 0 8 -pi 0]);
DP=SerialLink(L,'name','DP');
syms x y t1 t2;
MTH=simplify(vpa(DP.fkine([t1 t2])))
eq1= x==8*cos(t1+t2)+10*cos(t1);
eq2= y==8*sin(t1+t2)+10*sin(t1);

[s1, s2]=solve([eq1, eq2],[t1, t2]);

th1=simplify(s1(1));
th2=simplify(s2(1));

x=5;
y=7;

Sol=vpa(subs(th1))
Sol2=vpa(subs(th2))