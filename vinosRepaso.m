clc
clear all
close all
dataTable = readmatrix('vinosDataSet.csv');
dataTable(any(isnan(dataTable),2),:)=[];%eliminar datos no validos
totalWhite=sum(dataTable(:,13) == 1);
totalRed=sum(dataTable(:,13) == 2);

totalEliminar=abs(totalWhite-totalRed);

%Eliminar datos para balancear  al azar
if totalWhite>totalRed
    for i = 1:totalEliminar
        dataTable(1,:) = [];
    end
else
    j=size(dataTable,1)
    while j>=totalEliminar
        dataTable(j,:) = [];
        j=j-1;
    end
end
totalWhite1=sum(dataTable(:,13) == 1);
totalRed1=sum(dataTable(:,13) == 2);

xdataSet=dataTable(:,1:12);
ydataSet=dataTable(:,13);

%estandarizar 
for j=1:size(xdataSet,1)
    for i=1:size(xdataSet,2)
        xNormalizada(j,i)=(xdataSet(j,i)-min(xdataSet(j,:)))/(max(xdataSet(j,:))-min(xdataSet(j,:)));
        if xNormalizada(j,i)==0
            xNormalizada(j,i)=0.001;
        end
    end
end
data=[xNormalizada,ydataSet];

setenta=round(size(xNormalizada,1)*70/100);
treinta=round(size(xNormalizada,1)*30/100);

for i=1:setenta
    for j=1:setenta
       data70(j,:)=xNormalizada(j,:);
       ydata70(j,:)=ydataSet(j);
    end
end
d70=[data70,ydata70];
valor=setenta;
for a=1:treinta
    for b=1:treinta
       data30(b,:)=xNormalizada(valor+b,:);
       ydata30(b,:)=ydataSet(valor+b);
 
    end
end
d30=[data30,ydata30];
target=(ydata70==1:2);


%% TESTEO KNN
% dXTest = data30(:,1:end-1);
% dYTest = d30(:,end);
% % knn
% mknn=trainClassifierknn(d70);
% si=0;
% no=0;
% for i=1:size(data30,1)
%     yPre=mknn.predictFcn(data30(i,:));
%     if(yPre==ydata30(i,:))
%     si=si+1;
%     else
%     no=no+1;
%     end
% end
% error=100*no/(size(data30,1));
% exactitud=100*si/(size(data30,1));

%% ANN
% si=0;
% no=0;
% for i=1:size(data30,1)
%     y=myNeuralNetworkFunctionANN(data30(i,:))
%     [idx,class]=max(y);
%     if(class==ydata30(i,:))
%     si=si+1;
%     else
%     no=no+1;
%     end
% end
% error=100*no/(size(data30,1));
% exactitud=100*si/(size(data30,1));
%% TESTEO SVM
dXTest = data30(:,1:end-1);
dYTest = d30(:,end);
% svm
msvm=trainClassifierSVM(d70);
si=0;
no=0;
for i=1:size(data30,1)
    yPre=msvm.predictFcn(data30(i,:));
    if(yPre==ydata30(i,:))
    si=si+1;
    else
    no=no+1;
    end
end
error=100*no/(size(data30,1));
exactitud=100*si/(size(data30,1));

