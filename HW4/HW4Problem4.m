k = 1;
sigma_x = 2;
sigma_y = 2;
phi = 0;
A = 1;
alpha = 1 / 15; % 1/ms 

D_s = @(x, y) (1/(2 * pi * sigma_x * sigma_y)) * exp(-x.^2/(2 * sigma_x^2) - ... 
    y.^2/(2 * sigma_y^2)) .* cos(k * x - phi);

D_t = @(tau) alpha * exp(-alpha * tau) .* ...
    ((alpha * tau).^5 / factorial(5) - (alpha * tau).^7 / factorial(7));

x_space = linspace(-5, 5, 10000);
y_space = linspace(-5, 5, 10000);

[x, y] = meshgrid(x_space, y_space);

D_s_xy = D_s(x, y);

imagesc(D_s_xy);

time_tau = linspace(0, 300, 1000);
D_t_time = D_t(time_tau);

figure;
plot(time_tau, D_t_time);

time_2_13 = [30 75 120 165 210 255];

for t = time_2_13
    D_s_xy_t = D_t(t) * D_s_xy;
    figure;
    imagesc(D_s_xy_t);
end

x_space = linspace(0, 10, 100);
y_space = linspace(0, 10, 100);
K_space = linspace(1, 3, 3);
Theta_space = linspace(pi / 2, 2 * pi, 3);

[x, y, t] = meshgrid(x_space, y_space, [0]);
s = @(x, y, t, Theta, K) A * cos(K * x * cos(Theta) + K * y * sin(Theta) - phi) * ...
    cos(K / (2 * pi) * t);

for Theta_i = Theta_space
    for K_i = K_space
        s_x_y_t_Theta_K = s(x, y, 0, Theta_i, K_i);
        figure;
        imagesc(s_x_y_t_Theta_K);
    end
end

% Orientation Response (fig A)
K = k;
phi = 0;

big_number = Inf;

Theta_space = linspace(-2, 2, 100);

L_s_Theta = [];

for i_Theta = 1:size(Theta_space, 2)
    Theta = Theta_space(i_Theta);
    L_s_integrand = @(x, y) ((1/(2 * pi * sigma_x * sigma_y)) * exp(-x.^2/(2 * sigma_x^2) - y.^2/(2 * sigma_y^2)) .* cos(k * x - phi)) ... 
        * A .* cos(K * x * cos(Theta) + K * y * sin(Theta) - phi);
    L_s = integral2(L_s_integrand, -big_number, big_number, -big_number, big_number, 'Method', 'iterated');
    L_s_Theta(i_Theta) = L_s;
end

phi = 0;
Theta = 0;

K_space = linspace(0, 3, 100);
L_s_K = [];

for i_K = 1:size(K_space, 2)
    K = K_space(i_K);
    L_s_integrand = @(x, y) ((1/(2 * pi * sigma_x * sigma_y)) * exp(-x.^2/(2 * sigma_x^2) - y.^2/(2 * sigma_y^2)) .* cos(k * x - phi)) ... 
        * A .* cos(K * x * cos(Theta) + K * y * sin(Theta) - phi);
    L_s = integral2(L_s_integrand, -big_number, big_number, -big_number, big_number, 'Method', 'iterated');
    L_s_K(i_K) = L_s;
end

K = k;
Theta = 0;

phi_space = linspace(-3, 3, 100);
L_s_phi = [];

for i_phi = 1:size(phi_space, 2)
    phi = phi_space(i_phi);
    L_s_integrand = @(x, y) ((1/(2 * pi * sigma_x * sigma_y)) * exp(-x.^2/(2 * sigma_x^2) - y.^2/(2 * sigma_y^2)) .* cos(k * x - phi)) ... 
        * A .* cos(K * x * cos(Theta) + K * y * sin(Theta) - phi);
    L_s = integral2(L_s_integrand, -big_number, big_number, -big_number, big_number, 'Method', 'iterated');
    L_s_phi(i_phi) = L_s;
end

figure;
plot(Theta_space, L_s_Theta);

figure;
plot(K_space, L_s_K);

figure;
plot(phi_space, L_s_phi);

omegas = 0.02 * linspace(0, 2 * pi, 1000);
freqs = omegas / (2 * pi);
ts = linspace(0, 3 * pi, 2000);

amps = [];

for i_freq = 1:size(freqs, 2)
    omega = omegas(i_freq);
    
    L_t_t = [];
    
    for i_t = 1:size(ts, 2)
        t = ts(i_t);
        L_t_integrand = ...
            @(tau) ...
                (alpha * exp(-alpha * tau) .* ((alpha * tau).^5 / factorial(5) - (alpha * tau).^7 / factorial(7))) .* ...
                cos(omega * (t - tau));
        L_t = integral(L_t_integrand, 0, Inf);
        L_t_t(i_t) = L_t;
    end
    
    amp_i_freq = max(max(L_t_t), -min(L_t_t));
    amps(i_freq) = amp_i_freq;
end

figure;
plot(freqs, amps);















