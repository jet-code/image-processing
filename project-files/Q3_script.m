clc; clear; close all;
% ECE 6397 Matlab project
% Q3

%3c
M = load('MultiChannel.mat');
num_classes = 9;

C = GaussianClassify(M,num_classes);

accuracy = MeasurePeformance(C,M.y2)





