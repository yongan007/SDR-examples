function byuserStep6_Simulation()
close all;

%Create user interface object for SRD
SRD = SRDuserinterface;

InverseKinematicsEngine = SRD.GetInverseKinematicsEngine;
SymbolicEngine = SRD.GetSymbolicEngine();

Constraint_dof = max(size(SymbolicEngine.LagrangeMultiplierEq.JointSpace.Constraint));

%Load SimulationEngine and set up the simulation parameters
SimulationEngine = SRD.GetSimulationEngine();
SimulationEngine.Time = InverseKinematicsEngine.TotalTime;
SimulationEngine.CustomSolverType = 'DAE Runge';
SimulationEngine.TimeStep = 0.001;
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
Mass = SimulationEngine.GetTotalMass;

    function desired_lambda = get_desired_lambda(ControllerInput)
        desired_lambda = zeros(Constraint_dof, 1);
    end

id_n = eye(SimulationEngine.dof);

%PD controller example
Controller = SimulationEngine.GetPDcontroller('Computed torque PD wpinv', 'Kp', 500*eye(SimulationEngine.dof), ...
    'Kd', 50*eye(SimulationEngine.dof), 'get_desired_lambda', @get_desired_lambda, ...
    'alpha_control', 10^-10, 'alpha_lambda', 10^-16, 'WeightedPseudoinverseType', 'Tikhonov regularization');

%LQR example
% Parameters = [];
% Parameters.get_desired_lambda = @get_desired_lambda;
% Parameters.Q = blkdiag(1*id_n, 0.1*id_n);
% Parameters.unified_R = 0.001;
% Controller = SimulationEngine.GetLQRcontroller('TikhonovLQRcontroller', Parameters);

% Parameters = [];
% Parameters.Q = blkdiag(1*id_n, 0.1*id_n);
% Parameters.unified_R = 0.001;
% Controller = SimulationEngine.GetLQRcontroller('ProjectedLQR', Parameters);


    function TesterOutputStructure = Tester(~, ControllerOutput, SolverOutputStructure)
        TesterOutputStructure.LangangeMultipliersSolver = SolverOutputStructure.N;
        
        if isfield(ControllerOutput, 'lambda')
            TesterOutputStructure.LangangeMultipliersController = ControllerOutput.lambda;
        else
            TesterOutputStructure.LangangeMultipliersController = NaN(Constraint_dof, 1);
        end
        
        if isfield(ControllerOutput, 'lambda_desired')
            TesterOutputStructure.DesiredLangangeMultipliersController = ControllerOutput.lambda_desired;
        else
            TesterOutputStructure.DesiredLangangeMultipliersController = NaN(Constraint_dof, 1);
        end

    end

% ControlInput = SimulationEngine.GetPlugs('Constant_IC_ControlInput');
ControlInput = @InverseKinematicsEngine.EvaluatePolynomialApproximation;

%Simulate
tic
Res = SimulationEngine.Simulation(ControlInput, Controller, [], @Tester);
%Can use .Simulation() and .SimulationStateSpace()
toc

%Plot the output
figure_handle = SimulationEngine.PlotSimulationResults(Res.SimulationOutput, 'P+dP, V+dV');


%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
LangangeMultipliersSolver =     zeros(size(Res.TesterOutput, 1), Constraint_dof);
LangangeMultipliersController = zeros(size(Res.TesterOutput, 1), Constraint_dof);
DesiredLangangeMultipliersController = zeros(size(Res.TesterOutput, 1), Constraint_dof);
% SlackVariablesController =      zeros(size(Res.TesterOutput, 1), imp_task_dof);
% optimization_exitflag =         zeros(size(Res.TesterOutput, 1), 1);
for i = 1:size(Res.TesterOutput, 1)
    LangangeMultipliersSolver(i, :)     = Res.TesterOutput{i}.LangangeMultipliersSolver';
    LangangeMultipliersController(i, :) = Res.TesterOutput{i}.LangangeMultipliersController';
    DesiredLangangeMultipliersController(i, :) = Res.TesterOutput{i}.DesiredLangangeMultipliersController';
%     SlackVariablesController(i, :) = Res.TesterOutput{i}.SlackVariablesController';
%     optimization_exitflag(i) = Res.TesterOutput{i}.optimization_exitflag;
end

BP = BetterPlotsClass;
BP.ToMakeAnnotationLines = false;
figure_handle_LM = BP.CreateBigFigure;
BP.ArrowLengthX = 0.37;
BP.ArrowLengthY = 0.4;

subplot(2, 2, 1)
BP.LineWidth = 1;
h(1) = BP.Plot(Res.SimulationOutput.Time, LangangeMultipliersController(:, [1, 3]), '$$t$$, s', '$$F_{fr,j}$$, N', figure_handle_LM); hold on;
plot(Res.SimulationOutput.Time, LangangeMultipliersSolver(:, [1, 3]), 'LineWidth', 3, 'LineStyle', '--');
plot(Res.SimulationOutput.Time, DesiredLangangeMultipliersController(:, [1, 3]), 'LineWidth', 3, 'LineStyle', ':');
title('Langange multipliers solver + controller (thiner lines)');

subplot(2, 2, 2)
h(2) = BP.Plot(Res.SimulationOutput.Time, LangangeMultipliersController(:, [2, 4]), '$$t$$, s', '$$N_{z,j}$$, N', figure_handle_LM); hold on;
plot(Res.SimulationOutput.Time, LangangeMultipliersSolver(:, [2, 4]), 'LineWidth', 3, 'LineStyle', '--');
plot(Res.SimulationOutput.Time, DesiredLangangeMultipliersController(:, [2, 4]), 'LineWidth', 3, 'LineStyle', ':');
title('Normal reactions; Langange multipliers solver + controller (thiner lines)');

subplot(2, 2, 4)
BP.LineWidth = 3;
h(3) = BP.Plot(Res.SimulationOutput.Time, Res.SimulationOutput.ControlActions, '$$t$$, s', '$$u$$, Hm', figure_handle_LM);
title('Control actions');

BP.FixArrowsAllSubplots(h);


%If need - animate the resulting motion
ToAnimate = true;
if ToAnimate
    Animation = SRDAnimation();
    Animation.Animation_Accelerator = 100;
    Animation.Animate(Res.SimulationOutput.Position);
end
end
