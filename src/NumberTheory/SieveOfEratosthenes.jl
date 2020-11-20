"""
    sieve_of_eratosthenes(n::Int64)

The Sieve of Eratosthenes is one of the historical algorithms dedicated to finding all
prime numbers up to any given limit. The algorithm is split into four steps:

1. Create a list of sequential integers from 2 to n.
2. Define initially `p=2` as the first prime number.
3. Reconstruct all multiple combinations from `p=2`.
4. Find the first number greater than p in the array that is not listed. Then decided:
	* If no number exists => stop. 
	* `p` becomes equal to the number and go back to step 3.

For more information see: [https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes)


# Arguments
- `n::Int64`: Number of elements


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> ClassicAlgorithmsCollections.sieve_of_eratosthenes(50)
[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47]
```
"""
function sieve_of_eratosthenes(n::Int64)
    prime = fill(true, n)
    p = 2
    while p^2 <= n


        if prime[p] == true

            # Update all multiples of p 
            for i in p^2:p:n
                prime[i] = false
            end

        end
        p += 1
    end
    result = zeros(Int64, count(prime) - 1)
    i = 1
    for p in 2:n
        if prime[p]
            result[i] = p
            i += 1
        end
    end
    return result
end
