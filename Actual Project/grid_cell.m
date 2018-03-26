
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

% The altered subscript ‘w0’ signals that only 
% grid cells with a single spatial phase (i.e., r0 ¼ [0,0]) 

