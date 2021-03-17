
clear;close;
Handler_IK_task = SRD_get('Handler_IK_task');

Handler_IK_Solution = SRD_get('Handler_IK_Solution_Ikdyn');


dof = Handler_IK_Solution.dof_robot;
q = [];
v = [];
a=[];

time_table = Handler_IK_Solution.State.TimeTable;
for t = time_table
qi = Handler_IK_Solution.get_position(t);
q = [q,qi];

get_position_velocity_acceleration = Handler_IK_Solution.get_position_velocity_acceleration(t);
v = [v,get_position_velocity_acceleration(:,2)];
a = [a,get_position_velocity_acceleration(:,3)];

end

t = repmat(time_table,3,1);

% a = gradient(v(:,:)) ./ gradient(t(:,:));

% v_lin = gradient(q(:,:)) ./ gradient(t(:,:));

plot(time_table,a')
% 
% figure
% plot(v')
% hold on;
% plot(v_lin')

