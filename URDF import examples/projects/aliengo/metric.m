n_joints=12;
% [desired , output]= SetupStep5_Simulation(parameters)
answer = zeros(12,1);
for ii=1:n_joints
    answer(ii,1)=norm(output.Log.q(1:end-1,ii)-desired.q(ii));
end
mse = sum(answer)