close all; clear;
SRD = SRDuserinterface;

% aliengo, minicheetah, dreamwalker and spot are not displaying properly

%##### current compatible URDFS ###### - 5 quadruped, 3 bipeds and 1
%monoped

% 1)a1 unitree
% 2 anymal
% 3 ar600 bipadal
% 4 5 6 hyq - monoped, biped and quadruped
% 7 littledog
% 8 laikago unitree
% 9 atlas

LinkArray = UP_GetLinkArrayFromURDF('UrdfFilePath','./urdf/biped.urdf','ParseSTL',true);
InitialPosition = zeros(1,6);
% 



AxisLimits = []; %Set axis limits for the snapshot
ViewAngle = [45, 45];
DrawFrames = true;
DrawMeshes = true;
SRD.CreateRobotStructure(LinkArray, InitialPosition, AxisLimits, ViewAngle,DrawFrames,DrawMeshes); %Create the robot
axis equal;