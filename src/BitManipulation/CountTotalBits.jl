"""
    count_total_bits(n::Int64)

Calculates the total number of bits from 1 to `n` for a given integer `n` by combing a 
while-loop for building the binary subsets with a range for-loop for counting the bits.


# Arguments
- `n::Int64`: Integer value which has to be evaluated.


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> ClassicAlgorithmsCollections.count_total_bits(17)
35
```
"""
function count_total_bits(n::Int64)

    i = 0
    result = 0

    while n > (1 << i)

        k =0
        change = 1 << i

        for _ in 1:n+1
            result += k

            if change == 1
                # Flipping the bit
                if k == 0
                    k = 1
                else
                    k = 0
                end
                change = 1 << i 
  
            else 
                change -= 1
            end
        end
        i += 1

    end
    return result
end
