clc, close all, clear all
%% AGen Ciudades

objetivo=[2 3 4 1 5]%orden de las ciudades ruta

%% Población inicial
poblacion=[];
individuo=[];
for i=1:4%individuos  
 a=true;
  while a==true
      n1=randi([1 5]);
      n2=randi([1 5]);
      n3=randi([1 5]);
      n4=randi([1 5]);
      n5=randi([1 5]);
      if(n1+n2+n3+n4+n5)==15%sumatoria 15
          a=false;
      end
  end
individuo=[n1,n2,n3,n4,n5];
poblacion=[poblacion;individuo];
end
for fin=1:100%num interacciones
    fprintf('\n*****Interaccion %d *****\n',fin);
    poblacion
    objetivo
 %% Selección de padres
    %probabilidad cercania
    prb=[];
    fila=[];
    ruleta=[];
    suma=0;
    for i=1:size(poblacion,1)
       for j=1:size(poblacion,2)
       suma=0;
       acumulador=abs(poblacion(i ,j)-objetivo(1 ,j));
       end
       suma=suma+acumulador;
        prb=[prb,suma]; %fitness funcion
    end

    contador=1;
            for m=1:length(prb)
                if prb(m)~=0
                    for k=1:prb(m)
                       valor=prb(m);
                       fila=[contador,valor];
                       ruleta=[ruleta;fila];
                    end
                    contador=contador+1;
                end
            end
            ruleta
    max=size(ruleta,1);
    seleccion1=randi([1 max]);%estocastica
    ver=true;
        while ver==true
          seleccion2=randi([1 max]);%estocastica
          if seleccion2~=seleccion1 && ruleta(seleccion1)~=ruleta(seleccion2)% no sea el mismo padre
              ver=false;
          end
        end
        % padres elegidos
        p1=poblacion(ruleta(seleccion1,2),:)
        p2=poblacion(ruleta(seleccion2,2),:)
        
%% CrossOver
       
        hijo=[];
        hijo2=[];
        cruce=randi([1 5]);
                for i=1:cruce
                hijo=[hijo,p1(i)];
                end
                for j=cruce+1:length(p2)
                hijo=[hijo,p2(j)];
                end
                
                for i=1:cruce
                hijo2=[hijo2,p2(i)];
                end
                for j=cruce+1:length(p1)
                hijo2=[hijo2,p1(j)];
                end
        
%% Mutación
        % no siempre muta 
        probabilidad=randi([1 10]);
        if probabilidad==1 || probabilidad==4 || probabilidad==8
            hijo_muta=randi([1 2])%cual de los dos muta
            if hijo_muta==1
                pos_muta=randi([1 5])
                random_muto=randi([1 5])
                hijo(pos_muta)=random_muto
            else
                pos_muta=randi([1 5])
                random_muto=randi([1 5])
                hijo2(pos_muta)=random_muto   
            end
        end
%% Hijo a la población
        poblacion=[poblacion;hijo];
        poblacion=[poblacion;hijo2]
%% Eliminación
        poblacion(ruleta(seleccion1,2),:)= [];
        poblacion(ruleta(seleccion2,2),:) = [];
        poblacion
        
%% Funcion de pare
        t=size(poblacion,1);
        for i=1:t
            if poblacion(i)==objetivo
                fprintf('EL INDIVIDUO %d ES SOLUCION \n',i);
                fin=100;
            else
                fprintf('EL INDIVIDUO %d NO ES SOLUCION \n',i);
            end
        end
end







