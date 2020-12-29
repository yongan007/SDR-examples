
NumberOfLinks = 4;

generate_robot_with_N_links(NumberOfLinks)

file_name = ['result_links_', num2str(NumberOfLinks), '.mat'];

Count = 20;
res.times = zeros(Count, 1);

for i = 1:Count
    disp(['calculating ', num2str(i), ' out of ', num2str(Count)]);


    time = Derive();
    res.times(i) = time;
end

res.mean = mean(res.times);
res.std  = std(res.times);

save(file_name, 'res')

%%

temp{1} = load('result_links_2.mat')