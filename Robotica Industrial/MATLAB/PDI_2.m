A=imread('moon.tif');
subplot(2,2,1)
imshow(A)
B=imadd(A,80);
subplot(2,2,2)
imshow(B)
subplot(2,2,3)
histogram(A)
subplot(2,2,4)
histogram(B)


Ir=I(:,:,1);
Ig=I(:,:,2);
Ib=I(:,:,3);
Ih=Ihsv(:,:,1);
Is=Ihsv(:,:,2);
Iv=Ihsv(:,:,3);
figure
subplot(2,3,1), imshow(Ir)
subplot(2,3,2), imshow(Ig)
subplot(2,3,3), imshow(Ib)
subplot(2,3,4), imshow(Ih)
subplot(2,3,5), imshow(Is)
subplot(2,3,6), imshow(Iv)