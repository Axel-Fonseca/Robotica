rosinit('172.16.81.73')
node1=ros.Node('/nodo1');
node2=ros.Node('/nodo2');

%%
tal=ros.Publisher(node1,'/holamundo','std_msgs/String');
lis=ros.Subscriber(node2,'/holamundo','std_msgs/String');
%%
msg=rosmessage('std_msgs/String');
msg.Data='Aleroooombo';


%% Publicación
send(tal,msg) 
pause(1) 
lis.LatestMessage

%% Publicación múltiple

for i=1:200
    msg.Data=strcat( 'Este el mensaje #  ',num2str(i));
    send(tal,msg)
    pause(1)
    lis.LatestMessage
end
    
%% Mientras tanto en ROS

%rostopic echo /topico
%rostopic hz /topico
%rosrun rqt_graph rqt_graph

%% Trabajo del día
% Escribir el código que permita la creación de cinco nodos con el siguiente
% comportamiento:
% Nodo A: Publisher del tópico 1
% Nodo B: Suscriber del tópico 1
% Nodo C: Publisher del tópico 2
% Nodo D: Suscriber del tópico 2
% Nodo E: Suscriber tópico 1 y 2
% 
% Tópico 1: Tipo std_msgs/String
% Tópico 2: Tipo geometry_msgs/Point

% Ejemplo: 

[noded, pos]=rospublisher('/posicion','geometry_msgs/Point');
pos.X=1;
pos.Y=2;
send(noded,pos);

%%
xy=ros.Subscriber(node2,'/posicion','geometry_msgs/Point');
%%
send(noded,pos);
pause(1)
xy.LatestMessage