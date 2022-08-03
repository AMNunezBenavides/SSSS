clc
close all
clear

dsX = [1,135,88,1.8,1,120,220,48,5000];
W=[0.18,0.7,0.24,-0.15,0.63,0.85,0.4,0.81,-0.65];
W1= [0.26,0.81,0.35,0.83,0.92,-0.75,-0.08,0.57,0.16];
W2=[-0.84,0.24,-0.19,-0.47,0.58,0.28,0.38,0.05,0.9];
a= dsX*W';
b=dsX*W1';
c=dsX*W2';

Z = [a,b,c];

% softmax
resul = sum(exp(Z));
ecsoftmax = exp(Z)/resul;

treshold = 0.8;%

for i=1:length(ecsoftmax)
    if ecsoftmax(i,:) > treshold
    y = ecsoftmax;
    end
end