function [v_00, v_32, v_64, v_128, v_256, v_512, v_999] = roc_by_cell2(c, cellid)
    
    eps = 0.0000001;

    dataset = c.ecodes.data;
    correspondences = dataset(:, 4);
    x_logical = dataset(:, 3) == 180 | dataset(:, 3) == 315 | dataset(:, 3) == 200;
    firing_rates = [];
    for i = 1:size(c.spikes, 1)
        if isempty(c.spikes{i}) 
            firing_rates(i, :) = [correspondences(i), 0];
        else
            firing_rates(i, :) = [correspondences(i), size(c.spikes{i}, 1) / (dataset(i, 2) - dataset(i, 1))];
        end
    end
    
    coh_00_x = firing_rates(find(abs(firing_rates(:, 1) - 0.0) < eps & x_logical), 2);
    coh_00_y = firing_rates(find(abs(firing_rates(:, 1) - 0.0) < eps & ~x_logical), 2);
    coh_32_x = firing_rates(find(abs(firing_rates(:, 1) - 3.2) < eps & x_logical), 2);
    coh_32_y = firing_rates(find(abs(firing_rates(:, 1) - 3.2) < eps & ~x_logical), 2);
    coh_64_x = firing_rates(find(abs(firing_rates(:, 1) - 6.4) < eps & x_logical), 2);
    coh_64_y = firing_rates(find(abs(firing_rates(:, 1) - 6.4) < eps & ~x_logical), 2);
    coh_128_x = firing_rates(find(abs(firing_rates(:, 1) - 12.8) < eps & x_logical), 2);
    coh_128_y = firing_rates(find(abs(firing_rates(:, 1) - 12.8) < eps & ~x_logical), 2);
    coh_256_x = firing_rates(find(abs(firing_rates(:, 1) - 25.6) < eps & x_logical), 2);
    coh_256_y = firing_rates(find(abs(firing_rates(:, 1) - 25.6) < eps & ~x_logical), 2);
    coh_512_x = firing_rates(find(abs(firing_rates(:, 1) - 51.2) < eps & x_logical), 2);
    coh_512_y = firing_rates(find(abs(firing_rates(:, 1) - 51.2) < eps & ~x_logical), 2);
    coh_999_x = firing_rates(find(abs(firing_rates(:, 1) - 99.9) < eps & x_logical), 2);
    coh_999_y = firing_rates(find(abs(firing_rates(:, 1) - 99.9) < eps & ~x_logical), 2);
    
    figure;
    v_00 = rocN(coh_00_x, coh_00_y, max(size(coh_00_x, 1), size(coh_00_y, 1)), true, true, 0.0);
    v_32 = rocN(coh_32_x, coh_32_y, max(size(coh_32_x, 1), size(coh_32_y, 1)), true, true, 3.2);
    v_64 = rocN(coh_64_x, coh_64_y, max(size(coh_64_x, 1), size(coh_64_y, 1)), true, true, 6.4);
    v_128 = rocN(coh_128_x, coh_128_y, max(size(coh_128_x, 1), size(coh_128_y, 1)), true, true, 12.8);
    v_256 = rocN(coh_256_x, coh_256_y, max(size(coh_256_x, 1), size(coh_256_y, 1)), true, true, 25.6);
    v_512 = rocN(coh_512_x, coh_512_y, max(size(coh_512_x, 1), size(coh_512_y, 1)), true, true, 51.2);
    v_999 = rocN(coh_999_x, coh_999_y, max(size(coh_999_x, 1), size(coh_999_y, 1)), true, true, 99.9);
    title(sprintf("ROC By Correspondence Cell %d", cellid)), axis('square'), xlabel('FA'), ylabel('Hit'), legend('Location', 'southeast');
end

