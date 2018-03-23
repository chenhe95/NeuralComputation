function [output] = compute_dir_spike_rate(c)
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
    
    v_0 = total_spike_count(1) / total_view_time(1);
    v_45 = total_spike_count(46) / total_view_time(46);
    v_90 = total_spike_count(91) / total_view_time(91);
    v_135 = total_spike_count(136) / total_view_time(136);
    v_180 = total_spike_count(181) / total_view_time(181);
    v_225 = total_spike_count(226) / total_view_time(226);
    v_270 = total_spike_count(271) / total_view_time(271);
    v_315 = total_spike_count(316) / total_view_time(316);
    
    output = [v_0, v_45, v_90, v_135, v_180, v_225, v_270, v_315];
end

