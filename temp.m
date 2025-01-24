format long;
[vec1x, vec1y] = vectorialNewtonRaphson(-1.5, 1.5, 1e-6, 1e-6);
disp([vec1x, vec1y]);

function f = f(x, y)
    f = (20 * (x^2)) - 20 - (y^3);
end

function g = g(x, y)
    g = (14 * (x^3)) - (6 * exp(x)) - 4 * x + 20 - 2 * (y^3);
end

function jac = Jacobian(x, y)
    jac = [40 * x, -3 * (y^2); 42 * (x^2) - 6 * exp(x) - 4, -6 * (y^2)];
end

function [x1, y1] = vectorialNewtonRaphson(x0, y0, error, aAccuracy)
    xn = x0;
    yn = y0;
    movementVector = [1; 1];  % Column vector
    while (norm(movementVector) > aAccuracy && (abs(f(xn, yn)) > error || abs(g(xn, yn)) > error))
        J = Jacobian(xn, yn); 
        movementVector = inv(J) * [f(xn, yn); g(xn, yn)];
        xn = xn - movementVector(1);
        yn = yn - movementVector(2);
        
        % Display debug information
        disp("Current guess: (" + num2str(xn) + ", " + num2str(yn) + ")");
        disp("Function values: f = " + num2str(f(xn, yn)) + ", g = " + num2str(g(xn, yn)));
    end
    x1 = xn;
    y1 = yn;
end