%% clean up
clc
close all 
clear all

%% params

xTest = [1,5,2,7;1,6,5,7;1,2,2,1];
yTest = [1,1,-1];
w = [0.8, 0.25, -1.42, 0.13];

%% multiplicacion

for i = 1: size(xTest, 1)
    mul(i,:) = xTest(i,:) * w.';
end

%% calculo

net = hardlims(mul);

%% error

cont = 0;
for i = 1: length(yTest)
    if(yTest(i) == net(i))
    cont = cont +1;
    end
end

error = (length(net)-cont)/length(net)*100;
acc = 100-error;


