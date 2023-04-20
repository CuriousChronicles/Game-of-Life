% takes in value n and tests if n can be written as a sum of two primes, giving the value of a, where a is the smallest prime number
% If n is not an integer greater than two or is not an even integer, then 'throw an error'

function a = goldbach(n)
    a = 0;
    if mod(n,2) == 1 || n <= 2
        msg = 'n is not an integer greater than two or is not an even integer';
        error(msg)
    else
        for x = 2:(n/2)
            if isprime(x) && isprime(n-x)
                % primes = [x,n-x]
                if x <= n-x
                    a = x;
                else
                    a = (n-x);
                end
                break
            end
        end
    end
end

    
    %if mod(n,2) == 1 || n <= 2
    %    msg = 'n is not an integer greater than two or is not an even integer';
    %    error(msg)
    %else
    %    for x = 1:n
    %        for y = (n-x):-1:2
    %            if x + (n-x) == n
    %               sums = [x, (n-x)];
    %                if isprime(x) && isprime(n-x)
    %                    primesum = [x,(n-x)];
    %                    if x <= (n-x)
    %                        a = x;
    %                    else
    %                        a = (n-x);
    %                    end
    %                end
    %            end
    %        end
    %    end
    %end
%end