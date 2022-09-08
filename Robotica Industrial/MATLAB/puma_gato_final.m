%TicTacToe_480x720p_1.jpeg
%TicTacToe_480x720p_2.jpeg
%TicTacToe_480x720p_3.jpeg
%TicTacToe_480x720p_4.jpeg
%% Robot Puma
close all;
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

%puma.teach(Qor,'workspace',[-100, 100, -200, 200,-100,100])
%hold on
%clon.teach(Qnew,'workspace',[-100, 100, -200, 200,-100,100])

maq=1:4;
Alfa=1:4;
S = 'TicTacToe_480x720p.jpeg';
%% Movimiento
N_while=1;
while N_while < 5
    
    prompt = 'Ingrese su respuesta: (archivo.jpeg):  ';
    D = input(prompt,'s')

    I1=imread(S);
    figure
    imshow(I1)
    I2=imread(D);
    figure
    imshow(I2)

    Idif=imshowpair(I1,I2,'diff');  %Obtiene un objeto donde destaca el ultimo movimiento
    In=Idif.CData;    % Obtiene la imagen del ultimo movimiento
    Ibw=imbinarize(In,0.5); 
    Ibw = imfill(Ibw,'holes');  % Limpia la imagen
    figure
    imshow(Ibw)
    Ilabel = bwlabel(Ibw);    % Busca objetos
    stat = regionprops(Ilabel,'centroid'); % Localiza el centroide del objeto
    imshow(Ibw)
    hold on
    plot(stat(1).Centroid(1),stat(1).Centroid(2),'ro');
    x=stat(1).Centroid(1)  %Posición del centroide en x
    y=stat(1).Centroid(2)  %Posición del centroide en y

    if N_while == 1
    
            if (x >= 1) && (x <= 240)
                if (y >= 1) && (y <= 160)

                    Alfa = 1;

                elseif (y >= 161) && (y <= 320)

                    Alfa = 4;

                elseif (y >= 321) && (y <= 480)

                    Alfa = 7;

                else

                    Alfa = 0;

                end

            elseif (x >= 241) && (x <= 480)

                if (y >= 1) && (y <= 160)

                    Alfa = 2;

                elseif (y >= 161) && (y <= 320)

                    Alfa = 5;

                elseif (y >= 321) && (y <= 480)

                    Alfa = 8;

                else

                    Alfa = 0;

                end

            elseif (x >= 481) && (x <= 720)

                if (y >= 1) && (y <= 160)

                    Alfa = 3;

                elseif (y >= 161) && (y <= 320)

                    Alfa = 6;

                elseif (y >= 321) && (y <= 480)

                    Alfa = 9;

                else

                    Alfa = 0;

                end

            end


            Maq_1 = randi([1 9],1);

            while Maq_1 == Alfa

                Maq_1 = randi([1 9],1);
            end
            fprintf('Mi respuesta es: %d\n', Maq_1)
            
            if Maq_1 == 1
    
                conv_x=-40;
                conv_y=-30;

            elseif Maq_1 == 2

                conv_x=0;
                conv_y=-30;

            elseif Maq_1 == 3

                conv_x=40;
                conv_y=-30;

            elseif Maq_1 == 4

                conv_x=-40;
                conv_y=0;

            elseif Maq_1 == 5

                conv_x=0;
                conv_y=0;

            elseif Maq_1 == 6

                conv_x=40;
                conv_y=0;

            elseif Maq_1 == 7

                conv_x=-40;
                conv_y=30;

            elseif Maq_1 == 8

                conv_x=0;
                conv_y=30;

            elseif Maq_1 == 9

                conv_x=40;
                conv_y=30;

            else

                conv_x=60;
                conv_y=45;

            end
            
    elseif N_while == 2
        
            if (x >= 1) && (x <= 240)
                if (y >= 1) && (y <= 160)

                    Beta = 1;

                elseif (y >= 161) && (y <= 320)

                    Beta = 4;

                elseif (y >= 321) && (y <= 480)

                    Beta = 7;

                else

                    Beta = 0;

                end

            elseif (x >= 241) && (x <= 480)

                if (y >= 1) && (y <= 160)

                    Beta = 2;

                elseif (y >= 161) && (y <= 320)

                    Beta = 5;

                elseif (y >= 321) && (y <= 480)

                    Beta = 8;

                else

                    Beta = 0;

                end

            elseif (x >= 481) && (x <= 720)

                if (y >= 1) && (y <= 160)

                    Beta = 3;

                elseif (y >= 161) && (y <= 320)

                    Beta = 6;

                elseif (y >= 321) && (y <= 480)

                    Beta = 9;

                else

                    Beta = 0;

                end

            end


            Maq_2 = randi([1 9],1);

            while (Maq_2 == Alfa) || (Maq_2 == Beta) || (Maq_2 == Maq_1)

                Maq_2 = randi([1 9],1);
            end
            fprintf('Mi respuesta es: %d\n', Maq_2)
            
            if Maq_2 == 1
    
                conv_x=-40;
                conv_y=-30;

            elseif Maq_2 == 2

                conv_x=0;
                conv_y=-30;

            elseif Maq_2 == 3

                conv_x=40;
                conv_y=-30;

            elseif Maq_2 == 4

                conv_x=-40;
                conv_y=0;

            elseif Maq_2 == 5

                conv_x=0;
                conv_y=0;

            elseif Maq_2 == 6

                conv_x=40;
                conv_y=0;

            elseif Maq_2 == 7

                conv_x=-40;
                conv_y=30;

            elseif Maq_2 == 8

                conv_x=0;
                conv_y=30;

            elseif Maq_2 == 9

                conv_x=40;
                conv_y=30;

            else

                conv_x=60;
                conv_y=45;

            end
            
    elseif N_while == 3
        
            if (x >= 1) && (x <= 240)
                if (y >= 1) && (y <= 160)

                    Delta = 1;

                elseif (y >= 161) && (y <= 320)

                    Delta = 4;

                elseif (y >= 321) && (y <= 480)

                    Delta = 7;

                else

                    Delta = 0;

                end

            elseif (x >= 241) && (x <= 480)

                if (y >= 1) && (y <= 160)

                    Delta = 2;

                elseif (y >= 161) && (y <= 320)

                    Delta = 5;

                elseif (y >= 321) && (y <= 480)

                    Delta = 8;

                else

                    Delta = 0;

                end

            elseif (x >= 481) && (x <= 720)

                if (y >= 1) && (y <= 160)

                    Delta = 3;

                elseif (y >= 161) && (y <= 320)

                    Delta = 6;

                elseif (y >= 321) && (y <= 480)

                    Delta = 9;

                else

                    Delta = 0;

                end

            end


            Maq_3 = randi([1 9],1);

            while (Maq_3 == Alfa) || (Maq_3 == Beta) || (Maq_3 == Delta) || (Maq_3 == Maq_1) || (Maq_3 == Maq_2)

                Maq_3 = randi([1 9],1);
            end
            fprintf('Mi respuesta es: %d\n', Maq_3)
            
            if Maq_3 == 1
    
                conv_x=-40;
                conv_y=-30;

            elseif Maq_3 == 2

                conv_x=0;
                conv_y=-30;

            elseif Maq_3 == 3

                conv_x=40;
                conv_y=-30;

            elseif Maq_3 == 4

                conv_x=-40;
                conv_y=0;

            elseif Maq_3 == 5

                conv_x=0;
                conv_y=0;

            elseif Maq_3 == 6

                conv_x=40;
                conv_y=0;

            elseif Maq_3 == 7

                conv_x=-40;
                conv_y=30;

            elseif Maq_3 == 8

                conv_x=0;
                conv_y=30;

            elseif Maq_3 == 9

                conv_x=40;
                conv_y=30;

            else

                conv_x=60;
                conv_y=45;

            end
            
    elseif N_while == 4
        
            if (x >= 1) && (x <= 240)
                if (y >= 1) && (y <= 160)

                    Gamma = 1;

                elseif (y >= 161) && (y <= 320)

                    Gamma = 4;

                elseif (y >= 321) && (y <= 480)

                    Gamma = 7;

                else

                    Gamma = 0;

                end

            elseif (x >= 241) && (x <= 480)

                if (y >= 1) && (y <= 160)

                    Gamma = 2;

                elseif (y >= 161) && (y <= 320)

                    Gamma = 5;

                elseif (y >= 321) && (y <= 480)

                    Gamma = 8;

                else

                    Gamma = 0;

                end

            elseif (x >= 481) && (x <= 720)

                if (y >= 1) && (y <= 160)

                    Gamma = 3;

                elseif (y >= 161) && (y <= 320)

                    Gamma = 6;

                elseif (y >= 321) && (y <= 480)

                    Gamma = 9;

                else

                    Gamma = 0;

                end

            end


            Maq_4 = randi([1 9],1);

            while (Maq_4 == Alfa) || (Maq_4 == Beta) || (Maq_4 == Delta) || (Maq_4 == Gamma ) || (Maq_4 == Maq_1) || (Maq_4 == Maq_2) || (Maq_4 == Maq_3)

                Maq_4 = randi([1 9],1);
            end
            fprintf('Mi respuesta es: %d\n', Maq_4)
            
            if Maq_4 == 1
    
                conv_x=20;
                conv_y=15;

            elseif Maq_4 == 2

                conv_x=60;
                conv_y=15;

            elseif Maq_4 == 3

                conv_x=100;
                conv_y=15;

            elseif Maq_4 == 4

                conv_x=20;
                conv_y=45;

            elseif Maq_4 == 5

                conv_x=60;
                conv_y=45;

            elseif Maq_4 == 6

                conv_x=100;
                conv_y=45;

            elseif Maq_4 == 7

                conv_x=20;
                conv_y=75;

            elseif Maq_4 == 8

                conv_x=60;
                conv_y=75;

            elseif Maq_4 == 9

                conv_x=100;
                conv_y=75;

            else

                conv_x=60;
                conv_y=45;

            end
            
    else
        
        fprintf('Error: esta opcion no existe :/')
        
    end


    
    S = D;
    
%----------------------------------------------------------------------------------------------------------------------
close all
%----------------------------------------------------------------------------------------------------------------------
    i=-40;
    j=0;
    k=-10;
    P1=SE3(i,j,k)
    x=conv_x;
    y=conv_y;
    z=-40;
    P2=SE3(x,y,z)
    q1=puma.ikine6s(P1);
    q2=puma.ikine6s(P2);
    t=[0:0.05:5]';
    q=jtraj(q1,q2,t);
    Lin={'b','LineWidth',1};
    puma.plot(q,'noshadow','nobase','trail',Lin,'noname','notiles','ortho','movie','gato1.avi')
    pause(3)
    q=jtraj(q2,q1,t);
    puma.plot(q,'noshadow','nobase','trail',Lin,'noname','notiles','ortho','movie','gato2.avi')
    close all
%----------------------------------------------------------------------------------------------------------------------
    
    fprintf('Ciclo: %d\n', N_while)
    N_while=N_while + 1;
    
end