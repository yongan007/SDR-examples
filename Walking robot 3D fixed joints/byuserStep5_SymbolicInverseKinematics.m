close all; clear; %clear classes;
clc; 

%Create user interfase object for SRD
SRD = SRDuserinterface;
SymbolicEngine = SRD.GetSymbolicEngine();

%%%%%%%%%%%%
%construct inverse kinematics task
rC = SymbolicEngine.GetCoM();
Constraint = SymbolicEngine.LagrangeMultiplierEq.JointSpace.Constraint;
Task = [rC(1); Constraint];
%%%%%%%%%

%Call function for creating SRD inverse kinematics engine
SRD.SetupSymbolicInverseKinematics(Task);