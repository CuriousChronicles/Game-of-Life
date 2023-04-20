% Input: filename and a matrix, A, of 0-1's 
% Creates a text file corresponding to A using the Plaintext system.
function lifetextout(filename,A)
    % Loop which finds the length of the string and also including space for newline character 
    a = 0;
    for i = 1:size(A,1)
        for j = 1:size(A,2)
            %fprintf ("i = %i, j = %i\n", i, j)
            % When loop has reached the end of a line, add to include for newline character
            if mod(i,size(A,1)) == 0 && j == size(A,2)
                a = a + 2;
            else
                a = a + 1;
            end
            % Change 0-1 matrix into ASCII O and . representative numbers, 79 and 46
            if A(i,j) == 0
                A(i,j) = 46;
            elseif A(i,j) == 1
                A(i,j) = 79;
            end
        end
    end
    % Takes into account for the last line
    a = a - 2;
    %disp(a)
    %% Create array of length a
    textdata = zeros(1,a);
    %% Put information from matrix into textdata array
    b = 0;
    for i = 1:size(A,1)
        for j = 1:size(A,2)
            if j == size(A,2)
                b = b + 1;
                textdata(b) = A(i,j);
                b = b + 1;
            else
                b = b + 1;
                textdata(b) = A(i,j);
            end
        end
    end
    for i = 1:length(textdata)
        if textdata(i) == 0     % When there is a zero replace this with ASCII newline, 10
            textdata(i) = 10;
        end
    end
    %% Create File with textdata
    fileID = fopen(filename,'w');
    fprintf(fileID,'%s',textdata);
    fclose(fileID); 
    %disp(length(textdata))
end