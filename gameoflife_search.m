% Takes in inputs n, m and padding constants
% then generates an n×m matrix in which entries have been ramdomly generated
% and pads the matrix and uses the game of life rules to update this matrix 19 times.
% If successful then it saves it as a plaintext file called 
% success.txt and plays song from super mario Bros
function gameoflife_search(n,m,padU,padD,padL,padR)
    %% Generate a random n×m matrix of 1's and 0's that is most likely to give a period 19 oscillator
    % A matrix is randomly generated where no  alive cell is surrounded by
    % a dead cells, as this is most likely not going to give a period 19 oscillator
    A = randi([0,1], [n,m]);
    % Run through matrix A, if it contains an alive cell surround by 0's generate a different random matrix
    a = 0;
    while a == 0
        for i = 1:size(A,1)
            for j = 1:size(A,2)
                sum = neighborsum(A,i,j);
                if sum == 0
                    a = 0;
                else
                    a = 1;
                end
            end
        end
        if a == 0
            A = randi([0,1], [n,m]);
        end
    end
    %% Pad matrix
    s1 = size(A,1);
    % L and R
    B = [[zeros(s1,padL)] A [zeros(s1,padR)]];
    % U and D
    s2 = size(B,2);
    B = [[zeros(padU,s2)] ; B ; [zeros(padD,s2)]];
        
    %% Apply game of life rules 19 times
    for x = 1:19
        B = golupdate(B);
    end
        
    %% Check if A and B are equal
    test = isequal(A,B);
    if test == 1
        lifetextout('success.txt', A);
        disp('found it!!!');
        b = 1;
    else
        b = 0;
    end
    if b == 1
        filename = '/Users/jaytipattni/Documents/MATHS 199/Super_Mario_Bros._Music_-_Level_Complete.mp3';
        [y, Fs] = audioread(filename);
        PO = audioplayer(y,Fs);
        playblocking(PO)
    end
end