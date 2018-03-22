function [output] = roc_by_cell(c, plotflag)
    dataset = c.ecodes.data;
    x = dataset(:, 3) == 180 | dataset(:, 3) == 315 | dataset(:, 3) == 200;
    y = x == dataset(:, 6);
    x(1:5)
    y(1:5)
    acc = mean(dataset(:, 6));
    acc
    ac2 = mean(y == x)
    ac2
    output = rocN(x, y, size(x, 1), plotflag);
end

