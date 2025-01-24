clear
clc
clear all

inputCount = input("How many integers would you like to input?\n");
inputMatrix = []; 
oddMatrix = [];
evenMatrix = [];
i=1;
while i<=inputCount 
    currentInput = input("Enter an integer please\n");
    if ~(floor(currentInput)==currentInput)
        disp("That was not an integer. Try again");
    else
        inputMatrix = [inputMatrix, currentInput];
        i = i+1;
    end
end

for j=1:1:inputCount
    if (mod(inputMatrix(1, j),2) == 1)
        oddMatrix = [oddMatrix, inputMatrix(1,j)];
    else
        evenMatrix = [evenMatrix, inputMatrix(1,j)];
    end    
end    
disp(oddMatrix);
disp(evenMatrix);