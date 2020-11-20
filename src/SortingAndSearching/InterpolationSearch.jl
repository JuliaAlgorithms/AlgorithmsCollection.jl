"""
    interpolation_search(array::Array{Int64,1}, target::Int64)

The Interpolation search algorithm (ISA) finds a target-position in a sorted array by using
a numerical procedure. The sorting procedure uses a linear fitting for finding the target
position of the remaining search space in the array in more detail. The array's target
position is calculated by the straight slope between the lowest and largest boundary of the
remaining array and the lowest array position itself during each optimization cycle. If the
target-position cannot be found, the array-space will be shrink for the lower or higher
boundary region based on a comparison. For more information see: [https://en.wikipedia.org/wiki/Interpolation_search](https://en.wikipedia.org/wiki/Interpolation_search)


# Arguments
- `array::Array{Int64,1}`: Sorted array of integers
- `target::Int64`: Target-value to find the position


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [10,11, 12, 14, 16, 18, 19, 20, 21, 22, 23, 24, 33, 35, 42, 47]
julia> target = 12
julia> ClassicAlgorithmsCollections.interpolation_search(arr, target)
3
```
"""
function interpolation_search(array::Array{Int64,1}, target::Int64)
    # Find indexs of two low and high array-boundary
    low = 1
    high = length(array)

    # Since array is sorted, an element present in array must be in range defined by boundary
    while low <= high && target >= array[low] && target <= array[high]

        # Check if array contains only one element
        if low == high
            if array[low] == target
                return low
            end
            return nothing
        end

        # Linear fitting of the new position pos and transforming to an integer value.
        pos =
            low + floor(
                Int64,
                ((float(high - low) / (array[high] - array[low])) * (target - array[low])),
            )

        #  Check if target is now found
        if array[pos] == target
            return pos
        end

        # If x is larger, x is in upper part
        if array[pos] < target
            low = pos + 1
            # Else x has to be smaller, x is in lower part
        else
            high = pos - 1
        end
    end
    # If target is not in the list
    return nothing
end
