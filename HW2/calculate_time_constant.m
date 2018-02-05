function [time_const] = calculate_time_constant(alpha, beta)
    time_const = 1 / (alpha + beta);
end