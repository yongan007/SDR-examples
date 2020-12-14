function Task = g_Constraint(in1)
%G_CONSTRAINT
%    TASK = G_CONSTRAINT(IN1)

%    This function was generated by the Symbolic Math Toolbox version 8.4.
%    19-Nov-2020 18:56:56

q1 = in1(1,:);
q2 = in1(2,:);
q3 = in1(3,:);
t2 = q1+q2;
Task = cos(q3+t2)./2.0+cos(q1)./2.0+cos(t2)./2.0;