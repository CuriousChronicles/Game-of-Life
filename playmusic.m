% Insert a number, if successful play music
% Number is 10
function playmusic(n)
    if n == 10
        filename = '/Users/jaytipattni/Documents/MATHS 199/Super_Mario_Bros._Music_-_Level_Complete.mp3';
        [y, Fs] = audioread(filename);
        PO = audioplayer(y,Fs);
        playblocking(PO)
    else
        disp('incorrect, try again');
    end
end