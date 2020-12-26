% plot(Handler_State_Logger_vanilla.Log.q-(Handler_Desired_State.q)')

clf;close all;
%myColors = jet(nLines);
nLines=12;
legend_str = cell(nLines,1);

for ii=1:nLines
    plot( Handler_State_Logger_vanilla.Log.q(:,ii)-Handler_Desired_State.q(ii),'linewidth',1.5)
    hold on;
    legend_str{ii} = "q"+'_{'+num2str(ii)+"}";
end


legend_handle.Interpreter = 'latex';
legend(legend_str,'location','NorthWest')
grid on; grid minor;
ax = gca;
ax.GridAlpha = 0.6;
ax.LineWidth = 0.5;
ax.MinorGridLineStyle = '-';
ax.MinorGridAlpha = 0.2;
ax.FontSize = 14;

xlabel_handle = xlabel('$$t$$, ms');
xlabel_handle.Interpreter = 'latex';
ylabel_handle = ylabel('$$q_i$$');
ylabel_handle.Interpreter = 'latex';

figure('Color', 'w', 'Name', 'Positions');
title('Positions')
SRDgraphic_PlotGeneric(Handler_Simulation.TimeLog, Handler_State_Logger_vanilla.Log.q, ...
    'NewFigure', false, 'FigureName', 'Generic', ...
    'LableVariable', 'q', 'Title', []);
drawnow;
