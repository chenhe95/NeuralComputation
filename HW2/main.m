V_th = -0.050; % threshold potential in volts
V_reset = -0.065; % reset potential after action potential in volts
t_0 = 0.0; % start time in seconds
t_final = 0.05; % final time in seconds
dt = 0.0001; % time difference in seconds
V_init = V_reset; % initial voltage potential in volts
V_t = V_init; % the current voltage in volts

n_init = calculate_steady_state_ar(calculate_alpha_n(V_init), calculate_beta_n(V_init));
m_init = calculate_steady_state_ar(calculate_alpha_m(V_init), calculate_beta_m(V_init));
h_init = calculate_steady_state_ar(calculate_alpha_h(V_init), calculate_beta_h(V_init));

i_init = calculate_i(V_init, n_init, m_init, h_init);


