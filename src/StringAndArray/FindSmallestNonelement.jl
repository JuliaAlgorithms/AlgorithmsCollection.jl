"""
    find_smallest_nonelement(array::Array{Int64,1})

Returns the smallest number of a sorted array that cannot be represented as sum of subset of
elements from this array.

# Arguments
- `array::Array{Int64,1}`: Unsorted array

# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [1, 2, 5, 10, 20, 40]
julia> ClassicAlgorithmsCollections.find_smallest_nonelement(arr)
4
```
"""
function find_smallest_nonelement(array::Array{Int64,1})

    result = 1
    for i in 1:length(array)
        if array[i] <= result
            result += array[i]
        else
            break
        end
    end
    return result
end
