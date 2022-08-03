%% clean up
clc 
close all 
clear all

%% params init

pesos = [0.5,-0.8,0.96,0.79];
carac = [1,3,2.11,1.2];

%% 
res = carac * pesos.';

logsig(res)

%%
x = randi([1,5],1,5);
w = rand(1,6);
%% 
x = [1 x];

res = logsig(x * w.');
