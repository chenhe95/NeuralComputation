function [ i_m ] = calculate_i(V, n, m, h)
    g_L = 0.003; % mS/mm^2
    E_L = -54.387; % mV
    g_K = 0.36; % mS/mm^2
    E_K = -77; % mV
    g_Na = 1.2; % mS/mm^2
    E_Na = 50; % mV
    
    i_m = g_L * (V - E_L) + g_K * n^4 * (V - E_K) + g_Na * m^3 * h * (V - E_Na);
end

