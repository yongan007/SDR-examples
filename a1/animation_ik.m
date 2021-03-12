% close all; clear all;

InitialPosition = SRD_get('InitialPosition');

Handler_State = SRD_get_handler__state('InitialPosition', InitialPosition, ...
    'InitialVelocity', zeros(size(InitialPosition)));

Handler_IK_Solution = SRD_get('Handler_IK_Solution');
Handler_dynamics_generalized_coordinates_model = SRD_get('Handler_dynamics_generalized_coordinates_model');
% 
% dt = 0.01;
% tf = Handler_IK_Solution.TimeExpiration;
% % % tf = 0.021;

t0 = 0;
tf = 2;
dt = 0.1;
% linspace(0,10,50)

Handler_Simulation = SRD_get_handler__Simulation(...
    'TimeLog',0:dt:tf );

%%

% p = [0.35 -0.16 0; 0.35 0.16 0; 0.35 0.16 -0.4; 0.35 -0.16 -0.4; 0.35 -0.16 0;...
%     0.70 -0.16 0; 0.35 0.16 0; 0.70 0.16 0; 0.35 0.16 -0.4; 0.70 0.16 -0.4;...
%     0.35 -0.16 -0.4; 0.70 -0.16 -0.4; 0.35 -0.16 0; 0.70 -0.16 0;];
% plot3(p(:,1),p(:,2),p(:,3)) 

DrawRobot_function = SRD_DrawRobot_get_function('DrawRobot_Type', 'STL', ... %'Default' or 'STL' or 'Custom'
    'DrawRobot_Custom_handle', [], ...
    'Function_Type', 'DrawGivenPosition', ... %'DrawGivenPosition' or 'DrawInitialPosition'  or 'DrawCurrentPosition'
    'Chain', [], ...
    'FileName_visuals_config', 'datafile_visuals_config.mat'); %use default visuals

SRD__animate__position('Handler_Simulation', Handler_Simulation, ...
    'Handler_Logger_position', Handler_IK_Solution, ...
    'AnimationTimeLog', 0:10*dt:(tf-dt), ...
    'DrawRobot_function', DrawRobot_function, ...
    'NewFigure', true, ...
    'FigureName', 'Animation', ...
    'FileName_visuals_config', []);
% hold on;
% p = [0.35 -0.16 0; 0.35 0.16 0; 0.35 0.16 -4; 0.35 -0.16 -4; 0.35 -0.16 0;...
%     0.70 -0.16 0; 0.35 0.16 0; 0.70 0.16 0; 0.35 0.16 -4; 0.70 0.16 -4;...
%     0.35 -0.16 -4; 0.70 -0.16 -4; 0.35 -0.16 0; 0.70 -0.16 0;];
% plot3(p(:,1),p(:,2),p(:,3));

task_traj = zeros(3,length(IK_Table));
for i=1:length(IK_Table)

task_traj(:,i) = Handler_IK_Model.get_Task(IK_Table(i,:)');
end

hold on
plot3(task_traj(1,:),task_traj(2,:),task_traj(3,:))
plot3(Obs_pose(1),Obs_pose(2),Obs_pose(3),'.','MarkerSize', 30)

% plotcube([ 0.3 0.3 0.236],[0.5 -0.16 -0.4],.8,[1 0 0])







% Handler_InverseDynamics = SRD_get_handler__InverseDynamics_Vanilla__desired_trajectory(...
%     'Handler_ControlInput', Handler_IK_Solution, ...
%     'Handler_dynamics_generalized_coordinates_model', Handler_dynamics_generalized_coordinates_model, ...
%     'Handler_Simulation', Handler_Simulation);
% 
% 
% MainController = SRD_get_handler__NoInputController(...
%     'Handler_dynamics_generalized_coordinates_model', Handler_dynamics_generalized_coordinates_model);
% 
% 
% Handler_solver = SRD_get_handler__solver_Taylor_test(...
%     'Handler_State', Handler_State, ...
%     'Handler_Controller', MainController, ...
%     'Handler_dynamics_generalized_coordinates_model', Handler_dynamics_generalized_coordinates_model, ...
%     'Handler_Simulation', Handler_Simulation);
% 
% 
% Handler_State_Logger_vanilla = SRD_get_handler__State_Logger__vanilla(...
%     'Handler_State', Handler_State, ...
%     'Handler_Simulation', Handler_Simulation, ...
%     'ToLogAcceleration',  false);
% 
% Handler_SimulationTickDisplay = SRD_get_handler__SimulationTickDisplay(...
%     'Handler_Simulation', Handler_Simulation);
% 
% 
% Handler_Simulation.ControllerArray = {Handler_InverseDynamics; MainController};
% Handler_Simulation.SolverArray = {Handler_solver};
% Handler_Simulation.LoggerArray = {Handler_State_Logger_vanilla, Handler_SimulationTickDisplay};
% 
% Handler_Simulation.Simulate();


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% figure('Color', 'w', 'Name', 'Positions');
% 
% subplot(1, 2, 1)
% SRDgraphic_PlotGeneric(Handler_Simulation.TimeLog, Handler_State_Logger_vanilla.Log.q, ...
%     'NewFigure', false, 'FigureName', 'Generic', ...
%     'LableVariable', 'q', 'Title', []);
% 
% subplot(1, 2, 2)
% SRDgraphic_PlotGeneric(Handler_Simulation.TimeLog, Handler_State_Logger_vanilla.Log.v, ...
%     'NewFigure', false, 'FigureName', 'Generic', ...
%     'LableVariable', 'v', 'Title', []);
% 
% drawnow;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
