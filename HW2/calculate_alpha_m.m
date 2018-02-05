function [alpha_m] = calculate_alpha_m(V)
    alpha_m = 0.1 * (V + 40) / (1 - exp(-0.1 * (V + 40)));
end