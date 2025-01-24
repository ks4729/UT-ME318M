format long;
%from the hw:
initialC = 3.0195;
initiala = 0.0710;
[vec1k, vec1a,i1] = vectorialNewtonRaphson(initialK,initiala,1e-10);
disp("Final coordinates for guess (4.571, 0.0710) are (" +num2str([vec1k, vec1a])+") which took " + num2str(i1) + " iterations" + newline);

t = [0,4,8,16,24,30];
y= [5.467, 3.629, 2.301,1.012,0.9075,0.6229];

YestimateHW = initialK.*exp(-initiala.*t);
YestimateNow = vec1k.*exp(-vec1a.*t);

errorHW = sum((YestimateHW - y).^2);
errorNow = sum((YestimateNow - y).^2);
disp(errorHW)
disp(errorNow);

tmodel = 0:.5:30;
YestimateHW = initialK.*exp(-initiala.*tmodel);
YestimateNow = vec1k.*exp(-vec1a.*tmodel);
plot(t,y, "o", tmodel, YestimateHW, "-", tmodel, YestimateNow);
legend('Data', 'HW Estimate', 'Current Estimate')
title('')
xlabel('t')
ylabel('Y')

function f1 = f1(k,a)
    t = [0,4,8,16,24,30];
    y= [5.467, 3.629, 2.301,1.012,0.9075,0.6229];
    f1 = (k*sum(exp(-2*a.*t)))-sum(y.*exp(-a.*t));
end
function f2 = f2(k,a)
    t = [0,4,8,16,24,30];
    y= [5.467, 3.629, 2.301,1.012,0.9075,0.6229];
    f2 = sum(y.*t.*exp(-a.*t)) - k*(sum(t.* exp(-2*a.*t)));
end
function jac = Jacobian(k,a)
    t = [0,4,8,16,24,30];
    y= [5.467, 3.629, 2.301,1.012,0.9075,0.6229];
    j11 = sum(exp(-2*a.*t));
    j12 = sum(t.*exp(-2*a.*t).*y) - 2*k*sum(t.*exp(-2*a.*t));
    j21 = -sum(t.*exp(-2*a.*t));
    j22 = 2*k*sum((t.^2).*exp(-2*a.*t))-sum(y.*(t.^2).*exp(-a.*t));
    jac = [j11, j12; j21, j22];
end

function [k1,a1,iterations] = vectorialNewtonRaphson(k0, a0, error)
    kn = k0;
    an = a0;
    movementVector = [1,1];
    i=0;
    while ((abs(f1(kn,an)) > error)||(abs(f2(kn,an)) > error))
        i = i+1;
        movementVector = invert(Jacobian(kn, an))*[f1(kn, an); f2(kn, an)];
        kn = kn - movementVector(1,1);
        an = an - movementVector(2,1);
    end
    disp("Final Sensing Accuracy was: " + num2str([f1(kn,an) f2(kn,an)]));
    k1 = kn;
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