function byuserStep6_Simulation()
close all;

%Create user interface object for SRD
SRD = SRDuserinterface;

%Load SimulationEngine and set up the simulation parameters
SimulationEngine = SRD.GetSimulationEngine();
SimulationEngine.Time = 10;
SimulationEngine.CustomSolverType = 'DAE Runge';
%Can use 'Euler', 'Taylor', 'Runge', 'Implicit Euler', 'DAE Taylor', 'DAE Runge';

ICq = SRD.GetInitialPosition;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Here we try to find IC suitable for the DAE problem - begin
          
options = optimoptions('lsqnonlin', 'Algorithm', 'levenberg-marquardt', 'Display', 'none', 'Jacobian', 'off');

problem.objective = @g_dynamics_LagrangeMultiplier_Constraint;
problem.x0 = ICq;
problem.lb = [];
problem.ub = [];
problem.solver = 'lsqnonlin';
problem.options = options;

SimulationEngine.IC.q = lsqnonlin(problem);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Set up a controller

%PD controller example
% SimulationEngine.InverseDynamics = SimulationEngine.GetInverseDynamics('Schaal Inverse Dynamics');
% 
% Controller = SimulationEngine.GetPDcontroller('Schaal PD', ...
%     'Kp', eye(SimulationEngine.dof)*100, 'Kd', eye(SimulationEngine.dof)*50, ...
%     'get_desired_lambda', SimulationEngine.GetPlugInput('zero_desired_lambda'));

% Controller = SimulationEngine.GetPDcontroller('Computed torque PD wpinv', Kp, Kd);
%Can use .GetPDcontroller with 'PD', 'Varying gains PD', 'Computed torque PD'
%'Computed torque PD wpinv'
%or .GetLQRcontroller with 'LQR'
%or .GetMPcontroller with 'MP', 'One step MP'

%LQR example
LQRController = SimulationEngine.GetLQRcontroller('LQR', 'unified_Q', 10000, 'unified_R', 1);
% Controller = SimulationEngine.GetLQRcontroller('LQR wpinv', 'unified_Q', 10000, 'unified_R', 1, ...
%     'get_desired_lambda', SimulationEngine.GetPlugInput('zero_desired_lambda'));
%cane use 'LQR', 'ProjectedLQR'

% Controller = SimulationEngine.GetNestedConstraintsController(LQRController, 'NCCviaQP');

ControlInput = SimulationEngine.GetPlugInput('Constant_IC_ControlInput');

%Simulate
tic
Res = SimulationEngine.Simulation(ControlInput, LQRController);
%Can use .Simulation() and .SimulationStateSpace()
toc

%Plot the output
figure_handle = SimulationEngine.PlotSimulationResults(Res.SimulationOutput, 'P, dP; V, U');

%If need - animate the resulting motion
ToAnimate = false;
if ToAnimate
    Animation = SRDAnimation();
    Animation.Animation_Accelerator = 100;
    Animation.Animate(Res.SimulationOutput.Position);
end
end
