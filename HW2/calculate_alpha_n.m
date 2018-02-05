function [alpha_n] = calculate_alpha_n(V)
    alpha_n = 0.01 * (V + 55) / (1 - exp(-0.1 * (V + 55)));
end

