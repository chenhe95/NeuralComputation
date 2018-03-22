function [output] = roc_by_cell2(c, plotflag)
    dataset = c.ecodes.data;
    x_logical = dataset(:, 3) == 180 | dataset(:, 3) == 315 | dataset(:, 3) == 200;
    firing_rates = [];
    for i = 1:size(c.spikes, 1)
        if isempty(c.spikes{i}) 
            firing_rates(i) = 0;
        else
            firing_rates(i) = size(c.spikes{i}, 1) / max(c.spikes{i});
        end
    end
    
    x_dist = firing_rates(find(x_logical));
    y_dist = firing_rates(find(~x_logical));
    
    output = rocN(x_dist, y_dist, 100, plotflag);
end

