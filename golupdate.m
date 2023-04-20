% Implement the rules of Conways game of life
% If a dead cell has exactly 3 live neighbours it becomes alive
% If a live cell has less than 2 live neighnours it dies
% If a live cell has more than 3 live cells, it dies
% Input: n*m matrix in which all entries are either 0 or 1
% Output: n*m matrix in which all entries are either 0 or 1

function newA = golupdate(A)
newA = zeros(size(A,1), size(A,2));
    for i = 1:size(A,1)
        for j = 1:size(A,2) %%%% This loop goes through each cell of the matrix
            %fprintf ("i = %i, j = %i\n", i, j)
            % Takes point (i,j) and finds the sum of points around it
            sum = neighborsum(A,i,j);
            if sum == 3 && A(i,j) == 0
                newA(i,j) = 1;
            elseif sum < 2 && A(i,j) == 1
                newA(i,j) = 0;
            elseif sum > 3 && A(i,j) == 1
                newA(i,j) = 0;
            else
                newA(i,j) = A(i,j);
            end
            %disp(newA);
        end
    end
    
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