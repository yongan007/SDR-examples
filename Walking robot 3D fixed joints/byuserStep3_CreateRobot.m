close all; clear; %clear classes; %clc;

%Create user interfase object for SRD
SRD = SRDuserinterface;
%Create ground link
Ground = SRD.CreateGroundLink();

%Create other links
index = 1;
Torso = SRDLinkWithJoint('FloatingBase_6dof', index, 'datafile_Torso',    Ground, 1); index = index + 1;
RightHip = SRDLinkWithJoint('abs_spherical',  index, 'datafile_RightHip', Torso,  3); index = index + 1;
LeftHip =  SRDLinkWithJoint('abs_spherical',  index, 'datafile_LeftHip',  Torso,  4); index = index + 1;
RightShin = SRDLinkWithJoint('pivotY',  index, 'datafile_RightShin', RightHip,  2); index = index + 1;
LeftShin =  SRDLinkWithJoint('pivotY',  index, 'datafile_LeftShin',  LeftHip,   2); index = index + 1;
RightFoot = SRDLinkWithJoint('fixed',  index, 'datafile_RightFoot', RightShin,  2); index = index + 1;
LeftFoot =  SRDLinkWithJoint('fixed',  index, 'datafile_LeftFoot',  LeftShin,   2); index = index + 1;

%Set generalised coordinates; Use negative numbers to make clock-wise
%rotations be positive
Torso.SetUsedGenCoordinates([1, 2, 3, 4, 5, 6]);
RightHip.SetUsedGenCoordinates([7, 8, 9]);
LeftHip.SetUsedGenCoordinates([10, 11, 12]);
RightShin.SetUsedGenCoordinates(13);
LeftShin.SetUsedGenCoordinates(14);
RightFoot.SetUsedGenCoordinates([]);
LeftFoot.SetUsedGenCoordinates([]);

RightFoot.RelativeOrientation = roty(0);
LeftFoot.RelativeOrientation = roty(0);

LinkArray = [Ground; Torso; RightHip; LeftHip; 
             RightShin; LeftShin;
             RightFoot; LeftFoot]; %Create array of links
%Define initial position of the robot
InitialPosition = [0; 0; 0;   0; 0; 1.00;
                   0; -pi/3; 0;   0; -pi/6; 0;
                   pi/3; 1.35*pi/3];
AxisLimits = [-0.5; 0.5; -0.5; 0.5; 0; 1]*2; %Set axis limits for the snapshot
ViewAngle = [30, 30];

SRD.CreateRobotStructure(LinkArray, InitialPosition, AxisLimits, ViewAngle); %Create the robot