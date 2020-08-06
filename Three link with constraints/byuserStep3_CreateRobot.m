close all; clear; %clear classes; %clc;

%Create user interfase object for SRD
SRD = SRDuserinterface;
%Create ground link
Ground = SRD.CreateGroundLink();

Ground.RelativeFollower = [0;0;1];

%Create other links
index = 1;
Shin =  SRDLinkWithJoint('pivotY', index, 'datafile_Shin',  Ground, 1); index = index + 1;
Hip =   SRDLinkWithJoint('pivotY', index, 'datafile_Hip',   Shin,   1); index = index + 1;
Torso = SRDLinkWithJoint('pivotY', index, 'datafile_Torso', Hip,    1); index = index + 1;

%Set generalised coordinates; Use negative numbers to make clock-wise
%rotations be positive
Shin.SetUsedGenCoordinates(1);
Hip.SetUsedGenCoordinates(2);
Torso.SetUsedGenCoordinates(3);

LinkArray = [Ground; Shin; Hip; Torso]; %Create array of links
InitialPosition = [9*pi/10; pi/9; pi/8]; %Define initial position of the robot
AxisLimits = [-1; 1; -1; 1; 0; 2]; %Set axis limits for the snapshot
ViewAngle = [0, 0];

SRD.CreateRobotStructure(LinkArray, InitialPosition, AxisLimits, ViewAngle); %Create the robot