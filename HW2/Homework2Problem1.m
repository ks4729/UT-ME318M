siblingCount = str2double(input("How many siblings do you have? \n",'s'));
if(~isempty(siblingCount))
    if (siblingCount >= 0) && (floor(siblingCount) == siblingCount)
        str="Thank you for letting me know that you have "+int2str(siblingCount)+" siblings";
        disp(str);
    elseif (siblingCount >= 0) && ~(floor(siblingCount) == siblingCount)
        disp("Input an integer next time please. You can't have a fractional sibling");
    elseif ~(siblingCount >= 0) && (floor(siblingCount) == siblingCount)
        disp("Input a positive number next time please. You can't have negative siblings");
    else
        disp("Input a non-negative integer next time please.");
    end
else
    disp("Input a non-negative integer next time please.");
end