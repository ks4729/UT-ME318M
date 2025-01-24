ve = 1800;
m0 = 100000;
q = 2000;
g = 9.81;
dt = 0.1;
t = 0:0.1:30; 
delta_v = @(t) ve*log(m0./ (m0+(q*t))) - g.*t;
n = length(t);  % Number of time steps
if mod(n, 2) == 0  % Ensure we have an odd number of intervals
    n = n - 1;
    t = t(1:end-1);
end
f_values = delta_v(t);
integral = f_values(1) + f_values(end);  % First and last terms
for i = 2:2:n-1
    integral = integral + 4*f_values(i);  % Odd indexed terms (4x multiplier)
end
for i = 3:2:n-2
    integral = integral + 2*f_values(i);  % Even indexed terms (2x multiplier)
end
integral = integral * (dt / 3);  % Multiply by step size / 3

disp(integral);