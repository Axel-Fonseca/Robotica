rosinit('192.168.100.92')
node1=ros.Node('/node1');
node2=ros.Node('/node2');

%%
tal=ros.Publisher(node1,'/topico','std_msgs/String');
lis=ros.Subscriber(node2,'/topico','std_msgs/String');

%%
msg=rosmessage('std_msgs/String');
msg.Data='Alerombo';

%% Publicaicon
send(tal,msg)
pause(1)
lis.LatestMessage

%% Publicacion multiple
for i=1:10
    msg.Data=strcat('Este es el mesaje # ',num2str(i));
    send(tal,msg)
    pause(1)
    lis.LatestMessage
end