function [beta_h] = calculate_beta_h(V)
    beta_h = 1 / (1 + exp(-0.1 * (V + 35)));
end