clear
clc
clear all

function [e,o] = MyOddEvenCountingFunction(x)
    e=[];
    o=[];
    for i=1:1:width(x)
        if mod(x(i),2)==0
            e = [e x(i)];
        else
            o = [o x(i)];
        end
    end
end

[even1, odd1] = MyOddEvenCountingFunction([2 8 11 15 12 56]);
disp(even1);
disp(odd1);
disp("------- line break -------");
[even2, odd2] = MyOddEvenCountingFunction([8 55 2 16 389]);
disp(even2);
disp(odd2);
disp("------- line break -------");

function [p,n] = MyPositiveNegativeFunction(x)
    p=[];
    n=[];
    for i=1:1:width(x)
        if x(i) >= 0
            p = [p x(i)];
        else
            n = [n x(i)];
        end
    end
end

disp("testing postive/negative");
[positive, negative] = MyPositiveNegativeFunction([24.6 8.567 -11.5 -12.1 1.4 -15.3 23.45]);
disp(positive);
disp(negative);
disp("------- line break -------");

function s = TotalMatrixSum(x)
    s=0;    
    for i=1:1:width(x)*height(x)
       s = s+abs(x(i)); 
    end
end
disp("testing matrix sum");
m1=TotalMatrixSum([5 15 12;-6 8 1]);
disp(m1);

m2=TotalMatrixSum([2 .5 15; 1.3 13 -4; -14.3 1 2]);
disp(m2);