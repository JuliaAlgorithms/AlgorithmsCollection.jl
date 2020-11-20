"""
    sum_of_bit_difference(array::Array{Int64,1})

For finding the sum of bit differences in all pairs of an array, the array will be
transformed into a series of subarrays  for a given bit-length.


# Arguments
- `array::Array{Int64,1}`: Unsorted array


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [8, 1, 2, 12, 45, 100, 43]
julia> ClassicAlgorithmsCollections.maximum_xor_subarray(arr)
104
```
"""
function sum_of_bit_difference(array::Array{Int64,1}, bit = 32)
    n = length(array)
    result = 0
    for i in 1:bit
        count = 0
        for j in 1:n
            if (array[j] & (1 << i)) != 0
                count += 1
            end
        end
        result += count * (n - count) * 2
    end
    return result
end
