function [beta_m] = calculate_beta_m(V)
    beta_m = 4 * exp(-0.0556 * (V + 65));
end