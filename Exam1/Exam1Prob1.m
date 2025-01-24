format("long");
functionInputMatrix = [1 -10.2 29.5 -20.34];
p = functionInstantiator(functionInputMatrix);

searchRange = [0 10];
intervals = [];

for i=searchRange(1):1:searchRange(2)-1 %finds my intervals within the search range
    if p(i)*p(i+1) < 0
        intervals = [intervals [i; i+1]];
    end
end

for whichRoot = 1:1:width(intervals)
    disp(rootFind(p, intervals(1, whichRoot), intervals(2, whichRoot), 1e-8, 1e-6));
end

function root = rootFind(p, upperLimit, lowerLimit, error, aAccuracy)
    [newUpperLimit, newLowerLimit] = bisection(p, upperLimit, lowerLimit, error, aAccuracy);
    [root, diverge] = newtonRaphson(p, newUpperLimit, newLowerLimit, error, aAccuracy);
    if diverge
        disp("diverged");
        root = rootFind(p, newUpperLimit, newLowerLimit, error, aAccuracy);
    else
        return;
    end
end

function [newUpperLimit, newLowerLimit] = bisection(p, upperLimit, lowerLimit, error, aAccuracy)
    disp("Bisecting!");
    root = upperLimit;
    iterations = 0;
    movement = 1;
    while (abs(p(root)) > error && iterations < 5 && abs(movement) > aAccuracy)
        iterations = iterations + 1;
        root = (upperLimit + lowerLimit) / 2;
        if (p(root)*p(upperLimit) < 0)
            movement = lowerLimit - root;
            lowerLimit = root;
        else
            movement = upperLimit-root;
            upperLimit = root;
        end
        disp(iterations);
    end
    newUpperLimit = upperLimit;
    newLowerLimit = lowerLimit; 
end

function [root, diverge] = newtonRaphson(p, upperLimit, lowerLimit, error, aAccuracy)
    disp("NewtonRaphson!");
    diverge = false;
    root = upperLimit;
    iterations = 0;
    movement = 1;
    while (abs(p(root)) > error && iterations < 3 && abs(movement) > aAccuracy)
        root = lowerLimit-(upperLimit-lowerLimit)*p(lowerLimit)/(p(upperLimit)-p(lowerLimit));
        iterations = iterations + 1;
        if (p(root)*p(upperLimit) < 0)
            movement = lowerLimit - root;
            lowerLimit = root;
        else
            movement = upperLimit-root;
            upperLimit = root;
        end
        disp(iterations);
    end
    diverge = (abs(p(root)) > error && abs(movement) > aAccuracy); %if it is stopping the loop for 
    % some reason other than it has found the root within our bound, it 
    % has diverged
    disp(diverge);
    if ~diverge
        disp("Sensing Accuracy ");
        disp(abs(p(root)))
        disp("Actuation Accuracy ");
        disp(abs(movement));
    end
end

%make any polynomial function by passing in mx1 matrix with all the coefficients
function func = functionInstantiator(a)
    func = @f;
    function y = f(x)
        tempy = 0;
        for i=0:1:width(a)-1
            tempy = tempy + (a(i+1)).*(x.^(width(a)-1-i));
        end
        y = tempy;
    end
end