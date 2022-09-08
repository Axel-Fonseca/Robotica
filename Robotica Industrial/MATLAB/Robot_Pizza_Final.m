clear all, clc
%% Variables q's
syms t1 t2 t3 t4; %Variables para qs
qh=[0,0,2.7,-1.3]; %Posición HOME
qs=[t1,t2,t3,t4]; %Posición para MTH simbólica
q1=[-1.2,1,0,-1.6]; %Posición media
q2=[0,1.53,0,0]; %Posición final
l1=5; l2=20; l3=15; l4=10; %Longitudes eslabones
 
%% ---DECLARACIÓN ROBOT PIZZA (RRRR)--- 
E(1)=Link('revolute', 'd', l1, 'a', 0, 'alpha', pi/2);  %Eslabón rotacional 1
E(2)=Link('revolute', 'd', 0, 'a', l2, 'alpha', 0);     %Eslabón rotacional 2
E(3)=Link('revolute', 'd', 0, 'a', l3, 'alpha', 0);     %Eslabón rotacional 3
E(4)=Link('revolute', 'd', 0, 'a', l4, 'alpha', 0);     %Eslabón rotacional 4
E(1).qlim=[0 pi]; E(2).qlim=[0 pi]; E(3).qlim=[0 pi]; E(4).qlim=[0 pi]; %Rango de movimiento eslabones
 
Lirusisa=SerialLink(E,'name','Pikza') %Creación robot con eslabones E
Lirusisa.teach(qh) %Posición robot inicial HOME (qh)
 
%% Trayectoria de posición articular (joint)
[q,qd,qdd]=jtraj(qh,q1,30) %Trayectoria de posición articular y matrices articulares (posición, velocidad y aceleración)
Lirusisa.plot(q) %Plot trayectoria posición
q_ML=abs(q*0.318309886) %Conversion matriz posición a matlab
 
%% CONTROL SERVOS ARDUINO-MATLAB
port = 'COM4'; % Puerto Serial Arduino
board = 'Uno'; % Modelo Arduino
arduino_board = arduino(port, board, 'Libraries', 'Servo'); %Objeto Arduino-Servo
 
servo_motor1 = servo(arduino_board, 'D12'); %Objeto servo 1 y PIN PWM
servo_motor2 = servo(arduino_board, 'D9');  %Objeto servo 2 y PIN PWM
servo_motor3 = servo(arduino_board, 'D10'); %Objeto servo 3 y PIN PWM
servo_motor4 = servo(arduino_board, 'D11'); %Objeto servo 4 y PIN PWM
 
%% Movimiento robot a partir de trayectoria articular (jtraj)
 
for i=1:30 %Ciclo para obtener los valores de la matriz posicion para cada articulación
    
    writePosition(servo_motor1, q_ML(i,1)); %Escribe valor para servo 1, columna 1, fila i
    writePosition(servo_motor2, q_ML(i,2)); %Escribe valor para servo 2, columna 2, fila i
    writePosition(servo_motor3, q_ML(i,3)); %Escribe valor para servo 3, columna 3, fila i
    writePosition(servo_motor4, q_ML(i,4)); %Escribe valor para servo 4, columna 4, fila i
 
    current_position1 = readPosition(servo_motor1); %Lee la posición actual del servo
    current_position2 = readPosition(servo_motor2);
    current_position3 = readPosition(servo_motor3);
    current_position4 = readPosition(servo_motor4);
 
    current_position1 = current_position1 * 180; %Conversión de posición actual servo a grados
    current_position2 = current_position2 * 180;
    current_position3 = current_position3 * 180;
    current_position4 = current_position4 * 180;
 
    fprintf('Servo #1 current position is %d\n', current_position1); %Imprime valor actual servo
    fprintf('Servo #2 current position is %d\n', current_position2);
    fprintf('Servo #3 Current position is %d\n', current_position3);
    fprintf('Servo #4 current position is %d\n', current_position4);
 
end
 
writePosition(servo_motor4, 0); %Regresa servo a posición 0
writePosition(servo_motor3, 0);
writePosition(servo_motor2, 0);
pause(0.5)
writePosition(servo_motor1, 0);
