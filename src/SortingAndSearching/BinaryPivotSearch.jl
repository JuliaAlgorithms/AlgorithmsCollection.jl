"""
    binary_pivot_search(array::Array{Int64,1}, target::Int64)

The idea is to find the pivot point for finding the target in an unsorted array. For this
reason, the array has to be divided into two subarrays; a binary search is performed on
the subarrays.


# Arguments
- `array::Array{Int64,1}`: Unsorted array of integers
- `target::Int64`: Target-value to find the position


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [2, 5, 4, 7, 2, 8, 9, 3, 10, 2]
julia> target = 3
julia> ClassicAlgorithmsCollections.binary_pivot_search(arr, target)
8
```
"""
function binary_pivot_search(array::Array{Int64,1}, target::Int64)
    left = 1
    right = length(array)


    while left <= right
        # Generating the middle element position
        mid = fld((left + right), 2)

        # Check if target is hit
        if array[mid] == target
            return mid
            # Check if array is sorted from left to mid
        elseif array[left] <= array[mid]
            # Check if key lies in the left or right half
            if target >= array[left] && target <= array[mid]
                right = mid - 1
            else
                left = mid + 1
            end
            # Check if array is sorted from mid to the right
        elseif array[right] >= array[mid]
            # If array from left to mid is not sorted, array from mid to right is sorted
            if target >= array[mid] && target <= array[right]
                left = mid + 1
            else
                right = mid - 1
            end
        end
    end
    return nothing
end
