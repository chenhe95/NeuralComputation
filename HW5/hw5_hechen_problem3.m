[v_1180, v_10, v_1315, v_1135, v_1200, v_120] = compute_dir_spike_rate(cellArrayOfCells{1, 1});
[v_2180, v_20, v_2315, v_2135, v_2200, v_220] = compute_dir_spike_rate(cellArrayOfCells{2, 1});
[v_3180, v_30, v_3315, v_3135, v_3200, v_320] = compute_dir_spike_rate(cellArrayOfCells{3, 1});
[v_4180, v_40, v_4315, v_4135, v_4200, v_420] = compute_dir_spike_rate(cellArrayOfCells{4, 1});
[v_5180, v_50, v_5315, v_5135, v_5200, v_520] = compute_dir_spike_rate(cellArrayOfCells{5, 1});
data = [180, v_1180, v_2180, v_3180, v_4180, v_5180;
        0, v_10, v_20, v_30, v_40, v_50;
        315, v_1315, v_2315, v_3315, v_4315, v_5315;
        135, v_1135, v_2135, v_3135, v_4135, v_5135;
        200, v_1200, v_2200, v_3200, v_4200, v_5200;
        20, v_120, v_220, v_320, v_420, v_520];
data(:, 1) = deg2rad(data(:, 1));
figure;
polarscatter(data(:, 1), data(:, 2))
title("Cell 1")

figure;
polarscatter(data(:, 1), data(:, 3))
title("Cell 2")

figure;
polarscatter(data(:, 1), data(:, 4))
title("Cell 3")

figure;
polarscatter(data(:, 1), data(:, 5))
title("Cell 4")

figure;
polarscatter(data(:, 1), data(:, 6))
title("Cell 5")