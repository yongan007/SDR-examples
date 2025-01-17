function out1 = g_dynamics_ControlMap(in1)
%G_DYNAMICS_CONTROLMAP
%    OUT1 = G_DYNAMICS_CONTROLMAP(IN1)

%    This function was generated by the Symbolic Math Toolbox version 8.1.
%    12-Jun-2020 18:25:10

q1 = in1(1,:);
q2 = in1(2,:);
q3 = in1(3,:);
t2 = sin(q1);
t3 = sin(q2);
t4 = cos(q1);
out1 = reshape([1.0,0.0,0.0,t2.*t3,t4,0.0,-t2.*(t3-sin(q2+q3)),0.0,t4],[3,3]);
