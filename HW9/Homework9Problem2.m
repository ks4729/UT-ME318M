    %{
    Resistance = 1;
    inductance = 0.012;
    Kt = 0.050;
    Ke = 0.061;
    dampingCoefficient = 0.005;
    I = 10.2e-5;
    dt = 0.005;
    t = 0:dt:2;
    TT = length(t);
    voltage = zeros(1, TT);
    omega = zeros(1, TT);
    current = zeros(1, TT);
    omega(1) = 0;         % Initial angular velocity (rad/s)
    current(1) = 0;      % Initial current (A)
    
    for n = 1:TT
        temp = t(n);
        if temp < 0.1
            voltage(n) = 20 * temp;            % Linearly rising voltage
        elseif temp < 0.4
            voltage(n) = 2;                 % Constant voltage
        elseif temp < 0.5
            voltage(n) = -20 * (temp - 0.4) + 2; % Linearly falling voltage
        else
            voltage(n) = 0;                 % Voltage is zero
        end
    end
    
    for n = 1:TT-1
        dwdt = (Kt * current(n) - dampingCoefficient * omega(n)) / I;
        omega(n+1) = omega(n) + dt * dwdt;
        didt = (-Resistance * current(n) - Ke * omega(n) + voltage(n)) / inductance;
        current(n+1) = current(n) + dt * didt;
    end
    
    figure;
    subplot(2, 1, 1);
    plot(t, omega, 'b', 'LineWidth', 1.5);
    xlabel('Time (s)');
    ylabel('Angular Velocity (rad/s)');
    title('DC Motor Angular Velocity vs Time');
    grid on;
    subplot(2, 1, 2);
    plot(t, current, 'r', 'LineWidth', 1.5);
    xlabel('Time (s)');
    ylabel('Current (A)');
    title('DC Motor Current vs Time');
    grid on;
    %}
    
    %{
    
    
    Resistance = 1;
    inductance = 0.012;
    Kt = 0.050;
    Ke = 0.061;
    c = 0.005;
    I = 10.2e-5;
    dt = 0.005;       % Time step (s)
    timeDef = 0:dt:2; % Time vector
    TT = length(timeDef);
    v = zeros(1, TT); % Voltage
    w = zeros(1, TT); % Angular velocity
    current = zeros(1, TT); % Current
    w(1) = 0;
    curr(1) = 0;
    for n = 1:TT
        t = timeDef(n);
        if t < 0.1
            v(n) = 20 * t;            % Linearly rising voltage
        elseif t < 0.4
            v(n) = 2;                 % Constant voltage
        elseif t < 0.5
            v(n) = -20 * (t - 0.4) + 2; % Linearly falling voltage
        else
            v(n) = 0;
        end
    end
    
    for n = 1:TT-1
        f1 = @(w, i, t) (Kt * i - c * w) / I;
        f2 = @(w, i, t) (-Resistance * i - Ke * w + v(n)) / L;
    
        k1W = dt * f1(w(n), current(n), timeDef(n));
        k1i = dt * f2(w(n), current(n), timeDef(n));
        k2W = dt * f1(w(n) + k1W/2, current(n) + k1i/2, timeDef(n) + dt/2);
        k2i = dt * f2(w(n) + k1W/2, current(n) + k1i/2, timeDef(n) + dt/2);
        k3W = dt * f1(w(n) + k2W/2, current(n) + k2i/2, timeDef(n) + dt/2);
        k3i = dt * f2(w(n) + k2W/2, current(n) + k2i/2, timeDef(n) + dt/2);
        k4W = dt * f1(w(n) + k3W, current(n) + k3i, timeDef(n) + dt);
        k4i = dt * f2(w(n) + k3W, current(n) + k3i, timeDef(n) + dt);
        w(n+1) = w(n) + (k1W + 2*k2W + 2*k3W + k4W) / 6;
        curr(n+1) = current(n) + (k1i + 2*k2i + 2*k3i + k4i) / 6;
    end
    
    figure;
    subplot(2, 1, 1);
    plot(timeDef, w, 'b', 'LineWidth', 1.5);
    xlabel('Time (s)');
    ylabel('Angular Velocity (rad/s)');
    title('DC Motor Angular Velocity vs Time');
    grid on;
    subplot(2, 1, 2);
    plot(timeDef, curr, 'r', 'LineWidth', 1.5);
    xlabel('Time (s)');
    ylabel('Current (A)');
    title('DC Motor Current vs Time');
    grid on;
    %}
    
    % Part C: DC Motor with Sinusoidal Input Voltage
    Resistance = 1; % Resistance (ohms)
    inductance = 0.012; % Inductance (henries)
    Kt = 0.050; % Torque constant (Nm/A)
    Ke = 0.061; % Back EMF constant (V·s/rad)
    dampingCoefficient = 0.005; % Damping coefficient (N·m·s/rad)
    I = 10.2e-5; % Moment of inertia (kg·m^2)
    dt = 0.005; % Time step (s)
    t = 0:dt:30; % Time vector
    TT = length(t);
    
    % Initialize variables
    voltage = zeros(1, TT); % Voltage array
    omega = zeros(1, TT); % Angular velocity array
    current = zeros(1, TT); % Current array
    omega(1) = 0; % Initial angular velocity (rad/s)
    current(1) = 0; % Initial current (A)
    
    % Define sinusoidal input voltage
    for n = 1:TT
        temp = t(n);
        voltage(n) = 2 * sin(0.2 * pi * temp); % Sinusoidal voltage
    end
    
    % Runge-Kutta Method for solving ODEs
    for n = 1:TT-1
        % Define derivative functions
        dwdt = @(w, i) (Kt * i - dampingCoefficient * w) / I; % dw/dt
        didt = @(w, i, v) (-Resistance * i - Ke * w + v) / inductance; % di/dt
        
        % Compute RK4 slopes for omega and current
        k1W = dt * dwdt(omega(n), current(n));
        k1i = dt * didt(omega(n), current(n), voltage(n));
        k2W = dt * dwdt(omega(n) + k1W/2, current(n) + k1i/2);
        k2i = dt * didt(omega(n) + k1W/2, current(n) + k1i/2, voltage(n));
        k3W = dt * dwdt(omega(n) + k2W/2, current(n) + k2i/2);
        k3i = dt * didt(omega(n) + k2W/2, current(n) + k2i/2, voltage(n));
        k4W = dt * dwdt(omega(n) + k3W, current(n) + k3i);
        k4i = dt * didt(omega(n) + k3W, current(n) + k3i, voltage(n));
        
        % Update omega and current using RK4 formulas
        omega(n+1) = omega(n) + (k1W + 2*k2W + 2*k3W + k4W) / 6;
        current(n+1) = current(n) + (k1i + 2*k2i + 2*k3i + k4i) / 6;
    end
    
    % Plot results
    figure;
    subplot(2, 1, 1);
    plot(t, omega, 'b', 'LineWidth', 1.5);
    xlabel('Time (s)');
    ylabel('Angular Velocity (rad/s)');
    title('DC Motor Angular Velocity vs Time - Sinusoidal Input Voltage');
    grid on;
    
    subplot(2, 1, 2);
    plot(t, current, 'r', 'LineWidth', 1.5);
    xlabel('Time (s)');
    ylabel('Current (A)');
    title('DC Motor Current vs Time - Sinusoidal Input Voltage');
    grid on;
