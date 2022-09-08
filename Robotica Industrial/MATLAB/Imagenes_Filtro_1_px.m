I=imread('wallpapaer.png');
figure
imshow(I)
rgb=impixel()

Ir=I(:,:,1);
Ig=I(:,:,2);
Ib=I(:,:,3);

[m n p]=size(I);

R=rgb(1,1);
G=rgb(1,2);
B=rgb(1,3);
    
for i=1:m
    for j=1:n
        if Ir(i,j)==R
            Ir(i,j)=Ir(i,j);
        else
            Ir(i,j)=0;
        end
        
        if Ig(i,j)==G
            Ig(i,j)=Ig(i,j);
        else
            Ig(i,j)=0;
        end
        
        if Ib(i,j)==B
            Ib(i,j)=Ib(i,j);
        else
            Ib(i,j)=0;
        end
    end
end

IC7=cat(p,Ir,Ig,Ib);
imshow(IC7)