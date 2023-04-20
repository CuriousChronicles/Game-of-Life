% A function that takes in as input the name of a '.txt' file corresponding to
    % a Game of Life pattern (see: https://conwaylife.com/wiki/Plaintext, also https://www.conwaylife.com/ref/lexicon/lex_a.htm)
    %. = dead, O = alive, assuming no comments (! = comment in Plaintext).
%Returns a matrix in which cells are 0 or 1 based on the text we've input.
function A = lifetextin(filename)
    %% copies text from file and makes it into a matrix
    fileID = fopen(filename);
    textdata = fscanf(fileID,'%c');
    fclose(fileID);
    %disp(textdata)
    a = double(textdata);          % Converts to ASCII
    %% Find how long each line is, m, and the number lines,n
    n = 1;                  % The number of lines
    m = 0;
    for i = 1:length(a)
        if a(i) == 10
            n = n + 1;
        end
        if a(i) ~= 10 && n == 1
            m = m + 1;
        end
    end
    %disp(m)
    %disp(n)
    %% Create a n*m matrix
    A = zeros(n,m);
    %%
    b = 0;
    for i = 1:n
        for j = 1:m
            b = b + 1;
            if a(b) == 10
                b = b + 1;
                A(i,j) = a(b);
            else
                A(i,j) = a(b);
            end
            if a(b) == 46
                A(i,j) = 0;
            else
                A(i,j) = 1;
            end
        end
    end
end