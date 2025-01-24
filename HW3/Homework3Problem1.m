fib1 = input("Please input the first number in your Fibbonaci Sequence\n");
fib2 = input("Please input the second number in your Fibbonaci Sequence\n");
limit = input("Where would you like your Fibbonaci Sequence to terminate before\n");
fibVector = [fib2; fib1];
fibMatrix = [1, 1; 1, 0];
Fibonacci = [fib1 fib2];
while fibVector(1,1)<limit
    fibVector=fibMatrix*fibVector;
    Fibonacci = [Fibonacci, fibVector(1,1)];
end
Fibonacci(:,(size(Fibonacci))) = [];
disp(Fibonacci);