LinkLength = 0.6; 

Torso_length = 0.5; Torso_width = 0.25;
Hip_length = 0.5; Hip_width = 0.1;
Shin_length = 0.5; Shin_width = 0.1;
Foot_length = 0.2; Foot_width = 0.1;

TorsoMass = 20;
HipMass = 10;
ShinMass = 10;
FootMass = 5;

%%%%%%%%%%%%%
%%% Torso %%%

RelativeBase = [0; 0; 0];   
RelativeFollower = [0,                0,                0,                 0,                 0,                 0;
                    0,                Torso_width/2,    Torso_width/2,     -Torso_width/2,    -Torso_width/2,    0;
                    Torso_length/2,   Torso_length/2,   -Torso_length/2,   -Torso_length/2,   Torso_length/2,    Torso_length/2];     
RelativeCoM = [0; 0; 0]; 
Mass = TorsoMass;
Inertia = diag([0.1; 1; 0.1])*(1/12)*TorsoMass*Torso_length^2;
Name = 'Torso';
save('datafile_Torso', 'RelativeBase', 'RelativeFollower', 'RelativeCoM', 'Mass', 'Inertia', 'Name');

%%%%%%%%%%%
%%% Hip %%%
 
RelativeFollower = [0,                 0,              0;
                   -Hip_width/2,       0,              Hip_width/2;
                    0,                -Hip_length,     0];     
RelativeCoM = [0; 0; -Hip_length/2]; 
Mass = HipMass;
Inertia = diag([0.1; 1; 0.1])*(1/12)*HipMass*Hip_length^2;
Name = 'Right Hip';
save('datafile_RightHip', 'RelativeBase', 'RelativeFollower', 'RelativeCoM', 'Mass', 'Inertia', 'Name');
Name = 'Left Hip';
save('datafile_LeftHip', 'RelativeBase', 'RelativeFollower', 'RelativeCoM', 'Mass', 'Inertia', 'Name');

%%%%%%%%%%%
%%% Shin %%%
 
RelativeFollower = [0,                  0,               0;
                   -Shin_width/2,       0,               Shin_width/2;
                    0,                 -Shin_length,     0];   
% RelativeFollower = [0,                  0,            Shin_width,       Shin_width,   0,            0;
%                    -Shin_width/2,       0,            -Shin_width/3,    Shin_width/3,   0,            Shin_width/2;
%                     0,                 -Shin_length,  -Shin_length      -Shin_length,   -Shin_length, 0];                   
RelativeCoM = [0; 0; -Shin_length/2]; 
Mass = ShinMass;
Inertia = diag([0.1; 1; 0.1])*(1/12)*ShinMass*Shin_length^2;
Name = 'Right Shin';
save('datafile_RightShin', 'RelativeBase', 'RelativeFollower', 'RelativeCoM', 'Mass', 'Inertia', 'Name');
Name = 'Left Shin';
save('datafile_LeftShin', 'RelativeBase', 'RelativeFollower', 'RelativeCoM', 'Mass', 'Inertia', 'Name');


%%%%%%%%%%%
%%% Foot %%%      
RelativeFollower = [Foot_length/2,   Foot_length/2,   -Foot_length/2,   -Foot_length/2,   Foot_length/2,   Foot_length/2;
                    0,               Foot_width/2,    Foot_width/2,     -Foot_width/2,   -Foot_width/2,    0;
                    0,               0,                0,                0,               0,               0]; 
RelativeCoM = [0; 0; 0]; 
Mass = FootMass;
Inertia = diag([0.1; 1; 0.1])*(1/12)*FootMass*Foot_length^2;
Name = 'Right Foot';
save('datafile_RightFoot', 'RelativeBase', 'RelativeFollower', 'RelativeCoM', 'Mass', 'Inertia', 'Name');
Name = 'Left Foot';
save('datafile_LeftFoot', 'RelativeBase', 'RelativeFollower', 'RelativeCoM', 'Mass', 'Inertia', 'Name')

