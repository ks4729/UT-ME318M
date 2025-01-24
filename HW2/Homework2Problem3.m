Number1=input("Give me a number \n");
Number2=input("Give me another number \n");
if (Number1 >= Number2)
    minNum=Number2;
    maxNum=Number1;
else
    minNum=Number1;
    maxNum=Number2;
end
numberOfNumbers=maxNum-minNum+1;
sum = (numberOfNumbers/2)*(minNum+maxNum);
str="Total sum of integers between "+num2str(minNum)+" and "+num2str(maxNum)+" is "+num2str(sum)+".";
disp(str);
