close all; clc; clear all;

path{1} = 'anymal';

path{2} = 'aliengo'; %% 4 legs
path{3} = 'cheetah';
% path{3} = 'anymal';
path{4} = 'laikago';
path{5} = 'hexapod';    %%6 legs

controllers = {'CTC', 'CLQR','Nested_QP'};
% controllers = {'Nested_QP'};

metric = zeros(length(path),length(controllers));
omega = 25;

parameters.Kp = omega^2;
parameters.Kd = 2*omega;


for i = 1:length(path)
    for j =1: length(controllers)
        current_dir = pwd;
        cd(path{i});
        [cost]=SetupStep5_Simulation(parameters, controllers(j));
        metric(i,j) = cost
        cd(current_dir);
    end
end
