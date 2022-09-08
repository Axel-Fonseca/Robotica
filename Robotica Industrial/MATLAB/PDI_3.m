clear, close all, clc
%% Camara Web
%lista=webcamlist  %Listado de cámaras disponibles
%cam=webcam(1)     %Crear el objeto cámara 
%preview(cam)      %Vista previa
%pause(5)
%I=snapshot(cam);   %Captura
%closePreview(cam)  %Cierra la vista previa
%clear('cam')    %Libera la cámara
%%
I=imread('wallpapaer.png');
figure
imshow(I)
rgb=impixel()


imshow(I)
rgb=impixel()

r=rgb(1);
g=rgb(2);
b=rgb(3);

Ir=I(:,:,1);
Ig=I(:,:,2);
Ib=I(:,:,3);
%%
[m, n, p]=size(I);
for i=1:m
    for j=1:n
            if Ir(i,j)>=r-r*.2 && Ir(i,j)<=r+r*.2  
                Ir(i,j)=Ir(i,j);
            else
                Ir(i,j)=0;
            end
            if Ig(i,j)>=g-g*.2 && Ig(i,j)<=g+g*.2  
                Ig(i,j)=Ig(i,j);
            else
                Ig(i,j)=0;
            end
            if Ib(i,j)>=b-b*.2 && Ib(i,j)<=b+b*.2  
                Ib(i,j)=Ib(i,j);
            else
                Ib(i,j)=0;
            end
    end
end

k=strel('disk',5,4);
IrM=imopen(Ir,k); %imdilate  imerode imclose imopen 
IgM=imopen(Ig,k); %imdilate  imerode imclose imopen 
IbM=imopen(Ib,k); %imdilate  imerode imclose imopen 


Inew=cat(p,Ir,Ig,Ib);
Imorph=cat(p,IrM,IgM,IbM);
figure
imshow(Inew)
figure
imshow(Imorph)

Ibw=imbinarize(rgb2gray(Imorph));
figure
imshow(Ibw)


%%
figure
Ilabel = bwlabel(Ibw);    % Busca objetos
stat = regionprops(Ilabel,'centroid'); % Localiza el centroide del objeto
imshow(Ibw)
hold on
[a,b]=size(stat)
for i=1:a
    plot(stat(i).Centroid(1),stat(i).Centroid(2),'ro');
end

