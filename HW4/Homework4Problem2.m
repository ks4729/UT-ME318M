clear
clc
clear all

function y = f(x)
    y=(x^3)-4.9*(x^2)+6.73*(x)-2.011;
end
lowerBound = 0;
upperBound = 1;
temp = 0;
for i=1:1:6
    temp = lowerBound + (upperBound-lowerBound)/2;
    if f(temp) < 0
        lowerBound = temp;
    else
        upperBound = temp;
    end
    disp(i);
    disp(temp);
    disp("upper bound" + num2str(f(upperBound)));
    disp(f(temp));
    disp("lower bound" + num2str(f(lowerBound)));
end
disp(temp);
