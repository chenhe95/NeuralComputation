function [ img ] = grid_cell_func( angle_variance_1, angle_variance_2, k, theta, ...
    f_max, sigma, lambda_upper, lambda_max, ...
    g_w_max, C_inh, xy_max, xy_spacing)

    % r = [x, y]
    phi = @(k1, k2, k3, r) ...
        (cos(dot(k1, r) + normrnd(0, angle_variance_1)) + ...
        cos(dot(k2, r) + normrnd(0, angle_variance_1)) + cos(dot(k3, r) + ...
        normrnd(0, angle_variance_1))) / 3;

    k1 = @(k, theta) k / sqrt(2) * ...
        [cos(theta + pi / 12 + normrnd(0, angle_variance_2)) + sin(theta + pi / 12 + normrnd(0 ,angle_variance_2)), ...
        cos(theta + pi / 12 + normrnd(0, angle_variance_2)) - sin(theta + pi / 12 + normrnd(0, angle_variance_2))];

    k2 = @(k, theta) k / sqrt(2) * ...
        [cos(theta + 5 * pi / 12 + normrnd(0, angle_variance_2)) + sin(theta + 5 * pi / 12 + normrnd(0, angle_variance_2)), ...
        cos(theta + 5 * pi / 12 + normrnd(0, angle_variance_2)) - sin(theta + 5 * pi / 12 + normrnd(0, angle_variance_2))];

    k3 = @(k, theta) k / sqrt(2) * ...
        [cos(theta + 9 * pi / 12 + normrnd(0, angle_variance_2)) + sin(theta + 9 * pi / 12 + normrnd(0, angle_variance_2)), ...
        cos(theta + 9 * pi / 12 + normrnd(0, angle_variance_2)) - sin(theta + 9 * pi / 12 + normrnd(0, angle_variance_2))];

    lambda = @(k) 4 * pi / (sqrt(3) * k);

    % w represents 3 parameters w = (lambda, theta, r_0)

    phi_w = @(r, r_0) phi(k1(k, theta), k2(k, theta), k3(k, theta), r - r_0);

    % Reminder, r, r_0 refers to [x, y] and [x_0, y_0] in the paper
    g_w = @(g_w_max, r, r_0) g_w_max * (2/3) * ((1/3) * phi_w(r, r_0) + 1/2);
    g_w2 = @(g_w_max, x, y, x0, y0) g_w_max * (2/3) * ((1/3) * phi_w([x, y], [x0, y0]) + 1/2);

    % Altered subscript w0 signals that only grid cells with a 
    % single spatial phase r0 = [0, 0] are considered lambda_lower and
    % lambda_upper denote the lower and upper spacing allowed in the sum

    A_w0 = @(f_max, g_max_w0, sigma, lambda, lambda_upper, lambda_lower, N) ...
        (f_max / g_max_w0) * 2 * pi * sigma^2 * ...
        (exp(-(4/3) * pi^2 * sigma^2 / lambda ^2) / lambda ^2) * ...
        (2 * pi / N) * log(lambda_upper / lambda_lower);

    xspace = linspace(-xy_max, xy_max, xy_spacing);
    yspace = linspace(-xy_max, xy_max, xy_spacing);

    A_w = A_w0(f_max, 20, sigma, lambda_max, lambda_upper, 1, 1);

    activity = [];

    for x = 1:size(xspace, 2)
        for y = 1:size(yspace, 2)
            activity(x, y) = net_somatic_activity(x, y, C_inh, [A_w], {g_w2}, g_w_max);
        end
    end
    figure;
    img = image(activity);

end

