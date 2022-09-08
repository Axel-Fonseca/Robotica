rosinit('192.168.192.128')
%%
velocity=0.5;
robotCmd = rospublisher('/cmd_vel','geometry_msgs/Twist') ;
velMsg = rosmessage('geometry_msgs/Twist');
%%
velMsg.Linear.X = velocity;
send(robotCmd,velMsg)
pause(4)
velMsg.Linear.X = 0;
send(robotCmd,velMsg)
%%
odomSub = rossubscriber('/odom','nav_msgs/Odometry');
%%
odomMsg = receive(odomSub,3);
pose = odomMsg.Pose.Pose;
x = pose.Position.X
y = pose.Position.Y
quat = pose.Orientation;

angles = quat2eul([quat.W quat.X quat.Y quat.Z]);
theta = rad2deg(angles(1))