function X_next = state_transition(X_current)
    dt = 0.5;
    omega_mean = 1; % Average angular velocity
    Q = 0.1; % Process noise covariance
    
    % Get current state
    r = X_current(1);
    theta = X_current(2);
    
    % Simulate next state
    omega = normrnd(omega_mean, sqrt(Q));
    theta_next = wrapTo2Pi(theta + omega*dt); % Update theta
    
    % Ensure they are both scalars before concatenating
    if all(size(r) == [1 1]) && all(size(theta_next) == [1 1])
        X_next = [r; theta_next];
    else
        error('Dimension mismatch in state_transition function.'); %Debug function
    end
end
