format long;

[vec1x, vec1y] = vectorialNewtonRaphson(1,2,1e-6, 1e-5);
[vec2x, vec2y] = vectorialNewtonRaphson(1,-2,1e-6, 1e-5);
[vec3x, vec3y] = vectorialNewtonRaphson(-1,2,1e-6, 1e-5);
[vec4x, vec4y] = vectorialNewtonRaphson(-1,-2,1e-6, 1e-5);
disp([vec1x, vec1y]);
disp([vec2x vec2y]);
disp([vec3x vec3y]);
disp([vec4x vec4y]);

function [x1,y1] = vectorialNewtonRaphson(x0, y0, error, aAccuracy)
    xn = x0;
    yn = y0;
    movementVector = [1,1];
    while (norm(movementVector) > aAccuracy)&&((f(xn,yn) > error)||(g(xn,yn) > error))
        
        movementVector = invert(Jacobian(xn, yn))*[f(xn, yn); g(xn, yn)];
        
        xn = xn - movementVector(1,1);
        yn = yn - movementVector(2,1);

    end
    x1 = xn;
    y1 = yn;
end

function f = f(x,y)
    f = (x^2)+(y^2)-4;
end
function g = g(x,y)
    g = (x^2)+(y^2)/9-1;
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

function jac = Jacobian(x, y)
    jac = [2*x 2*y; 2*x 2*y/9];
end