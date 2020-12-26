close all; clc; clear all;

path{1} = 'aliengo'; %% 4 legs
path{2} = 'cheetah';
path{3} = 'laikago';
path{4} = 'anymal';
path{5} = 'hyq_biped'; %% 2legs
path{6} = 'hexapod';    %%6 legs

omega = 25;

parameters.Kp = omega^2;
parameters.Kd = 2* omega;



for i = 1:length(path)
    current_dir = pwd;
    cd(path{i});
    
    SetupStep5_Simulation(parameters);
    
    cd(current_dir);
end