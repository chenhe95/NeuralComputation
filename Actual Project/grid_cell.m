
k = 1; % placeholder
theta = pi / 3; % angle of the gratings

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

% values from the paper
f_max = 45; % Hz, the paper used 20 Hz
sigma = 5; % cm, the paper used 12
lambda_upper = 120; % cm, the paper used 73
lambda_max = 2 * pi * sigma / sqrt(3); % do not change

% made up
g_w_max = 10;
C_inh = 0;

xy_max = 10;
xy_spacing = 20;
xspace = linspace(-xy_max, xy_max, xy_spacing);
yspace = linspace(-xy_max, xy_max, xy_spacing);

A_w = A_w0(f_max, 20, sigma, lambda_max, lambda_upper, 1, 1);

activity = [];

for x = 1:size(xspace, 2)
    for y = 1:size(yspace, 2)
        activity(x, y) = net_somatic_activity(x, y, C_inh, [A_w], {g_w2}, g_w_max);
    end
end

image(activity);












