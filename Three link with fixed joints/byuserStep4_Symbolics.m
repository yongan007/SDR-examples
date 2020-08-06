close all; clear; %clear classes;
clc; 

%Create user interfase object for SRD
SRD = SRDuserinterface();
SRD.ToOptimizeFunctions = true;
SRD.UseParallelizedSimplification = false;

% SymbolicEngine = SRD.GetSymbolicEngine;
% SymbolicEngine.LinearizationType = 'Naive';
% SRD.SaveSymbolicEngine(SymbolicEngine);

timerVal = tic;
SRD.DeriveEquationsForSimulation('UseCasadi', false, 'ToLinearize', true, 'ToSimplify', true, ...
    'dissipation_coefficients', []);
toc(timerVal);