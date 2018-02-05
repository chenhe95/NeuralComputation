function [beta_n] = calculate_beta_n(V)
    beta_n = 0.125 * exp(-0.0125 * (V + 65));
end