load("Homework7Problem4.mat");
ps = 2:15;
RSS = [];
%go through making a polynomial estimation for each power up until 15
for polynomialSize=2:1:15
    %we CAN use polyfit/polyval, so I will be doing so here
    regressionPolynomial = polyfit(x,y,polynomialSize);
    yEstimated = polyval(regressionPolynomial, x);
    sumOfResidualSquares = (norm(yEstimated-y))^2;
    %my norm is each element in a vector squared, then summed, then the
    %square root of that whole sum. By squaring my norm, I get the sum of
    %the square of each of my elements in my vector. My vector here is my
    %my residuals.
    disp("For polynomial size " + num2str(polynomialSize) + " my residual sum is " + num2str(sumOfResidualSquares));
    RSS = [RSS sumOfResidualSquares];
end

plot(ps, RSS);