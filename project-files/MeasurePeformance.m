function accuracy = MeasurePeformance(L_classify,L_actual)
% L_classify is a vector of class labels output from a maximum likelihood
% (ML) alg, and L_actual is a vector of the true class labels for test data
% MeasurePeformance calculates the percent accuracy of the classification as
% the number of correct classifications divided by total number of samples.

N = length(L_actual);

N_correct = sum(L_classify == L_actual);

accuracy = 100*N_correct/N;