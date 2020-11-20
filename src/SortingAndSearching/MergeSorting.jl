"""
    merge(left::Array{Int64,1}, right::Array{Int64,1}))

The merge algorithms (MA) merge the subarrays `left` and `right` to produce new sorted
subarrays until there is only one subarray remaining, which will be the sorted array. For
more information see: [https://en.wikipedia.org/wiki/Merge_sort](https://en.wikipedia.org/wiki/Merge_sort)


# Arguments
- `left::Array{Int64,1}`: Unsorted left part of the array
- `right::Array{Int64,1}`: Unsorted right part of the array

"""
function merge(left::Array{Int64,1}, right::Array{Int64,1})
    result = zeros(Int64, false)
    # Left and right may have elements left; consume them.
    while left != [] && right != []
        # Check if left is smaller than right, if yes append
        if left[1] <= right[1]
            append!(result, left[1])
            left = left[2:length(left)]
        else
            # If not mix the order of left and right
            append!(result, right[1])
            right = right[2:length(right)]
        end
    end


    # Either left or right may have elements left; consume them.
    # (Only one of the following loops will actually be entered.)
    while left != []
        append!(result, left[1])
        left = left[2:length(left)]
    end
    while right != []
        append!(result, right[1])
        right = right[2:length(right)]
    end
    return result
end


"""
    merge_sorting(array::Array{Int64,1})

The merge sort algorithms (MSA) are a comparison-based sorting algorithm, which is referred
to as the divide and conquer algorithms.  The stable sort implementation is a widely used
method for the MSA, which means that the order of equal elements is the same in the input
and output. In the current implementation, a top-down implementation is used; however, a
Bottom-up implementation can be used, too. In the top-down implementation, the MSA
recursively splits the array into subarrays until the subarray size is < 2, merging those
subarrays to produce a sorted array by using a new function `merge`. The back copying is
blocked by alternating the direction of the merge with each recursion. For more information
see: [https://en.wikipedia.org/wiki/Merge_sort](https://en.wikipedia.org/wiki/Merge_sort)


# Arguments
- `array::Array{Int64,1}`: Unsorted array of integers


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [64, 34, 25, 12, 22, 11, 90]
julia> ClassicAlgorithmsCollections.merge_sorting(arr)
[11, 12, 22, 25, 34, 64, 90]
```
"""
function merge_sorting(array::Array{Int64,1})
    # Base case. A array of zero or one elements is sorted, by definition.
    n = length(array)
    if n < 2
        return array
    end

    # First, divide the array into equal-sized subarrays
    mid = fld(n, 2)
    left = array[1:mid]
    right = array[mid+1:n]
    # Recursively sorting the left and right half
    left = merge_sorting(left)
    right = merge_sorting(right)
    # Then merge the now-sorted left and right subarrays.
    array = merge(left, right)
    # Finally return the sorted array
    return array
end
