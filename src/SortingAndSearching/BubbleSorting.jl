"""
    bubble_sorting(array::Array{Int64,1})

The Bubble sorting algorithm (BSA) is a primitive sorting algorithm that repeatedly steps
through the array by using a double for-loop with n and n-1 size. During the walkthrough,
the BSA compares adjacent elements and swaps wrong ordered elements until the array is
sorted. For more information see: [https://en.wikipedia.org/wiki/Bubble_sort](https://en.wikipedia.org/wiki/Bubble_sort)


# Arguments
- `array::Array{Int64,1}`: Unsorted array of integers


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [64, 34, 25, 12, 22, 11, 90]
julia> ClassicAlgorithmsCollections.bubble_sorting(arr)
[11, 12, 22, 25, 34, 64, 90]
```
"""
function bubble_sorting(array::Array{Int64,1})
    n = length(array)

    # Traverse through all array elements
    for i in 1:n
        # Last i elements are already in place
        for j in 1:n-i-1
            # traverse the array from 1 to n-i-1
            if array[j] > array[j+1]
                # Swap if the element found is greater than the next element
                array[j], array[j+1] = array[j+1], array[j]
            end
        end
    end
    return array
end
