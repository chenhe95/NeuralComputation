function [alpha_h] = calculate_alpha_h(V)
    alpha_h = 0.07 * exp(-0.05 * (V + 65));
end