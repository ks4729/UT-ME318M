clear
clc
clear all

function s = f(x)
    s= (x^3)-5.1*(x^2)+7.02*x-1.05;
end

l = 0;
u = 1;
for i=1:1:3
    temp = l-f(l)*(u-l)/(f(u)-f(l));

    if f(temp) > 0
        u=temp;
    else
        l=temp;
    end
    
    disp(i);
    disp(u);
    disp(temp);
    disp(f(temp));
    disp(l);
end