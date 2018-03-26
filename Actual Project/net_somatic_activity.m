function [f] = net_somatic_activity(x, y, C_inh, A_w, g_w, g_w_max)
    f_v = -C_inh;
    for i = 1:size(g_w, 1)
        g_w_n = g_w{i};
        f_v = f_v + A_w(i) * g_w_n(g_w_max, x, y, 0, 0);
    end
    f = max(f_v, 0);
end

