delta = 0.001; % Offset to make Weibull fit work

% Neurometric

[c11, c12, c13, c14, c15, c16, c17] = roc_by_cell2(cellArrayOfCells{1, 2}, 1);
[c21, c22, c23, c24, c25, c26, c27] = roc_by_cell2(cellArrayOfCells{2, 2}, 2);
[c31, c32, c33, c34, c35, c36, c37] = roc_by_cell2(cellArrayOfCells{3, 2}, 3);
[c41, c42, c43, c44, c45, c46, c47] = roc_by_cell2(cellArrayOfCells{4, 2}, 4);
[c51, c52, c53, c54, c55, c56, c57] = roc_by_cell2(cellArrayOfCells{5, 2}, 5);

data = [0.00, c11, c21, c31, c41, c51;
        3.20, c12, c22, c32, c42, c52;
        6.40, c13, c23, c33, c43, c53;
        12.8, c14, c24, c34, c44, c54;
        25.6, c15, c25, c35, c45, c55;
        51.2, c16, c26, c36, c46, c56;
        99.9, c17, c27, c37, c47, c57];
    
figure;
scatter(data(:, 1), data(:, 2), 'DisplayName', 'Cell 1');
hold on;
scatter(data(:, 1), data(:, 3), 'DisplayName', 'Cell 2');
hold on;
scatter(data(:, 1), data(:, 4), 'DisplayName', 'Cell 3');
hold on;
scatter(data(:, 1), data(:, 5), 'DisplayName', 'Cell 4');
hold on;
scatter(data(:, 1), data(:, 6), 'DisplayName', 'Cell 5');
legend('Location', 'southeast');

data_fit = [data(:, 1), data(:, 2);
            data(:, 1), data(:, 3);
            data(:, 1), data(:, 4);
            data(:, 1), data(:, 5);
            data(:, 1), data(:, 6)];
data_fit_x = data_fit(:, 1) + delta;
data_fit_y = data_fit(:, 2);
        
 % Behavioral
[d11, d12, d13, d14, d15, d16, d17] = compute_pct_correct(cellArrayOfCells{1, 2});
[d21, d22, d23, d24, d25, d26, d27] = compute_pct_correct(cellArrayOfCells{2, 2});
[d31, d32, d33, d34, d35, d36, d37] = compute_pct_correct(cellArrayOfCells{3, 2});
[d41, d42, d43, d44, d45, d46, d47] = compute_pct_correct(cellArrayOfCells{4, 2});
[d51, d52, d53, d54, d55, d56, d57] = compute_pct_correct(cellArrayOfCells{5, 2});
        
data_pct_correct = [0.00, d11, d21, d31, d41, d51;
        3.20, d12, d22, d32, d42, d52;
        6.40, d13, d23, d33, d43, d53;
        12.8, d14, d24, d34, d44, d54;
        25.6, d15, d25, d35, d45, d55;
        51.2, d16, d26, d36, d46, d56;
        99.9, d17, d27, d37, d47, d57];
    
data_pct_correct_fit = [data_pct_correct(:, 1), data_pct_correct(:, 2);
            data_pct_correct(:, 1), data_pct_correct(:, 3);
            data_pct_correct(:, 1), data_pct_correct(:, 4);
            data_pct_correct(:, 1), data_pct_correct(:, 5);
            data_pct_correct(:, 1), data_pct_correct(:, 6)];

data_fit2_x = data_pct_correct_fit(:, 1) + delta;
data_fit2_y = data_pct_correct_fit(:, 2);    
        
figure;
scatter(data_pct_correct(:, 1), data_pct_correct(:, 2), 'DisplayName', 'Cell 1');
hold on;
scatter(data_pct_correct(:, 1), data_pct_correct(:, 3), 'DisplayName', 'Cell 2');
hold on;
scatter(data_pct_correct(:, 1), data_pct_correct(:, 4), 'DisplayName', 'Cell 3');
hold on;
scatter(data_pct_correct(:, 1), data_pct_correct(:, 5), 'DisplayName', 'Cell 4');
hold on;
scatter(data_pct_correct(:, 1), data_pct_correct(:, 6), 'DisplayName', 'Cell 5');
legend('Location', 'southeast');