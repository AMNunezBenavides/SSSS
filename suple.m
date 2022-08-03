
clc
close all
clear all
%% Reducir o eliminar el ruido presente en la imagen

imagen=imread('C:\Users\Monsita\Downloads\imgNoise.jpg');

%agregar ruido artificial
%imagen=imnoise(imagen,'salt & pepper',0.1)


%reduccion de ruido 
%espectros
r=imagen(:,:,1);
v=imagen(:,:,2);
a=imagen(:,:,3);
%filtro de media
rf=medfilt2(r);
vf=medfilt2(v);
af=medfilt2(a);

%reconstruccion imagen
limpia(:,:,1)=rf;
limpia(:,:,2)=vf;
limpia(:,:,3)=af;


%% Se desea observar la parte rojiza del cielo en menor intensidad e incrementar la tonalidad azul del cielo

%Histogramas espectros editados
subplot(2,2,1)
imhist(limpia(:,:,1));
title('Hist. Espec. rojo 1')
subplot(2,2,2)
imhist(limpia(:,:,3));
title('Hist. Espec. azul 1')

color(:,:,1)=limpia(:,:,1)-50;
color(:,:,2)=limpia(:,:,2);
color(:,:,3)=limpia(:,:,3)+100;

subplot(2,2,3)
imhist(color(:,:,1));
title('Hist. Espec. rojo 2')
subplot(2,2,4)
imhist(color(:,:,3));
title('Hist. Espec. azul 2')


%% La zona de la imagen en la que se observa unos árboles tomen algo de tonalidad verde

b = find(vf<10);
for i=1:length(b)
   vf(b(i)) = vf(b(i))+150; 
end    
conVerde(:,:,1)=color(:,:,1);
conVerde(:,:,2)=vf;
conVerde(:,:,3)=color(:,:,3);

figure
imshow([imagen,limpia,color,conVerde])


%% Se seleccione y se defina la zona de los árboles
%escala grises
ig=rgb2gray(color);
ig=im2bw(ig,0.1);
ig=~ig;
figure
imshow(conVerde)
propiedades=regionprops(ig,"all")
a = find([propiedades.Area] == max([propiedades.Area]));
rectangle('Position',propiedades(a).BoundingBox, 'EdgeColor','w', 'LineWidth', 2);


%% La delimitación se sobre ponga en la imagen original en RGB

figure
imshow(ig)
figure
imshow(limpia)
hold on
borde=bwboundaries(ig);
for i=1:length(borde)
    frontera=borde(i);
    s=frontera{1,1};
    plot(s(:,2),s(:,1),'w','LineWidth', 2);
end
hold off

[etiquetas,~]=bwlabel(ig);
[valMax, idx]=max([propiedades.Area]);
miembro=ismember(etiquetas,idx);




















