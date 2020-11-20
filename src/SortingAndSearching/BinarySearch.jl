"""
    binary_search(array::Array{Int64,1}, target::Int64)

The binary search algorithm (BSA) finds a target value's position within a sorted array by
using a half-interval cut per each cycle. Thus, the BSA compares the target value to the
value of the array's middle element. In the case of inequality, the half array-piece in
which the target cannot be will be erased. Next, the search continues on the remaining
half array-piece and starts taking the middle element to compare it to the target value.
This procedure has to be continued until the target value is found. The search may have to
be stopped with a remaining empty half array-piece; consequently, the target is not in the
array. For more information see: [https://en.wikipedia.org/wiki/Binary_search_algorithm](https://en.wikipedia.org/wiki/Binary_search_algorithm)


# Arguments
- `array::Array{Int64,1}`: Sorted array of integers
- `target::Int64`: Target-value to find the position


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [10,11, 12, 14, 16, 18, 19, 20, 21, 22, 23, 24, 33, 35, 42, 47]
julia> target = 12
julia> ClassicAlgorithmsCollections.binary_search(arr, target)
3
```
"""
function binary_search(array::Array{Int64,1}, target::Int64)
    left = 1
    right = length(array)

    while left <= right
        # Generating the middle element position
        mid = fld((left + right), 2)
        # If element is larger than mid, then it  can only be present in right subarray
        if array[mid] < target
            left = mid + 1
            # If element is smaller than mid, then it can only be present in left subarray
        elseif array[mid] > target
            right = mid - 1
            # If element is present at the middle itself
        else
            return mid
        end
    end
    return nothing
end
