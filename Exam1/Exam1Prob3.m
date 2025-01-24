M = [2 5 7 10; -4 3 2 0; 12 -2 0 4; 5 1 2 -7];
N = [1 -5 6 6; 2 1 1 8; 5 -3 8 24 ; 3 -4 7 16];

disp("inverse gauss");
disp(invertGaussJordan(M));
disp("inverse eigen");
disp(invertEigen(M));
disp(inv(M));

disp("inverse gauss");
disp(invertGaussJordan(N));
disp("inverse eigen");
disp(invertEigen(N));
disp(inv(N));


function inverse = invertGaussJordan(matrix)
    [mheight, mwidth] = size(matrix);
    augmented = [matrix eye([mheight, mwidth])];
    rowVector = zeros(1,mwidth); %Allocate memory better
    for i=1:mheight
        if augmented(i,i) == 0 %if row has leading 0 along diagonal, that 
            % means that the transformation described by the matrix is 
            % non-bijective and so there is no defined inverse function 
            % nor corresponding inverse matrix. In other words, no inverse 
            % exists and determinant is 0. 
            inverse = [];
            return;
        else
            rowVector = augmented(i,:)/augmented(i,i); %make row have 
            % leading 1
            for j=1:mheight
                if i == j
                    augmented(i,:) = rowVector;
                else
                    augmented(j,:) = augmented(j,:) - rowVector*augmented(j,i); 
                    %Subtract scaled leading 1 and following row
                end
                %each loop should cause column to be all 0s except for a 1 
                % on the diagonal
            end
        end
    end
    inverse = augmented(:,mwidth+1:2*mwidth);
end

function inverse = invertEigen(matrix)
    %A = S*B*inverse(S) where S has row vectors that are eigenvectors, B
    %is a diagonal matrix with eigenvalues along the diagonal, and
    %inverse(S) is easily calculated as the transpose of S if A is 
    % symmetric, but we aren't gaurenteed that. When I was initially
    % writing this code, I thought that the inverse of S was always the
    % transpose, but we need S to have orthogonal column vectors for that
    % to be the case, which is only true if A is symmetric. 
    %inverse(A) = S*inverse(B)*inverse(S) using the same S as earlier, and
    %inverse(B) now uses the multiplicative inverse of the eigenvalues
    %along the diagonal
    
    A = matrix;
    [S, B] = eig(A);
    for i=1:height(B)
        if norm(B(i,i)) < (10^(-6)) %wasn't working properly because 
            % floating point was approximating zero but wasn't equaling. 
            % Using norm because complex eigenvalues :)
            inverse = [];
            return;
        else
            B(i,i) = 1/B(i,i);
        end
    end
    Sinv = invertGaussJordan(S);
    inverse = S*B*Sinv;
end