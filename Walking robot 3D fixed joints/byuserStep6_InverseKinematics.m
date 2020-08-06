function byuserStep6_InverseKinematics()
close all; clear; clc;
%Create user interfase object for SRD
SRD = SRDuserinterface;

%Get initial position
InitialPosition = SRD.GetInitialPosition();
IC_Task = g_InverseKinematics_Task(InitialPosition);
Transition = 0.1;

ZeroOrderDerivativeNodes = {IC_Task(1), IC_Task(1)+Transition;
                            IC_Task(2), IC_Task(2);     
                            IC_Task(3), IC_Task(3);     
                            IC_Task(4), IC_Task(4);     
                            IC_Task(5), IC_Task(5);     
                            IC_Task(6), IC_Task(6);     
                            IC_Task(7), IC_Task(7)};    
FirstOrderDerivativeNodes = {0, 0;  
                             0, 0;  
                             0, 0;  
                             0, 0;  
                             0, 0;  
                             0, 0;  
                             0, 0}; 
SecondOrderDerivativeNodes = {0, 0;  
                              0, 0;  
                              0, 0;  
                              0, 0;  
                              0, 0;  
                              0, 0;  
                              0, 0};
TimeOfOneStage = 1;
TimeEnd = (size(ZeroOrderDerivativeNodes, 2) - 1)*TimeOfOneStage;
NodeTimes = (0:TimeOfOneStage:TimeEnd)';
Spline = TPSplineConstructorUI();
Spline.OutOfBoundariesBehaviour = 'LastValue';
Spline.GenerateSplines(NodeTimes, ZeroOrderDerivativeNodes, FirstOrderDerivativeNodes, SecondOrderDerivativeNodes);
% Spline.Plot('v');

    function [T, dT, ddT] = DesiredTask(t)
        [T, dT, ddT] = Spline.EvaluateAll(t);
    end

%Solve inverse kinematics numerically
SRD.SetupNumericInverseKinematics('DesiredTask', @DesiredTask, 'TimeRange', [NodeTimes(1); NodeTimes(end)], ...
    'PolynomialDegree', 8, 'NumberOfSegments', 10, 'SolverType', 'lsqnonlin');
%you can use 'lsqnonlin', 'fmincon' and 'ProjectionNonlinSolver'

InverseKinematicsEngine = SRD.GetInverseKinematicsEngine;
InverseKinematicsEngine.use_pinv = true;
InverseKinematicsEngine.GenerateLookupTable;
SRD.SaveInverseKinematicsEngine(InverseKinematicsEngine);

figure;
subplot(2, 2, 1); 
plot(InverseKinematicsEngine.LookupTable.Time, InverseKinematicsEngine.LookupTable.Position, 'LineWidth', 3); 
grid on; title('Position');
subplot(2, 2, 2); 
plot(InverseKinematicsEngine.LookupTable.Time, InverseKinematicsEngine.LookupTable.Velocity, 'LineWidth', 3); 
grid on; title('Velocity');
subplot(2, 2, 3); 
plot(InverseKinematicsEngine.LookupTable.Time, InverseKinematicsEngine.LookupTable.Acceleration, 'LineWidth', 3); 
grid on; title('Acceleration');

ToAnimate = true;
if ToAnimate
    InverseKinematicsEngine = SRD.GetInverseKinematicsEngine;
    Animation = SRDAnimation();
    Animation.Animate(InverseKinematicsEngine.LookupTable.Position);
end

end