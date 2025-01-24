% Column Buckling Parameters
L = 5;
P = 2000;
E = 71e9;
b = 0.05;
h = 0.1;

x_points = 0:0.05:L;
N = length(x_points);

% Column Properties
I = (b * h^3) / 12;   % Moment of inertia (m^4)
coefficient = P / (E * I);  % Coefficient for differential equation
A = zeros(N-2, N-2);
rhs = zeros(N-2, 1);

for i = 2:N-1
    if i > 2
        A(i-1, i-2) = 1; % Sub-diagonal
    end
    A(i-1, i-1) = -(2 + 0.05^2 * coefficient); % Main diagonal
    if i < N-1
        A(i-1, i) = 1; % Super-diagonal
    end
    rhs(i-1) = -0.05^2 * coefficient * (0.05 * x_points(i) / L);
end
y_vals = A \ rhs; 
y = [0; y_vals; 0]; % Add boundary conditions (y = 0 at both ends)

% Plot the Results
plot(x_points, y);
xlabel('x (m)');
ylabel('y (m)');
title('Buckling Displacement Profile of Column');