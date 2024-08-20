function z = measurement_function(X_current, R)
    %Get current state
    r = X_current(1);
    theta = X_current(2);

    r = 0.2;
    R = r^2; 

    % Calculate x-coordinte with noise
    x = r * cos(theta);
    z = x + normrnd(0, sqrt(R));
end