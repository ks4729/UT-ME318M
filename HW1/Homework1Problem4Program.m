clear;
load('Homework1Problem4.mat');
X=[X1,X2,X3,X4,X5,X6];
M=mean(X);
mcha=num2str(M);
mabc=strcat("The sample mean of these numbers is ", mcha);
S=std(X);
scha=num2str(S);
sabc=strcat("The standard deviation of these numbers is ", scha);
disp(mabc)
disp(sabc)
