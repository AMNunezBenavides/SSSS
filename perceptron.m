clc
close all 
clear all
%% REGRESION LOGÍSTICA
fprintf('REGRESION LOGÍSTICA \n');
% Cual es la etiqueta que devuelve una regresión logística entrenada con los pesos
pesos=[0.5 -0.8 0.96 0.79];
x = [3 2.11 1.2];
x = [1 x];

%multiplicación con x y pesos
Z = x*pesos';
%funcion de activacion
%Y=1./(1+exp(-Z));%logsig
Y=logsig(Z);
%>=0.5 etiqueta 1 , si no vale 0
if Y>=0.5
etiqueta=1;
else
etiqueta=0;
end
fprintf('Valor Etiqueta %d \n', etiqueta);


 %% TESTEO DEL PERCEPTRÓN
 fprintf('TESTEO PERCEPTRÓN \n');
%Asignar matrices x e Y
dsX =[5 2 7; 6 5 7; 2 2 1];
dsY = [1 1 -1];

%Matriz de pesos
W=[0.8 0.25 -1.42 0.13];

%Bias
fil=size(dsX,1);
bias=[1;1;1];
%bias=ones(fil,1);
dsX=[bias,dsX];
dsX;
%etiquetas predichas
yHat=[];

for i=1: fil
    %realizar el producto punto entre los pesos (W) y valores de testeo (dsX)
    %r=dot(dsX(i,:),W);
    r=dsX(i,:)*W';
    if r>=0
        yHat=[yHat,1];
    else
        yHat=[yHat,-1];
    end

end

%porcentaje de acierto
aciertos=100*sum(yHat==dsY)/length(dsY)

%porcentaje de error
error=100*sum(yHat ~= dsY)/length(dsY)


