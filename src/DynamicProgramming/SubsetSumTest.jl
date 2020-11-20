"""
    subset_sum_test(array::Array{Int64,1}, target::Int64)

The recursive expression tests if there is a subset in the array, where the sum of the
subset is equal to the `target`.
    

# Arguments
- `array::Array{Int64,1}`: Array with a possible sum of a subsequence.
- `target::Int64`: Target sum of the subsequence, which should be included in the array.


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> set = [3, 34, 4, 12, 5, 2]
julia> sum = 9
julia> ClassicAlgorithmsCollections.subset_sum_test(set, sum)
true
```
"""
function subset_sum_test(array::Array{Int64,1}, target::Int64)
    n = length(array)
    if target == 1
        return true
    end
    if n == 1
        return false
    end
    if array[n-1] > target
        return subset_sum_test(array[1:n-1], target)
    end

    return subset_sum_test(array[1:n-1], target) ||
           subset_sum_test(array[1:n-1], target - array[n-1])
end
