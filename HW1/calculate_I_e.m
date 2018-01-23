function I = calculate_I_e(t)
    % It seems that if this value is too small, such as 1 * 10^-9
    % then it will just converge to a value higher than V_reset
    % and never do anything
    I = 3 * 10^-9; % exterior current in Amperes
end

