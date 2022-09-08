clear vars, clc, close all, clear all;
%TicTacToe_480x720p_1.jpeg
%TicTacToe_480x720p_2.jpeg
%TicTacToe_480x720p_3.jpeg
%TicTacToe_480x720p_4.jpeg

S = 'TicTacToe_480x720p.jpeg';

prompt = 'Ingrese su respuesta: (archivo.jpeg):  ';
D = input(prompt,'s')

I1=imread(S);
figure
imshow(I1)
I2=imread(D);
figure
imshow(I2)

%%
close all;
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
x=stat(1).Centroid(1);  %Posición del centroide en x
y=stat(1).Centroid(2);  %Posición del centroide en y

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
%%
close all;
S = D;

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
x=stat(1).Centroid(1);  %Posición del centroide en x
y=stat(1).Centroid(2);  %Posición del centroide en y

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
%%
close all;
S = D;

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
x=stat(1).Centroid(1);  %Posición del centroide en x
y=stat(1).Centroid(2);  %Posición del centroide en y

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
%%
close all;

S = D;

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
x=stat(1).Centroid(1);  %Posición del centroide en x
y=stat(1).Centroid(2);  %Posición del centroide en y

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

while (Maq_4 == Alfa) || (Maq_4 == Beta) || (Maq_4 == Delta) || (Maq_4 == Maq_1) || (Maq_4 == Maq_2) || (Maq_4 == Maq_3)
    
    Maq_4 = randi([1 9],1);  
end
fprintf('Mi respuesta es: %d\n', Maq_4)