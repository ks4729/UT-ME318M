functionInputMatrix = [1 -18.535 25.697 28.099];
p = functionInstantiator(functionInputMatrix);
f = bisection(p, -4, 6, 10.^(-4));

%new method for bisecting
function root = bisection(f, upperLimit, lowerLimit, error)
    root = (upperLimit + lowerLimit) / 2;
    iterations = 1;
    while (abs(f(root)) > error && iterations < 20)
        if (f(root)*f(upperLimit) < 0)
            b = lowerLimit;
        else
            a = upperLimit;
        end
            root = (upperLimit + lowerLimit) / 2;
            iterations = iterations + 1;
    end
end
%reusing this from last hw
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

x = -1:0.1:6;
fig = figure(1);
plot(x, f1(x),'b');
title('f(x) with root found from bisection');
xlabel('x');
ylabel('y');
hold on;
saveas(fig,'f1root.jpg');