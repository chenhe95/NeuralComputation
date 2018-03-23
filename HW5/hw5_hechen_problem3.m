output_1 = compute_dir_spike_rate(cellArrayOfCells{1, 1});
output_2 = compute_dir_spike_rate(cellArrayOfCells{2, 1});
output_3 = compute_dir_spike_rate(cellArrayOfCells{3, 1});
output_4 = compute_dir_spike_rate(cellArrayOfCells{4, 1});
output_5 = compute_dir_spike_rate(cellArrayOfCells{5, 1});

outputs = [output_1; output_2; output_3; output_4; output_5];

angles = deg2rad([0, 45, 90, 135, 180, 225, 270, 315]);
figure;
polarscatter(angles, output_1)
title("Cell 1 (Units in Angles and 1/ms)")

figure;
polarscatter(angles, output_2)
title("Cell 2 (Units in Angles and 1/ms)")

figure;
polarscatter(angles, output_3)
title("Cell 3 (Units in Angles and 1/ms)")

figure;
polarscatter(angles, output_4)
title("Cell 4 (Units in Angles and 1/ms)")

figure;
polarscatter(angles, output_5)
title("Cell 5 (Units in Angles and 1/ms)")
