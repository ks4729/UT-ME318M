age = str2double(input("How old are you? \n",'s'));
if ~(num2str(age)=="NaN")
    if(age >=0 && age < 5)
        disp("Oh that’s so cute!");
    elseif(age >= 5 && age < 14)
        disp("Oh, how’s school going?");
    elseif(age >= 14 && age < 19)
        disp("So, how do you like highschool?");
    elseif(age >= 19 && age < 25)
        disp("Are you in college?");
    elseif(age >= 25 && age < 55)
        disp("Oh, what do you do for a living?");
    elseif(age >= 55 && age < 70)
        disp("Do you have grandchildren?");
    elseif(age >= 70 && age < 90)
        disp("I hope you are healthy and are enjoying your retirement.");
    elseif(age >= 90)
        disp("Oh, that is fantastic!");
    else
        disp("Something isn't right");
    end
else
    disp("Input a number next time please.");
end