function dV = calculate_dV(t, V_t, dt)
    E_L = -0.065; % resting membrane potential in Volts
    R_m = 10^7; % membrane resistance in Ohms
    tau_m = 0.010; % membrane time constant in seconds
    dV = (1 / tau_m) * (E_L - V_t + R_m * calculate_I_e(t)) * dt;
end