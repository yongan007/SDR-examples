close all; clear; %clear classes;
% clc; 

%Create user interfase object for SRD
SRD = SRDuserinterface();

% SymbolicEngine = SRD.GetNewSymbolicEngine;
% SymbolicEngine.Math.simplify_Steps = 1;
% SRD.SaveSymbolicEngine(SymbolicEngine);
% SRD.RecreateSymbolicEngine = false;

%Generate dynamics eq.
SRD.ToOptimizeFunctions = true;
SRD.UseParallelizedSimplification = false;

timerVal = tic;
SRD.DeriveEquationsForSimulation('UseCasadi', false, 'ToLinearize', false, 'ToSimplify', true, ...
    'dissipation_coefficients', 0.5);
toc(timerVal);


