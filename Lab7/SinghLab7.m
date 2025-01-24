x = [.15;
    1.04;
    1.44;
    1.84;
    2.24;
    2.64;
    3.04;
    3.44;
    3.84;
    4.24];
y = [7.5;
    5.6;
    4.4;
    3.6;
    3.0;
    2.5;
    2.2;
    1.9;
    1.5;
    1.1];
%{
Yest1 = -2*x+8;
plot(x,y,'o', x, Yest1)
error1 = sum((Yest1 - y).^2);
disp(error1);
val = polyfit(x,y,1);
Yest2 = val(1)*x+val(2);
error2 = sum((Yest2 - y).^2);
disp(error2);
%}

yprime = log(y);
valprime = polyfit(x,yprime, 1);
yprimeest = valprime(1)*x+valprime(2);
plot(x, yprime, 'o', x, yprimeest);
UnprimedA = exp(valprime(2));
UnprimedB = -valprime(1);
UnprimedYest = UnprimedA*exp(-UnprimedB*x);

figure()
plot(x, y, 'o', x, UnprimedYest);
disp(valprime);
disp([UnprimedA, UnprimedB]);