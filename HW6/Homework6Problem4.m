function y = p(x)
    y = exp(x)-(x^2)-5*x+2;
end 
function root = findRoot(upperBound, lowerBound, error)
    %first 5 iterations of bisection
    temp = 0;
    format long;
    for i=1:1:5
        temp = lowerBound + (upperBound-lowerBound)/2;
        if p(temp)*p(upperBound) < 0 %is valid interval, becomes new one
            lowerBound = temp;
        else %other is the valid interval, becomes new one
            upperBound = temp;
        end
    end
    %now Newton Raphson
    newBound1 = lowerBound;
    newBound2 = upperBound;
    i = 1;
    while (abs(p(temp)) > 1e-7 && i <= 3)
        temp = newBound1-p(newBound1)*(newBound2-newBound1)/(p(newBound2)-p(newBound1));
        if p(temp)*p(newBound1) < 0
          newBound2=temp;
        else
          newBound1=temp;
        end
        disp(i);
        i = i+1;
    end
    disp(p(temp));
    if(i > 3)
        disp("bisecting again");
        findRoot(upperBound, lowerBound, error);
    end
    root = temp;
end

disp(findRoot(0,1, 1e-7));
disp(findRoot(3,4, 1e-7));
disp(findRoot(-5,-6, 1e-7));


