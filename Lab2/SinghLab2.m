%Q 2.1: Construct a statement that will be true if x is equal to 12 or -3.
%A: (x==12 || x==-3)

%Q2.2: Write a program to make a game where you roll a virtual six-sided dice with integer 1 to 6 on respective sides and get the following outputs based on what you rolled. First, display the message “You rolled a [number of roll]”. After that, if it is a 6, display the message “Congrats!”. If it is a 5, display the message “Close”. If you roll anything else besides 5 or 6, display the message “Please try again”. Hint: Look into the rand command. Divide the interval (0,1) into six sub-intervals. Please do NOT use the built-in Matlab command randi. We want you to actually use the if branching in this problem.
%A: 
%{
rolled = floor(rand*6)+1;
disp("You rolled a "+int2str(rolled));
if(rolled == 6)
    disp("Contrats!");
elseif(rolled==5)    
    disp("Close!");
else
    disp("Please try again");
end    
%}
%Q2.3: Write a program to add all even numbers between 1 and 100. Hint: look into the mod function.!
%A: 
sum=0;
for i=1:1:100
    if(mod(i,2)==0)
        sum = sum+i;
    end
end
disp(sum);