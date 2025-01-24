%3.1
%{
response = 1;
count = 1;
while(~(response == 0))
    disp("Hello Mr. Anderson! This is your " + count + " repetition");
    response = input("Enter a number ∼= 0 to repeat, Enter 0 to stop: ");
    count = count +1;
end
%}

%3.4
%{
A = [ 1, 2, 3, 4 ];
B = [ 6; 7; 8; 9 ];
D = [-5.0 1.0 -3.0 3.0];

A+D
A-D
(2*D)-B'
D-57
A/4
3*D
%}

%3.5
%{
D = [-5.0 1.0 -3.0 3.0];
D(4)
%}

%3.8
%{
count= 1;
for x=1:0.5:6
    y(count) = x + 1
    count = count+1;
end
%}

%3.9
myValue = 9;
n = myValue;
for x = 1:n
    y(x) = exp(x) ;
end
y

