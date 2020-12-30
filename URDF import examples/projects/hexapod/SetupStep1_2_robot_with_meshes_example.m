close all; clear; clear classes; clc
SRD = SRDuserinterface;


LinkArray = SRD_GetLinkArrayFromURDF('UrdfFilePath','../../robots_library/spider/urdf/crab_srd.urdf','ParseSTL',true);

Color_0 = [1, 0, 0];
Color_1 = [0.95, 0.5, 0.3];
Color_2 = [0.00, 0.00, 0.00];
Color_3 = [0.1, 0.1, 0.1];
Color_4 = [0, 1, 0];
Color_5 = [0, 0, 1];

SRD_LinkSet_Color(LinkArray, 'crab', Color_0);
SRD_LinkSet_Color(LinkArray, 'thorax', Color_0);

SRD_LinkSet_Color(LinkArray, 'leg_center_r1', Color_1);
SRD_LinkSet_Color(LinkArray, 'coxa_r1', Color_2);
SRD_LinkSet_Color(LinkArray, 'femur_r1', Color_3);
SRD_LinkSet_Color(LinkArray, 'tibia_r1', Color_4);
SRD_LinkSet_Color(LinkArray, 'tibia_foot_r1', Color_5);

SRD_LinkSet_Color(LinkArray, 'leg_center_r2', Color_1);
SRD_LinkSet_Color(LinkArray, 'coxa_r2', Color_2);
SRD_LinkSet_Color(LinkArray, 'femur_r2', Color_3);
SRD_LinkSet_Color(LinkArray, 'tibia_r2', Color_4);
SRD_LinkSet_Color(LinkArray, 'tibia_foot_r2', Color_5);

SRD_LinkSet_Color(LinkArray, 'leg_center_r3', Color_1);
SRD_LinkSet_Color(LinkArray, 'coxa_r3', Color_2);
SRD_LinkSet_Color(LinkArray, 'femur_r3', Color_3);
SRD_LinkSet_Color(LinkArray, 'tibia_r3', Color_4);
SRD_LinkSet_Color(LinkArray, 'tibia_foot_r3', Color_5);

SRD_LinkSet_Color(LinkArray, 'leg_center_l1', Color_1);
SRD_LinkSet_Color(LinkArray, 'coxa_l1', Color_2);
SRD_LinkSet_Color(LinkArray, 'femur_l1', Color_3);
SRD_LinkSet_Color(LinkArray, 'tibia_l1', Color_4);
SRD_LinkSet_Color(LinkArray, 'tibia_foot_l1', Color_5);

SRD_LinkSet_Color(LinkArray, 'leg_center_l2', Color_1);
SRD_LinkSet_Color(LinkArray, 'coxa_l2', Color_2);
SRD_LinkSet_Color(LinkArray, 'femur_l2', Color_3);
SRD_LinkSet_Color(LinkArray, 'tibia_l2', Color_4);
SRD_LinkSet_Color(LinkArray, 'tibia_foot_l2', Color_5);

SRD_LinkSet_Color(LinkArray, 'leg_center_l3', Color_1);
SRD_LinkSet_Color(LinkArray, 'coxa_l3', Color_2);
SRD_LinkSet_Color(LinkArray, 'femur_l3', Color_3);
SRD_LinkSet_Color(LinkArray, 'tibia_l3', Color_4);
SRD_LinkSet_Color(LinkArray, 'tibia_foot_l3', Color_5);


InitialPosition = zeros(18,1);
% InitialPosition = [0, 0, pi/2, 0, 0, pi/2, 0, 0, pi/2, 0, 0, pi/2]';


SRD_save(LinkArray, 'LinkArray');
SRD_save(InitialPosition, 'InitialPosition');

Chain = SRD_Chain(LinkArray);
SRD_save(Chain, 'Chain');
%Chain.Update(InitialPosition)


SRD_SetupVisuals('AxisLimits', [-1; 1; -1; 1; -1; 1], ...
    'ViewAngle', [-37.5, 30], ...
    'ToDrawMeshes', true, ...
    'Animation_ToUseGrid', true, ...
    'Animation_ToUseGridMinor', true, ...
    'DrawRobot_Default_RobotColor', [0.6 0.3 0.1], ...
    'DrawRobot_Default_EdgeAlpha', 0.3, ...
    'DrawRobot_Default_FaceAlpha', 1, ...
    'DrawRobot_Default_LineWidth', 0.5, ...
    'DrawRobot_STL_FaceColor', [0.95 0.8 0.2], ...
    'DrawRobot_STL_EdgeColor', 'none', ...
    'DrawRobot_STL_FaceLighting', 'gouraud', ...
    'DrawRobot_STL_AmbientStrength', 0.15, ...
    'DrawRobot_STL_camlight', 'headlight', ...
    'DrawRobot_STL_material', 'metal', ... %shiny dull metal
    'ToDrawFrames', false, ...
    'DrawRobot_Frame_Scale', 0.2, ...
    'DrawRobot_Frame_LineWidth', 1);

DrawRobot_function = SRD_DrawRobot_get_function('DrawRobot_Type', 'STL', ... %'Default' or 'STL' or 'Custom'
    'DrawRobot_Custom_handle', [], ...
    'Function_Type', 'DrawGivenPosition', ... %'DrawGivenPosition' or 'DrawInitialPosition'  or 'DrawCurrentPosition'
    'Chain', Chain);

DrawRobot_function(InitialPosition, [])
SRD__make_default_scene('STL')
            