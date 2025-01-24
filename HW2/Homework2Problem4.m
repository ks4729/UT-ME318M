loopLim=input("How many integer numbers do you want to enter?\n");
for  i=1:1:(loopLim)
    currentInt=input(append("This is loop number ",num2str(i)," and you should enter an integer here -> "));
    if ~(round(currentInt)==currentInt)
        disp(append("Hey that is not an integer – I’m rounding it to ",num2str(round(currentInt)),"!"));
    end
    disp(append("Your integer number ",num2str(i)," is ",num2str(round(currentInt))));
end

