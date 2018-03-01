% sampling rate is 10 kHz so the first 10,000 elements of Vm represents the
% first second

% 2a)
plot(1:10000, Vm(1:10000))
time_spike_threshold = 15;
last_spike_t = -time_spike_threshold + 1;

spike_times = [];
st_i = 1;

first_stimuli_time = 5739;

for t = first_stimuli_time:size(Vm, 2)
    if Vm(t) > 0
        if t - last_spike_t > time_spike_threshold
            last_spike_t = t;
            spike_times(st_i) = t;
            st_i = st_i + 1;
        end
    end
end

total_time_stimuli = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
total_ap_stimuli = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];


for i = 1:size(Stimuli, 1)
   row_i = Stimuli(i, :);
   st = row_i(1);
   time_st = row_i(2);
   end_time_st = size(Vm, 2) + 1;
   if i ~= size(Stimuli, 1)
       end_time_st = Stimuli(i + 1, 2);
   end
   total_time_stimuli(st + 1) = total_time_stimuli(st + 1) + (end_time_st - time_st);
   for j = 1:size(spike_times, 2)
       if time_st <= spike_times(j) && end_time_st > spike_times(j)
           total_ap_stimuli(st + 1) = total_ap_stimuli(st + 1) + 1;
       end
   end
end

average_firing_rate_stimuli = rdivide(total_ap_stimuli, total_time_stimuli);
figure;
plot(0:15, average_firing_rate_stimuli(1:16))
