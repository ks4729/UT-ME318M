
%Declaring variables
d1 = 1; 
d2 = 1; 
alpha = 0:pi/100:pi/2;
beta = 0:pi/100:pi;
[Alpha, Beta] = meshgrid(alpha, beta);
range = d1.*cos(Alpha) + d2.*cos(Alpha + Beta);
height = d1.*sin(Alpha) + d2.*sin(Alpha + Beta);
%Creating figures and pretty graphs
fig1 = figure(1); %Making a new figure window
mesh(Alpha, Beta, range);%Defining the function being displayed
title('Range as function of Alpha and Beta')
xlabel("Alpha (rad)");
ylabel("Beta (rad)");
zlabel("Range");
fig2 = figure(2); %Making a new figure window
mesh(Alpha, Beta, height); %Defining the function being displayed
title('Height as function of Alpha and Beta')
xlabel("Alpha (rad)");
ylabel("Beta (rad)");
zlabel("Height");

%Step 1
x0 = [1; 2];
Rdes = 1;
Hdes = 1.1;
acc = 0.01;
maxSteps = 100;

xold = x0; 

%Steps 4&5
accReached = false;
steps = 0;
while (~accReached) & (steps < maxSteps)
    %Steps 2&3
    xnew = xold - Jacobian(xold.')\functionVector(xold.');
    
    %the rest of Steps 4&5
    accReached = (xnew-xold) < [acc, acc]; 
%per the comment left by sambe on 11/1 this is what accuracy means, not that the norm is less than the accuracy as the problem says by saying "euclidean distance"
    xold = xnew;
    steps = steps+1;
end    
disp(xnew);
disp(steps)

function vec = functionVector(abVec)
    alpha = abVec(1,1);
    beta = abVec(1,2);
    d1 = 1; 
    d2 = 1;
    f1 = d1*cos(alpha) + d2*cos(alpha + beta) - 1;
    f2 = d1*sin(alpha) + d2*sin(alpha + beta) - 1.1;
    vec = [f1; f2];
end

function jac = Jacobian(abVec)
    alpha = abVec(1,1);
    beta = abVec(1,2);
    d1 = 1;
    d2 = 1;
    %declaring the entries of my jacobian
    Jac11 = -1*d1*sin(alpha) - d2*sin(alpha + beta);
    Jac12 = -1*d2*sin(alpha + beta);
    Jac21 = d1*cos(alpha) + d2*cos(alpha + beta);
    Jac22 = d2*cos(alpha + beta);
    jac = [Jac11, Jac12; Jac21, Jac22];
end