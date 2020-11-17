close all; clear; %clear classes;
clc; 

%Create user interfase object for SRD
SRD = SRDuserinterface();



timerVal = tic;
SRD.DeriveEquationsForSimulation('UseCasadi', false, 'ToLinearize', false, 'ToSimplify', false, ...
    'ToRecreateSymbolicEngine', true, 'dissipation_coefficients', [], ...
    'NumberOfWorkers', 8, 'ToUseParallelizedSimplification', false, 'ToOptimizeFunctions', true);
toc(timerVal);