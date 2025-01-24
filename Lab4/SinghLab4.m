%3.1
%{
function value = f(x)
value = (3/500)*(x.^3 - 10.535*x.^2 + 25.697*x - 18.099);
%}

%3.4
%{
z = input("Input angle approximating at: ");
n = input("Input terms approximating with: ");

sumApprox = z;
prodApprox = z;

for k = 1:n
    sumApprox = sumApprox+((-1)^k)*(z^(2*k + 1))/factorial(2*k+1);
    prodApprox = prodApprox*(1-(z/(k*pi))^2);
end
disp("With summation: " + num2str(sumApprox,5));
disp("With products: " + num2str(prodApprox,5));
%}

load("data-1.mat");
charts = figure(1);

subplot(2, 2, 1), plot(time,xdisp) %first graph
title("Mass displacement over time");
xlabel("Time (s)");
ylabel("Displacement (m)");

months = 1:1:12;
subplot(2, 2, 2), bar(months, measles) %second graph
title("Measles over 12 month");
xlabel("Time (Months)");
ylabel("Cases of Measles in Children");
x = -3:0.1:3;
y = -3:0.1:3;

[xg, yg] = meshgrid(x,y);
z = xg.^2 + yg.^2; %creating function
subplot(2,2,3), surf(x,y,z) %third graph
str = "$ Parabola \mathbb{R} $";
title("Parabola"); %tried to write "in \mathbb{R}^{3} and use interpreter latex to get it to work but it never did :(
xlabel('x');
ylabel('y');
zlabel('z');

subplot(2,2,4), semilogx(frequency, magnitude); %fourth graph
title('Magnitude vs Frequency');
xlabel('Frequency (Hz)');
ylabel('Response Magnitude (dB)');

saveas(charts, 'SinghLab4Prob5pic.jpg');