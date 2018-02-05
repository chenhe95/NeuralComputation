function [ar] = calculate_steady_state_ar(alpha, beta)
    % n_infnty
    ar = alpha / (alpha + beta);
end