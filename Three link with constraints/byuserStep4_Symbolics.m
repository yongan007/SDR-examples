close all; clear; %clear classes;
clc; 

%Create user interfase object for SRD
SRD = SRDuserinterface();

%Generate dynamics eq.
ToLinearize = true; 
ToSimplify = true; 
SRD.ToOptimizeFunctions = true;
SRD.UseParallelizedSimplification = false;

dissipation_coefficients = [0.5; 0.5; 0.5];

timerVal = tic;
SRD.DeriveEquationsForSimulation(ToLinearize, ToSimplify, dissipation_coefficients);
toc(timerVal);

%%

SymbolicEngine = SRD.GetSymbolicEngine;

ConstraintValue = [1; 0; 0];

%remember that for SRD Constraint == 0
Constraint = SymbolicEngine.LinkArray(4).AbsoluteFollower - ConstraintValue;
%y-component isn't needed because it s a planar robot, moving in the
%X-Z-plane
Constraint = [Constraint(1); Constraint(3)];

SymbolicEngine.BuildLagrangeMultiplierEq_JS(Constraint, true);

SRD.SaveSymbolicEngine(SymbolicEngine);