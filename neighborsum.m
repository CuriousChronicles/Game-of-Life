% Write a function that finds the sum of neighbouring cells
% Inputs: A matrix 'A', and coordinates (i,j)
% Output: sum of surrounding cells
function  sum = neighborsum(A,i,j)
    sum = 0;
    % For loop which runs through each cells, it ignores invalid cells such as ones that extend the matrix 
    for x = (i-1):(i+1)
        for y = (j-1):(j+1)
            %fprintf ("x = %i, y = %i\n", x, y)%, this displayed all the possible values of x and y 
            if x == i && y == j                     % Skip value at cell (i,j)
                continue
            end
            if x <= 0 || y <= 0                     % If (i,j) is on the edge cell, skip
                continue
            end
            if x > size(A,1) || y > size(A,2)       % is x greater than the first dimension of A or is y greater than the second dimension of A      
                % If any value of x or y meets these conditions, skip.                                        
                continue
            end
            % Everytime it goes through the loop, valid answers are added to the sum
            sum = sum + A(x,y);
        end
    end
end