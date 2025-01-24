function inverse = invert(matrix);
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


M = [1 2 5; 3 4 6; 1 0 -4];
i = invert(M);
disp(i);
disp(i*M); %if it is the inverse, it will be the identity matrix

disp(det(M));