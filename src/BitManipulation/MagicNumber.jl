"""
    magic_number(n::Int64))

A magic number has to build as the power of 5 or the sum of unique powers of 5. First few
magic numbers are:
    1. 5
    2. 5^2 = 25
    3. 5 + 25 = 30
    4. 5^3 = 125
    5. 125 + 5 = 130


# Arguments
- `n::Int64`: Integer value of the number, which has to become a magic number


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> ClassicAlgorithmsCollections.magic_number(5)
130
```
"""
function magic_number(n::Int64)

    pow = 1
    result = 0

    while n != 0
        pow *= 5
        if n & 1 % Bool
            result += pow
        end
        n >>= 1
    end
    return result
end
