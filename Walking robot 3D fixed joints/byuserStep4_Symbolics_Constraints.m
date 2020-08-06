
SymbolicEngine = SRD.GetSymbolicEngine;
SimulationEngine = SRD.GetSimulationEngine;

index1 = SimulationEngine.RetreaveLinkIndexInLinkArray('Right Shin');
RightShin = SimulationEngine.LinkArray(index1).AbsoluteFollower(:, 2);
index2 = SimulationEngine.RetreaveLinkIndexInLinkArray('Left Shin');
LeftShin = SimulationEngine.LinkArray(index2).AbsoluteFollower(:, 2);

%think about the signs here!
disp(['For checking: PointRearUp belongs to ', SymbolicEngine.LinkArray(index1).Name]);
RightShin = SymbolicEngine.LinkArray(index1).AbsoluteFollower(:, 2) - RightShin;
disp(['For checking: PointRearDown belongs to ', SymbolicEngine.LinkArray(index2).Name]);
LeftShin = SymbolicEngine.LinkArray(index2).AbsoluteFollower(:, 2) - LeftShin;

Constraints = [RightShin; LeftShin];

matlabFunction(Constraints, 'File', 'g_Custom_Constraints', 'Vars', {SymbolicEngine.q});
save('datafile_Constraints', 'Constraints')

SymbolicEngine.BuildLagrangeMultiplierEq_JS(Constraints, true);
SRD.SaveSymbolicEngine(SymbolicEngine);