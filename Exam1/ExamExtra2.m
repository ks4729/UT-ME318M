format long;
%from the hw:
initialC = 3.0195;
initiala = 0.1137;
[vec1c, vec1a,i1] = vectorialNewtonRaphson(initialC,initiala,1e-10);
disp("Final coordinates for guess (3.0195, 0.1137) are (" +num2str([vec1c, vec1a])+") which took " + num2str(i1) + " iterations" + newline);

x = 0.1:0.1:0.6;
L = [2.2545, 2.6123, 2.6799, 2.7378, 2.7605, 2.7912];

LestimateHW = initialC.*(x.^(initiala));
LestimateNow = vec1c.*(x.^vec1a);

errorHW = sum((LestimateHW - L).^2);
errorNow = sum((LestimateNow - L).^2);
disp(errorHW)
disp(errorNow);

xmodel = 0:.5:30;
LestimateHW = initialC.*exp(-initiala.*xmodel);
LestimateNow = vec1c.*exp(-vec1a.*xmodel);
plot(x,L, "o", xmodel, LestimateHW, "-", xmodel, LestimateNow);
legend('Data', 'HW Estimate', 'Current Estimate')
title('')
xlabel('x')
ylabel('L')

function f1 = f1(c,a)
    x = 0.1:0.1:0.6;
    L = [2.2545, 2.6123, 2.6799, 2.7378, 2.7605, 2.7912];
    f1 = c*sum(x.^(2*a)) - sum((x.^a).*L);
end
function f2 = f2(c,a)
    x = 0.1:0.1:0.6;
    L = [2.2545, 2.6123, 2.6799, 2.7378, 2.7605, 2.7912];
    f2 = c*sum(log(x).*x.^(2*a)) - sum((x.^a).*L.*log(x));
end
function jac = Jacobian(c,a)
    x = 0.1:0.1:0.6;
    L = [2.2545, 2.6123, 2.6799, 2.7378, 2.7605, 2.7912];
    j11 = sum(x.^(2*a));
    j12 = 2*c*sum(log(x).*x.^(2*a)) - sum((x.^a).*L.*log(x));
    j21 = sum(log(x).*x.^(2*a));
    j22 = 2*c*sum((log(x).^2).*x.^(2*a)) - sum((x.^a).*L.*(log(x).^2));
    jac = [j11, j12; j21, j22];
end

function [c1,a1,iterations] = vectorialNewtonRaphson(c0, a0, error)
    cn = c0;
    an = a0;
    movementVector = [1,1];
    i=0;
    while ((abs(f1(cn,an)) > error)||(abs(f2(cn,an)) > error))
        i = i+1;
        movementVector = invert(Jacobian(cn, an))*[f1(cn, an); f2(cn, an)];
        cn = cn - movementVector(1,1);
        an = an - movementVector(2,1);
    end
    disp("Final Sensing Accuracy was: " + num2str([f1(cn,an) f2(cn,an)]));
    c1 = cn;
    a1 = an;
    iterations = i;
end

function inverse = invert(matrix)
    [mheight, mwidth] = size(matrix);
    augmented = [matrix eye([mheight, mwidth])];
    rowVector = zeros(1,mwidth); %Allocate memory better
    for i=1:mheight
        rowVector = augmented(i,:)/augmented(i,i); %make row have leading 1
        for j=1:mheight
            if i==j
                augmented(i,:) = rowVector;
            else
                augmented(j,:) = augmented(j,:) - rowVector*augmented(j,i); 
                %Subtract scaled leading 1 and following row
            end
            %each loop should cause column to be all 0s except for a 1 on
            %the diagonal
        end
    end
    inverse = augmented(:,mwidth+1:2*mwidth);
end 