addpath('.');
V_th = -0.050; % threshold potential in volts
V_reset = -0.065; % reset potential after action potential in volts
t_0 = 0.0; % start time in seconds
t_final = 0.05; % final time in seconds
dt = 0.0001; % time difference in seconds
V_init = V_reset; % initial voltage potential in volts
V_t = V_init; % the current voltage in volts

iterations = t_0:dt:t_final; 
V_t_chart = zeros(size(iterations)); 
ind = 1;

for (t = iterations)
    V_t_chart(ind) = V_t;
    ind = ind + 1;
    dV = calculate_dV(t, V_t, dt);
    V_t = V_t + dV;
    if (V_t > V_th)
        % action potential
        V_t = V_reset;
    end
end

plot(iterations, V_t_chart);