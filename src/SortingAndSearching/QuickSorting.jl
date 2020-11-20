"""
    partition(array::Array{Int64,1}, low::Int64, high::Int64)

The partion algorithm is shuffeling the array for a given interval of low and high
boundaries.


# Arguments
- `array::Array{Int64,1}`: Unsorted array of integers
- `low::Int64`: Lowest index of the unsorted array or subarray
- `high::Int64`: Highes index of the unsorted array or subarray

"""
function partition(array::Array{Int64,1}, low::Int64, high::Int64)
    # index of smaller element
    i = low - 1
    # pivot
    pivot = array[high]

    for j in low:high

        # If current element is smaller than the pivot
        if array[j] < pivot

            # increment index of smaller element
            i = i + 1
            # Swap if the element found is greater than the next element
            array[i], array[j] = array[j], array[i]
        end
    end
    array[i+1], array[high] = array[high], array[i+1]
    return (i + 1)
end

"""
    quick_sorting(array::Array{Int64,1}, low = nothing, high = nothing)

The quick sort algorithm (QSA) works by selecting a pivot element from the array and
partitioning the other elements into two subarrays, according to whether they are less than
or greater than the pivot-window. Then the sorting of subarrays is recursively organized.
This procedure repeatedly happens until each subarray is organized; consequently, the
subarrays' merging is an organized array. For more information see:
[https://en.wikipedia.org/wiki/Quicksort#Parallelization](https://en.wikipedia.org/wiki/Quicksort#Parallelization)


# Arguments
- `array::Array{Int64,1}`: Unsorted array of integers
- `low::Int64`: Lowest index of the unsorted array or subarray
- `high::Int64`: Highes index of the unsorted array or subarray


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [64, 34, 25, 12, 22, 11, 90]
julia> ClassicAlgorithmsCollections.quick_sorting(arr)
[11, 12, 22, 25, 34, 64, 90]
```
"""
function quick_sorting(array::Array{Int64,1}, low = nothing, high = nothing)
    # If nothing, then the intial run, so low and high are set to array size
    if isnothing(low) && isnothing(high)
        low = 1
        high = length(array)
    end
    if low < high

        # p_i is partitioning index, array[p_i] is now at right place
        p_i = partition(array, low, high)

        # Separately sort elements before partition and after partition
        array = quick_sorting(array, low, p_i - 1)
        array = quick_sorting(array, p_i + 1, high)
    else
        return array
    end
end
