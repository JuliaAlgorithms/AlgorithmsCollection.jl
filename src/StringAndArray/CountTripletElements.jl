"""
    count_triplet_elements(array::Array{Int64,1}, sum::Int64)

Counting the number of three elements in the array, which sum is equal to the reference sum.


# Arguments
- `array::Array{Int64,1}`: Unsorted array
- `array::Array{Int64,1}`: Refernece sum


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [5, 1, 3, 4, 7]
julia> sum = 12
julia> ClassicAlgorithmsCollections.count_triplet_elements(arr, sum)
2


# Notes:
---

This should be implemented recursively instead of using three for-loops because it will
allow using any conditions.

"""
function count_triplet_elements(array::Array{Int64,1}, sum::Int64)

    # Initialize result
    ans = 0
    n = length(array)

    for i in 1:n-2
        for j in i+1:n-1
            for k in j+1:n
                if (array[i] + array[j] + array[k] == sum)
                    ans += 1
                end
            end
        end
    end
    return ans
end
