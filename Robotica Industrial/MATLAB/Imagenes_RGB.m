clear, close all, clc;
I=imread('peppers.png');
%imshow(I)
Ir=I(:,:,1);
Ig=I(:,:,2);
Ib=I(:,:,3);

subplot(2,2,1)
imshow(I)
subplot(2,2,2)
imshow(Ir)
subplot(2,2,3)
imshow(Ig)
subplot(2,2,4)
imshow(Ib)

figure
Igray=(0.299*Ir)+(0.587*Ig)+(0.114*Ib);
imshow(Igray)

figure
[m n p]=size(I);
FB=zeros(m,n);
FW=255*ones(m,n);

IC1=cat(p,Ir,Ig,FB);
IC2=cat(p,Ir,FB,Ib);
IC3=cat(p,FB,Ig,Ib);
IC4=cat(p,Ir,Ig,FW);
IC5=cat(p,Ir,FW,Ib);
IC6=cat(p,FW,Ig,Ib);

subplot(2,3,1)
imshow(IC1)
subplot(2,3,2)
imshow(IC2)
subplot(2,3,3)
imshow(IC3)
subplot(2,3,4)
imshow(IC4)
subplot(2,3,5)
imshow(IC5)
subplot(2,3,6)
imshow(IC6)