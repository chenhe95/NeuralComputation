function [v_180, v_0, v_315, v_135, v_200, v_20] = compute_dir_spike_rate(c)
    dataset = c.ecodes.data;
    directions = dataset(:, 3);
    total_spike_count = [];
    total_view_time = [];
    total_spike_count(316) = 0;
    total_view_time(316) = 0;
    for i = 1:size(c.spikes, 1)
        view_time = dataset(i, 2) - dataset(i, 1);
        total_view_time(directions(i) + 1) = total_view_time(directions(i) + 1) + view_time;
        if isempty(c.spikes{i}) 
            % do nothing
        else
            total_spike_count(directions(i) + 1) = total_spike_count(directions(i) + 1) + size(c.spikes{i}, 1);
        end
    end
    
    v_180 = total_spike_count(181) / total_view_time(181);
    v_0 = total_spike_count(1) / total_view_time(1);
    v_315 = total_spike_count(316) / total_view_time(316);
    v_135 = total_spike_count(136) / total_view_time(136);
    v_200 = total_spike_count(201) / total_view_time(201);
    v_20 = total_spike_count(21) / total_view_time(21);
end

