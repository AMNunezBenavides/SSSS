% clc

% close all;

% clear all;

data = readmatrix('creditcard.csv');

dsX = data(:,1:30);

dsY = data(:,end);

clase1 = find(dsY ==1);

numClas = unique(dsY);

y = (dsY ==1:length(numClas));
target=(ydata70==1:2);