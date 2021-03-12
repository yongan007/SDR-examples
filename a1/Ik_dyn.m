clear all ; close all;

%Get initial position
InitialPosition = SRD_get('InitialPosition');
Handler_IK_Model = SRD_get('Handler_IK_Model');
Task = Handler_IK_Model.get_Task;
IC_Task = Task(InitialPosition);
Handler_dynamics = SRD_get("Handler_dynamics_generalized_coordinates_model");


H = Handler_dynamics.get_joint_space_inertia_matrix;
t0 = 0;
tf = 3;
dt = 0.1;

TimeTable = linspace(0,10,50);

Goal_task = [0.55;...
             IC_Task(2);...
             -0.1];
         
  
Obs_pose  = [0.5;-0.1325;-0.164];     
Task_params = [Goal_task,Obs_pose];

         
% [dist,diff_dist]= get_distance(FK_fun,q,xb);

Task_velocity = task_velocity(IC_Task,Goal_task,tf);

IK_Table = SRD_InverseKinematics_GenerateTable_ode(...
    'Task_params',Task_params,...
    'Handler_IK_Model', Handler_IK_Model, ...
    'InitialGuess', InitialPosition, ...
    'method', @SRD_InversePositionProblemSolver_Ode_Dynamics,...
    'TimeTable', TimeTable);

SRD_InverseKinematics_GenerateTable_tester(...
    'Handler_IK_Model', Handler_IK_Model, ...
    'TimeTable', TimeTable, ...
    'IK_Table', IK_Table);

Handler_IK_Solution = SRD_get_handler__IK_solution__interp1(...
    'Handler_IK_Model_name', 'Handler_IK_Model', ...
    'Handler_IK_task_name', 'Handler_IK_task', ...
    'IK_Table', IK_Table, ...
    'TimeTable', TimeTable, ...
    'method', 'linear');

SRD_save(Handler_IK_Solution, 'Handler_IK_Solution')


disp("goal pose: "+Goal_task);
disp("desired: "+Handler_IK_Model.get_Task(IK_Table(end,:)'));


