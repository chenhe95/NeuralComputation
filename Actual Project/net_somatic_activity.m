function [f] = net_somatic_activity(x, y, C_inh, A_w, g_w)
    f = -C_inh;
    for i = 1:size(g_w, 1)
        g_w_n = g_w(i);
        f = f + A_w(i) * g_w_n(x, y);
    end
    f = max(f, 0);
end

