
k = 1; % placeholder

% r = [x, y]
phi = @(k1, k2, k3, r) ...
    (cos(dot(k1, r)) + cos(dot(k2, r)) + cos(dot(k3, r))) / 3;

k1 = @(k, theta) k / sqrt(2) * ...
    [cos(theta + pi / 12) + sin(theta + pi / 12), ...
    cos(theta + pi / 12) - sin(theta + pi / 12)];

k2 = @(k, theta) k / sqrt(2) * ...
    [cos(theta + 5 * pi / 12) + sin(theta + 5 * pi / 12), ...
    cos(theta + 5 * pi / 12) - sin(theta + 5 * pi / 12)];

k3 = @(k, theta) k / sqrt(2) * ...
    [cos(theta + 9 * pi / 12) + sin(theta + 9 * pi / 12), ...
    cos(theta + 9 * pi / 12) - sin(theta + 9 * pi / 12)];

lambda = @(k) 4 * pi / (sqrt(3) * k);

% w represents 3 parameters w = (lambda, theta, r_0)

phi_w = @(r, r_0) phi(r - r_0);

% Reminder, r, r_0 refers to [x, y] and [x_0, y_0] in the paper
g_w = @(g_w_max, r, r_0) g_w_max * (2/3) * ((1/3) * phi_w(r, r_0) + 1/2);

% Altered subscript w0 signals that only grid cells with a 
% single spatial phase r0 = [0, 0] are considered lambda_lower and
% lambda_upper denote the lower and upper spacing allowed in the sum

A_w0 = @(f_max, g_max_w0, sigma, lambda, lambda_upper, lambda_lower) ...
    (f_max / g_max_w0) * 2 * pi * sigma^2 * ...
    (exp(-(4/3) * pi^2 * sigma^2 / lambda ^2) / lambda ^2) * ...
    (2 * pi / N) * log(lambda_upper / lambda_lower);

% values from the paper
f_max = 20; % Hz
sigma = 12; % cm
lambda_upper = 73; % cm
lambda_max = 2 * pi * sigma / sqrt(3);

xspace = linspace(-5, 5, 10);
yspace = linspace(-5, 5, 10);













