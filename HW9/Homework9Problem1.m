% I have decided that today I like scientific notation
upper = 1*10^0;
mass = 1*10^2; 
b = 1*10^2; 
k = 1*10^4; 

y = zeros(1+10^2);
v = zeros(1+10^2);

v(1) = 0; 
y(1) = 1*10^-1; 

function f1 = f1(v,y)
    f1 = v+0*y;
end
function f2 = f2(v,y,mass,b,k)
    f2 = (-(b/mass)*v)+(-(k/mass)*y);
end

for i=1:(10^2)
    k1V = step*f2(v(i), y(i),m,b,k);
    k1Y = step*f1(v(i), y(i));
    k2V = step*f2(v(i)+k1V/2, y(i)+k1Y/2, mass, b, k); 
    k2Y = step*f1(v(i)+k1V/2, y(i)+k1Y/2);
    k3V = step*f2(v(i)+k2V/2, y(i)+k2Y/2, mass, b, k);
    k3Y = step*f1(v(i)+k2V/2, y(i)+k2Y/2);
    k4V = step*f2(v(i)+k3V, y(i)+k3Y, mass, b,k);
    k4Y = step*f1(v(i)+k3V, y(i)+k3Y);
    y(i+1) = y(i)+((k1Y+2*k2Y+2*k3Y+k4Y)/6);
    v(i+1) = v(i)+((k1V+2*k2V+2*k3V+k4V)/6);
end

format long;
disp(v(101));
disp(y(101));

plot(0:0.01:1, y, '-b')
hold on;
plot(0:0.01:1, v, '-r')
xlabel('Time (s)');
ylabel('Displacement (m) and Velocity (m/s)');
legend('y(t)', 'v(t)');
title('Mass Damper System of a Spring');
hold off;