%{
 M = [0 -cos(deg2rad(30+35)) -cos(deg2rad(45)) cos(deg2rad(65)); 0 -sin(deg2rad(30+35)) -sin(deg2rad(45)) sin(deg2rad(65)); -cos(deg2rad(30)) 0 0 -cos(deg2rad(65)); -sin(deg2rad(30)) 0 0 -sin(deg2rad(65))];


B = [0;0;0;9.81*2200];
[mheight, mwidth] = size(M);
augmented = [M [0;0;0;9.81*2200]];
rowVector = zeros(1,mwidth); %Allocate memory better
for i=1:mheight
    for k=i:mheight
        if ~(augmented(k,i) == 0) 
            temp = augmented(i,:);
            augmented(i,:) = augmented(k,:);
            augmented(k,:) = temp;
        end
    end    
    if augmented(i,i) == 0 
        disp("inversion not working");
    else
        rowVector = augmented(i,:)/augmented(i,i);
        for j=1:mheight
            if i == j
                augmented(i,:) = rowVector;
            else
                augmented(j,:) = augmented(j,:) - rowVector*augmented(j,i);
            end
        end
    end
end

disp(augmented(:,5));



disp(M\B);

%}

M1 = [1.001 1; 1 1];
M2 = [.9999 1; 1 1];
B = [2; 1];
disp(M1 \ B);
disp(M2 \ B);


