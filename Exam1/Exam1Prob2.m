format long;

[vec1x, vec1y,vec1z, vec1z1, i1] = vectorialNewtonRaphson(-1.5,2.5,0,0,1e-6, 1e-6);
disp("Final coordinates for guess (-1.5,2.5) are (" +num2str([vec1x, vec1y,vec1z, vec1z1])+") which took " + num2str(i1) + " iterations" + newline);
[vec2x, vec2y,vec2z, vec2z1, i2] = vectorialNewtonRaphson(1,1,0,0,1e-6, 1e-6);
disp("Final coordinates for guess (1,1) are (" +num2str([vec2x, vec2y, vec2z, vec2z1])+") which took " + num2str(i2) + " iterations" + newline);
[vec3x, vec3y,vec3z, vec3z1, i3] = vectorialNewtonRaphson(1,-1.5,0,0,1e-6, 1e-6);
disp("Final coordinates for guess (1,-1.5) are (" +num2str([vec3x, vec3y,vec3z, vec3z1])+") which took " + num2str(i3) + " iterations" + newline);
[vec4x, vec4y,vec4z, vec4z1, i4] = vectorialNewtonRaphson(-0.5,-2.5,0,0,1e-6, 1e-6);
disp("Final coordinates for guess (-0.5,-2.5) are (" +num2str([vec4x, vec4y,vec4z, vec4z1])+") which took " + num2str(i4) + " iterations" + newline);


function f = f(x,y,z,z1)
    f = (20*(x^2))-20-(y^3);
end
function g = g(x,y,z,z1)
    g = 4*(x^3)-2*(y^2)-(6*exp(x))-(4*x)+20;
end
function h = h(x,y,z,z1)
    h = z;
end
function h1 = h1(x,y,z,z1)
    h1 = z1;
end
function jac = Jacobian(x,y,z,z1)
    jac = [40*x, -3*(y^2), 0, 0; 12*(x^2)-6*exp(x)-4, -4*y, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1];
end


function [x1,y1,z,z1,iterations] = vectorialNewtonRaphson(x0, y0, z0,z10, error, aAccuracy)
    xn = x0;
    yn = y0;
    zn = z0;
    z1n = z10;
    movementVector = [1,1];
    i=0;
    while (norm(movementVector) > aAccuracy)&&((abs(f(xn,yn,zn,z1n)) > error)||(abs(g(xn,yn,zn,z1n)) > error))
        i = i+1;
        movementVector = invert(Jacobian(xn, yn, zn, z1n))*[f(xn, yn,zn,z1n); g(xn, yn,zn,z1n); h(xn, yn,zn,z1n); h1(xn, yn,zn,z1n)];
        xn = xn - movementVector(1,1);
        yn = yn - movementVector(2,1);
        zn = zn - movementVector(3,1);
        z1n = z1n - movementVector(4,1);
    end
    disp("Final Actuation Accuracy was: " + num2str(norm(movementVector)));
    disp("Final Sensing Accuracy was: " + num2str([f(xn,yn) g(xn,yn)]));
    x1 = xn;
    y1 = yn;
    z = zn;
    z1 = z1n;
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