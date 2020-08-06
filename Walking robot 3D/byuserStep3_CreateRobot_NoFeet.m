close all; clear; %clear classes; %clc;

%Create user interfase object for SRD
SRD = SRDuserinterface;
%Create ground link
Ground = SRD.CreateGroundLink();

%Create other links
index = 1;
Torso = SRDLinkWithJoint('prismatic_XYZ', index, 'datafile_Torso',    Ground, 1); index = index + 1;
Torso.StaticOrientationMatrix = eye(3);
RightHip = SRDLinkWithJoint('abs_spherical',  index, 'datafile_RightHip', Torso,  3); index = index + 1;
LeftHip =  SRDLinkWithJoint('abs_spherical',  index, 'datafile_LeftHip',  Torso,  4); index = index + 1;
RightShin = SRDLinkWithJoint('pivotY',  index, 'datafile_RightShin', RightHip,  2); index = index + 1;
LeftShin =  SRDLinkWithJoint('pivotY',  index, 'datafile_LeftShin',  LeftHip,   2); index = index + 1;

%Set generalised coordinates; Use negative numbers to make clock-wise
%rotations be positive
Torso.SetUsedGenCoordinates([1, 2, 3]);
RightHip.SetUsedGenCoordinates([4, 5, 6]);
LeftHip.SetUsedGenCoordinates([7, 8, 9]);
RightShin.SetUsedGenCoordinates(10);
LeftShin.SetUsedGenCoordinates(11);

LinkArray = [Ground; Torso; RightHip; LeftHip; 
             RightShin; LeftShin]; %Create array of links
%Define initial position of the robot
InitialPosition = [0; 0; 1.02;
                   0; -pi/3; 0;   0; -pi/6; 0;
                   pi/3; 1.35*pi/3];
AxisLimits = [-0.5; 0.5; -0.5; 0.5; 0; 1]*2; %Set axis limits for the snapshot
ViewAngle = [30, 30];

SRD.CreateRobotStructure(LinkArray, InitialPosition, AxisLimits, ViewAngle); %Create the robot