close all; clear; %clear classes;
% clc; 

%Create user interfase object for SRD
SRD = SRDuserinterface();
SimulationEngine = SRD.GetSimulationEngine;

% SymbolicEngine = SRD.GetNewSymbolicEngine;
% SymbolicEngine.Math.simplify_Steps = 1;
% SRD.SaveSymbolicEngine(SymbolicEngine);
% SRD.RecreateSymbolicEngine = false;

%Generate dynamics eq.
Casadi = true;
ToLinearize = false; 
ToSimplify = true; 
SRD.ToOptimizeFunctions = true;
SRD.UseParallelizedSimplification = false;

dissipation_coefficients = 0.5*ones(SimulationEngine.dof, 1);

timerVal = tic;
SRD.DeriveEquationsForSimulation(Casadi, ToLinearize, ToSimplify, dissipation_coefficients);
toc(timerVal);


