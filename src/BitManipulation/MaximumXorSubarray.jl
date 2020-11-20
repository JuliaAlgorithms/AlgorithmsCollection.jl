"""
    maximum_xor_subarray(array::Array{Int64,1})

For finding the maximum XOR value of a subarray by running two nested for-loops. The first
for-loop is intializing the current XOR value, the second for-loop is generating the [BIT-XOR](https://en.wikipedia.org/wiki/Bitwise_operation#XOR)
and compared the current value with the temporary largest value.


# Arguments
- `array::Array{Int64,1}`: Unsorted array


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [8, 1, 2, 12, 45, 100, 43]
julia> ClassicAlgorithmsCollections.maximum_xor_subarray(arr)
110
```
"""
function maximum_xor_subarray(array::Array{Int64,1})
    result = -21345944
    n = length(array)

    for i in 1:n
        curr_xor = 0
        for j in i:n
            curr_xor = curr_xor ⊻ array[j]
            if result < curr_xor
                result = curr_xor
            end
        end
    end
    return result
end
