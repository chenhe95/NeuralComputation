function [dx] = calculate_dx(alpha, beta, x, dt)
    dx = (alpha * (1 - x) - beta * n) * dt;
end