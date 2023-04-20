%Takes in a filename that corresponds to a Game of Life pattern.  Uses 
%lifetextin.m to import this as a matrix, then uses golupdate to repeatedly
%update said matrix n times.  Displays results as an image.  Pads matrix
%with zeros.  Magnifies results by factor of mag. 
%https://www.conwaylife.com/ref/lexicon/lex_a.htm is fun!
function A = gameoflife(filename,n,padU,padD,padL,padR,mag)
    %% Takes in file
    A = lifetextin(filename);
    %% Pad the matrix
    s1 = size(A,1);
    % L and R
    A = [[zeros(s1,padL)] A [zeros(s1,padR)]];
    % U and D
    s2 = size(A,2);
    A = [[zeros(padU,s2)] ; A ; [zeros(padR,s2)]];
    %% Repeat n number of times
    for i = 1:n
        A = golupdate(A);
        imshow(A,'InitialMagnification',mag);
    end
end

