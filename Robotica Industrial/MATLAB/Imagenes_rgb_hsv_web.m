lista=webcamlist %Listado de c�maras disponibles
cam=webcam(1)   %Crear el objeto c�mara 
preview(cam)   %Vista previa
pause(5)
I=snapshot(cam);  %Captura
closePreview(cam) %Cierra la vista previa
clear('cam')  %Libera la c�mara
imshow(I)
rgb=impixel()

Ihsv=rgb2hsv(I);
figure
imshow(Ihsv)
hsv=impixel(I)