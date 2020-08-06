function byuserStep7_Simulation()
close all;

%Create user interface object for SRD
SRD = SRDuserinterface;

%Load SimulationEngine and set up the simulation parameters
SimulationEngine = SRD.GetSimulationEngine();
SimulationEngine.CustomSolverType = 'Taylor';
%Can use 'Euler', 'Taylor', 'Runge', 'Implicit Euler', 'DAE Taylor', 'DAE Runge';
SimulationEngine.IC.q = SimulationEngine.IC.q + rand(size(SimulationEngine.IC.q))*0.5;
SimulationEngine.IC.v = SimulationEngine.IC.v + rand(size(SimulationEngine.IC.v))*0.5;


%Load InverseKinematicsEngine
% InverseKinematicsEngine = SRD.GetInverseKinematicsEngine();
% SimulationEngine.Time = InverseKinematicsEngine.TimeEnd - 0.0;
% ControlInput = @InverseKinematicsEngine.EvaluatePolynomialApproximation;

ControlInput = SimulationEngine.GetPlugInput("Constant_IC_ControlInput");

%Set up a controller

%PD controller example
% Controller = SimulationEngine.GetPDcontroller('Varying gains PD', 'Kp', eye(SimulationEngine.dof)*500, ...
%                                                                   'Kd', eye(SimulationEngine.dof)*100);
%Can use .GetPDcontroller with 'PD', 'Varying gains PD', 
%'Computed torque PD' 'Computed torque PD wpinv'
%
%or .GetLQRcontroller with 'LQR', 'ProjectedLQR', 'LQR wpinv'
%or .GetMPcontroller with 'MP', 'One step MP'

%LQR example
Controller = SimulationEngine.GetLQRcontroller('LQR', 'unified_Q', 10000, 'unified_R', 1, ...
    'ILQR_TimeStep', 0.1);

%LQR example
% Controller = SimulationEngine.GetMPcontroller('MP', 'unified_Q', 10000, 'unified_R', 1);
% Controller = SimulationEngine.GetMPcontroller('MP', 'unified_Q', 10000, 'unified_R', 1, ...
%     'NumberOfPredictionSteps', 10, 'MP_PredictionTimeStep', 0.005);

% LimitController = SimulationEngine.LimitControllerOutput(LQRController, 150, -180);

%Simulate
tic
Res = SimulationEngine.Simulation(ControlInput, Controller);
%Can use .Simulation() and .SimulationStateSpace()
toc

%Plot the output
figure_handle = SimulationEngine.PlotSimulationResults(Res.SimulationOutput, 'P, dP; V, U');

%If need - animate the resulting motion
ToAnimate = true;
if ToAnimate
    Animation = SRDAnimation();
    Animation.Animation_Accelerator = 100;
    Animation.Animate(Res.SimulationOutput.Position);
end
end