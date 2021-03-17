
clear;
t=linspace(0,2*pi,50) ;
y=@(t) sin(t);

y_eval = y(t);

time=[0 1 2 3 4 5]; % Vector time
y=[1 2 4 8 12 13];
gradient(y(:)) ./ gradient(time(:))
t = repmat(time',1,2)
y_d=[1 2 4 8 12 13;1 2 4 8 12 13]';

dy_by_dt = gradient(y_d(:,:)') ./ gradient(t(:,:)')

% plot(t,dy_by_dt)
% hold on 
% plot(t, y_eval)

