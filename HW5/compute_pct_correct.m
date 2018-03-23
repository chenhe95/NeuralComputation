function [v_1, v_2, v_3, v_4, v_5, v_6, v_7] = compute_pct_correct(c)

    n = size(c.ecodes.data, 1);
    eps = 0.0000001;
    data = [0, 0, 0;
            3.2, 0, 0;
            6.4, 0, 0;
            12.8, 0, 0;
            25.6, 0, 0;
            51.2, 0, 0;
            99.9, 0, 0];
    dataset = c.ecodes.data;
    correspondences = dataset(:, 4);
    for i = 1:n
        if abs(correspondences(i) - 0) < eps
            data(1, 2) = data(1, 2) + dataset(i, 6);
            data(1, 3) = data(1, 3) + 1;
        elseif abs(correspondences(i) - 3.2) < eps
            data(2, 2) = data(2, 2) + dataset(i, 6);
            data(2, 3) = data(2, 3) + 1;
        elseif abs(correspondences(i) - 6.4) < eps
            data(3, 2) = data(3, 2) + dataset(i, 6);
            data(3, 3) = data(3, 3) + 1;
        elseif abs(correspondences(i) - 12.8) < eps
            data(4, 2) = data(4, 2) + dataset(i, 6);
            data(4, 3) = data(4, 3) + 1;
        elseif abs(correspondences(i) - 25.6) < eps
            data(5, 2) = data(5, 2) + dataset(i, 6);
            data(5, 3) = data(5, 3) + 1;
        elseif abs(correspondences(i) - 51.2) < eps
            data(6, 2) = data(6, 2) + dataset(i, 6);
            data(6, 3) = data(6, 3) + 1;
        elseif abs(correspondences(i) - 99.9) < eps
            data(7, 2) = data(7, 2) + dataset(i, 6);
            data(7, 3) = data(7, 3) + 1;
        end
    end
    data(:, 2) = data(:, 2) ./ data(:, 3);
    v_1 = data(1, 2);
    v_2 = data(2, 2);
    v_3 = data(3, 2);
    v_4 = data(4, 2);
    v_5 = data(5, 2);
    v_6 = data(6, 2);
    v_7 = data(7, 2);
end

