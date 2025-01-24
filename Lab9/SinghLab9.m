%{
rho = 1.7;
g = 32.2;    % Acceleration due to gravity in ft/s^2
t = 0:0.1:5;
v = (-g / rho) * exp(-rho * t) + g / rho;

plot(t, v, 'LineWidth', 2);
grid on; 
xlabel('Time (seconds)');
ylabel('Velocity (ft/s)');
title('Velocity vs Time for a Falling Object - Kushaal');
%}
%{
rho = 1.7;
g = 32.2;    % Acceleration due to gravity in ft/s^2
t_exact = 0:0.1:5;
v_exact = (-g / rho) * exp(-rho * t_exact) + g / rho;

% Euler's method parameters
h1 = 0.5;  % Step size h = 0.5
h2 = 0.2;  % Step size h = 0.2
t1 = 0:h1:5; % Time vector for h = 0.5
t2 = 0:h2:5; % Time vector for h = 0.2
v0 = 0;

% Euler's Method for h = 0.5
v1 = zeros(size(t1));
v1(1) = v0;
for i = 1:length(t1)-1
    v1(i+1) = v1(i) + (-rho * v1(i) + g) * h1;
end

% Euler's Method for h = 0.2
v2 = zeros(size(t2));
v2(1) = v0;
for i = 1:length(t2)-1
    v2(i+1) = v2(i) + (-rho * v2(i) + g) * h2;
end

plot(t_exact, v_exact, 'DisplayName', 'Exact Solution'); % Exact solution
hold on;
plot(t1, v1, 'o-', 'DisplayName', 'Euler h = 0.5'); % Euler method h = 0.5
plot(t2, v2, 'o-', 'DisplayName', 'Euler h = 0.2'); % Euler method h = 0.2
xlabel('Time (seconds)');
ylabel('Velocity (ft/s)');
title('Velocity vs Time for a Falling Object - Kushaal');
legend;  % Display legend
grid on;
%}
%{
rho = 1.1;
g = 32.2;    % Acceleration due to gravity in ft/s^2
t_exact = 0:0.1:5;
v_exact = (-g / rho) * exp(-rho * t_exact) + g / rho;

h_vals = 0.1:0.1:0.6;
v0 = 0;

plot(t_exact, v_exact, 'DisplayName', 'Exact Solution'); % Exact solution
hold on;
for i = 1:length(h_vals)
    t_vals = 0:h_vals(i):5;
    v = zeros(size(t_vals));
    for j = 1:length(t_vals)-1
        v(j+1) = v(j) + (-rho * v(j) + g) * h_vals(i);
    end
    plot(t_vals, v, 'o-');
end    

xlabel('Time (seconds)');
ylabel('Velocity (ft/s)');
title('Velocity vs Time for a Falling Object - Kushaal');
legend;  % Display legend
grid on;
%}
%{
rho = 1.7;
g = 32.2;
t_exact = 0:0.1:5;
v_exact = (-g / rho) * exp(-rho * t_exact) + g / rho;

% Euler's method parameters
h1 = 0.5;  % Step size h = 0.5
h2 = 0.2;  % Step size h = 0.2
t1 = 0:h1:5; % Time vector for h = 0.5
t2 = 0:h2:5; % Time vector for h = 0.2
v0 = 0;

% Euler's Method for h = 0.5
v1 = zeros(size(t1));
v1(1) = v0;
for i = 1:length(t1)-1
    v1(i+1) = v1(i) + (-rho * v1(i) + g) * h1;
end
% Heun's Method for h = 0.5
v2 = zeros(size(t1));
v2(1) = v0;
for i = 1:length(t1)-1
    f1 = -rho * v2(i) + g; 
    vP = v2(i) + f1 * h1;
    f2 = -rho * vP + g;
    v2(i+1) = v2(i) + (f1 + f2) * h1 / 2;
end

% Euler's Method for h = 0.2
v3 = zeros(size(t2));
v3(1) = v0;
for i = 1:length(t2)-1
    v3(i+1) = v3(i) + (-rho * v3(i) + g) * h2;
end
% Heun's Method for h = 0.2
v4 = zeros(size(t2));
v4(1) = v0;
for i = 1:length(t2)-1
    f1 = -rho * v4(i) + g;
    vP = v4(i) + f1 * h2;
    f2 = -rho * vP + g;
    v4(i+1) = v4(i) + (f1 + f2) * h2 / 2;
end

plot(t_exact, v_exact, 'DisplayName', 'Exact Solution');
hold on;
plot(t1, v1, 'o-', 'DisplayName', 'Euler h = 0.5');
plot(t1, v2, 'o-', 'DisplayName', 'Heun h = 0.5');
plot(t2, v3, 'o-', 'DisplayName', 'Euler h = 0.2');
plot(t2, v4, 'o-', 'DisplayName', 'Heun h = 0.2');
xlabel('Time (seconds)');
ylabel('Velocity (ft/s)');
title('Velocity vs Time for a Falling Object - Kushaal');
legend;
grid on;

disp(sqrt(mean((v1 - interp1(t_exact, v_exact, t1)).^2)));
disp(sqrt(mean((v2 - interp1(t_exact, v_exact, t1)).^2)));
disp(sqrt(mean((v3 - interp1(t_exact, v_exact, t2)).^2)));
disp(sqrt(mean((v4 - interp1(t_exact, v_exact, t2)).^2)));
%}
%{
rho = [1.1, 1.5];
g = 32.2;
t_exact = 0:0.1:5;
stepSizes = [0.5, 0.1, 0.05];
z = 1;
for i=1:length(rho)
    v_exact = (-g / rho(i)) * exp(-rho(i) * t_exact) + g / rho(i);
    for j = 1:length(stepSizes)
        h = stepSizes(j);
        t = 0:h:5;
        v0 = 0;
        v1 = zeros(size(t1));
        v1(1) = v0;
        for k = 1:length(t)-1
            v1(k+1) = v1(k) + (-rho(i) * v1(k) + g) * h;
        end
        v2 = zeros(size(t1));
        v2(1) = v0;
        for k = 1:length(t)-1
            f1 = -rho(i) * v2(k) + g; 
            vP = v2(k) + f1 * h1;
            f2 = -rho(i) * vP + g;
            v2(k+1) = v2(k) + (f1 + f2) * h / 2;
        end
    
        figure(z)
        plot(t_exact, v_exact, 'DisplayName', 'Exact Solution');
        hold on;
        plot(t, v1, 'o-', 'DisplayName', 'Euler');
        plot(t, v2, 'o-', 'DisplayName', 'Heun');
        xlabel('Time (seconds)');
        ylabel('Velocity (ft/s)');
        title('Velocity vs Time for a Falling Object - Kushaal');
        legend;
        grid on;
        z = z+1;
    end
end
%}
%{

y0 = 0.5;
v0 = 0.2;
t = 0:0.1:10;
y = zeros(size(t));
v = zeros(size(t));

y(1) = y0;
v(1) = v0;
f1 = @(y, v) v;             % dy/dt = v
f2 = @(y, v) -3*y - 0.5*v;  % dv/dt = -3y - 0.5v

for i = 1:length(t)-1
    y_predictor = y(i) + h * f1(y(i), v(i));
    v_predictor = v(i) + h * f2(y(i), v(i));
    y(i+1) = y(i) + h/2 * (f1(y(i), v(i)) + f1(y_predictor, v_predictor));
    v(i+1) = v(i) + h/2 * (f2(y(i), v(i)) + f2(y_predictor, v_predictor));
end

figure;
plot(t, y, 'b-', 'DisplayName', 'y(t)'); % Plot y(t)
hold on;
plot(t, v, 'r-', 'DisplayName', 'dy/dt(t)'); % Plot dy/dt(t)
xlabel('Time (seconds)');
ylabel('Value');
title('Solution of Second-Order ODE');
legend;
grid on;
%}

function derivative = dydt(t,y,R,C)
    v_t = 24.9 * exp(-t / 0.07) * sin(2 * pi * t / 0.035);
    derivative = (v_t-y)/(R*C); 
end
Resistance = 0.1;
Capacitance = 1;
tinitial = input('Enter initial time ');
tfinal = input('Enter the final time ');
h = input('Enter step size');
vinitial = input('Enter the initial voltage ');

t = tinitial:h:tfinal;
N = length(t);
voltage = zeros(1,N);
voltage(1) = vinitial;

for i = 1:N-1
    k1 = h*dydt(t(i), voltage(i),Resistance,Capacitance);
    k2 = h*dydt(t(i)+h/2, voltage(i)+k1/2,Resistance,Capacitance);
    k3 = h*dydt(t(i)+h/2, voltage(i)+k2/2,Resistance,Capacitance);
    k4 = h*dydt(t(i)+h, voltage(i)+k3,Resistance,Capacitance);
    voltage(i+1) = voltage(i)+(k1+2*k2+2*k3+k4)/6;
end

plot(t,voltage,'-o');
xlabel('Time (t)');
ylabel('Voltage (V)');
title('Voltage over time');
legend;
