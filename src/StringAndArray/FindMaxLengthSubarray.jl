"""
    find_maxlength_subarray(array::Array{Int64,1})

Find the maximum length of a subarray with a given continuous depending sequence of numbers.
For this reason, the minimum and maximum element in every subarray will be tracked and
compared with the incremental distance. So if the difference of the value is equal to the
difference of the increment in the array, the length will be updated.


# Arguments
- `array::Array{Int64,1}`: Unsorted array


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [10, 12, 11, 9, 13, 14, 17, 18, 15]
julia> ClassicAlgorithmsCollections.find_maxlength_subarray(arr)
5
```
"""
function find_maxlength_subarray(array::Array{Int64,1})

    # Initialize result
    max_len = 1
    n = length(array)
    for i in 1:n
        min_array = array[i]
        max_array = array[i]

        for j in (i+1):n
            if min_array > array[j]
                min_array = array[j]
            end
            if max_array < array[j]
                max_array = array[j]
            end
            if ((max_array - min_array) == (j - i))
                if max_len < (max_array - min_array)
                    max_len = max_array - min_array + 1
                end
            end
        end
    end
    return max_len
end
