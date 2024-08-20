% Define the number of state variables and noise characteristics
n = 2;      % number of state variables: r, theta
q = 0.1;    % std of process noise (for omega)
r = 0.2;    % std of measurement noise
Q = q^2 * eye(n); % covariance of process noise
R = r^2;    % covariance of measurement noise  

% State transition function (already includes process noise)
f = @state_transition;
% Measurement function
h = @measurement_function;

% Initial state
s = [2; 0]; % assuming initial radius r=2 and theta=0
x = s + q*randn(2,1); % initial state with noise
P = eye(n); % initial state covariance
N = 100;    % total dynamic steps

% Allocate memory for estimation
xV = zeros(n,N); % estimated states
sV = zeros(n,N); % actual states
zV = zeros(1,N); % measurements

for k = 1:N
    z = measurement_function(s, R); % get measurements
    sV(:,k) = s; % Actual State
    xV(:,k) = x; % Estimate State
    zV(k) = z; % save measurement
    
    [x, P] = UKF(f, x, P, h, z, Q, R); % UKF estimation
    xV(:,k) = x; % save estimate
    
    % Update the actual state
    s = state_transition(s); % Here we use your state transition function
end

% Plot results
figure;
theta_act = wrapTo2Pi(sV(2,:)); 
r_act = sV(1,:);
x_act = r_act .* cos(theta_act);
y_act = r_act .* sin(theta_act);

plot(x_act, y_act, '-'); 
title('Robot Path Use UKF');
xlabel('X');
ylabel('Y');
legend('Path'); 