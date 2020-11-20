"""
    smallest_subset4sum(array::Array{Int64,1}, target::Int64)

Returns length of smallest subarray-unit with sum greater than the target.

# Arguments
- `array::Array{Int64,1}`: Unsorted array
- `target::Int64`: Target number to reach


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr =  [10, 12, 11, 9, 13, 14, 17, 18, 15]
julia> ClassicAlgorithmsCollections.smallest_subarray4sum(arr)
4
```
"""
function smallest_subset4sum(array::Array{Int64,1}, target::Int64)
    n = length(array)
    min_length = n

    for i in 1:n
        current_sum = array[i]
        if current_sum > target
            return 1
        end
        for j in (i+1):n
            current_sum += array[j]
            if current_sum > target && (j - i + 1) < min_length
                min_length = (j - i + 1)
            end
        end
    end
    if min_length != n
        return min_length
    else
        return nothing
    end
end
