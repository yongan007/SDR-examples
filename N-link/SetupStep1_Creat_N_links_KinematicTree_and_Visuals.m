close all; clear; %clear classes; %clc;

NumberOfLinks = 5;

Link   = cell(NumberOfLinks+1, 1);
Joints = cell(NumberOfLinks, 1);

Link{1} = SRD_get_Link_Ground();

follower = [0;0;0.5];

for index = 1:NumberOfLinks
    
Link{index+1} = SRD_get_Link(...
    'Order', index, ...
    'Name', ['Link_', num2str(index)], ...
    'RelativeBase', zeros(3, 1), ...
    'RelativeFollower', pad(follower, [0;0.02;0]), ...
    'RelativeCoM', follower/2, ...
    'Mass', 10, ...
    'Inertia', diag([1/12*10*0.5, 1/12*10*0.5, 0.1*1/12*10*0.5]), ...
    'ToDisplay', true, ...
    'Color', 'r', ...
    'StlPath', []);

Joints{index} = SRD_get_Joint_PivotX(...
    'Name', ['Joint_', num2str(index)], ...
    'ChildLink',  Link{index+1}, ...
    'ParentLink', Link{index}, ...
    'ParentFollowerNumber', 1, ...
    'UsedGeneralizedCoordinates', 1, ...
    'UsedControlInputs', 1, ...
    'DefaultJointOrientation', eye(3));
end

LinkArray = [Link{:}];
    
% LinkArray = [Ground; Link_1; Link_2; Link_3; Link_4]; %Create array of links
SRD_save(LinkArray, 'LinkArray');

InitialPosition = randn(NumberOfLinks, 1); %Define initial position of the robot
SRD_save(InitialPosition, 'InitialPosition');

Chain = SRD_Chain(LinkArray);
SRD_save(Chain, 'Chain');
%Chain.Update(InitialPosition)


SRD_SetupVisuals('AxisLimits', [-1; 1; -1; 1; -1; 1]*2, ...
    'ViewAngle', [-37.5, 30], ...
    'ToDrawMeshes', false, ...
    'Animation_ToUseGrid', true, ...
    'Animation_ToUseGridMinor', true, ...
    'DrawRobot_Default_RobotColor', [0.6 0.3 0], ...
    'DrawRobot_Default_EdgeAlpha', 0.3, ...
    'DrawRobot_Default_FaceAlpha', 1, ...
    'DrawRobot_Default_LineWidth', 0.5, ...
    'DrawRobot_STL_FaceColor', [0.8 0.8 1.0], ...
    'DrawRobot_STL_EdgeColor', 'none', ...
    'DrawRobot_STL_FaceLighting', 'gouraud', ...
    'DrawRobot_STL_AmbientStrength', 0.15, ...
    'DrawRobot_STL_camlight', 'headlight', ...
    'DrawRobot_STL_material', 'metal', ... %shiny dull metal
    'ToDrawFrames', false, ...
    'DrawRobot_Frame_Scale', 0.2, ...
    'DrawRobot_Frame_LineWidth', 1);

DrawRobot_function = SRD_DrawRobot_get_function('DrawRobot_Type', 'Default', ... %'Default' or 'STL' or 'Custom'
    'DrawRobot_Custom_handle', [], ...
    'Function_Type', 'DrawGivenPosition', ... %'DrawGivenPosition' or 'DrawInitialPosition'  or 'DrawCurrentPosition'
    'Chain', Chain);

DrawRobot_function(InitialPosition, [])
SRD__make_default_scene('Default')


function vv = pad(v, e)
     
vv = [v, v+e, e, -e, v-e, v];

end
