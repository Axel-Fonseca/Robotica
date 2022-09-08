clear vars, clc;
%lista=webcamlist  %Listado de cámaras disponibles
cam=webcam(2);     %Crear el objeto cámara 
preview(cam)      %Vista previa
pause(10)
I1=snapshot(cam);   %Captura
closePreview(cam)  %Cierra la vista previa
pause(2)
preview(cam)  
pause(10)
I2=snapshot(cam);   %Captura
closePreview(cam)  %Cierra la vista previa
clear('cam')   

%%
% figure
% imshowpair(I1,I2,'diff')

%%
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