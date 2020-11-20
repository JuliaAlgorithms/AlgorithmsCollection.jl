"""
    insertion_sorting(array::Array{Int64,1})

The insertion sorting algorithm builds the final sorted array by inserting elements that are
greater than the key, to one position ahead of their current position step one item at a
time. For more information see: [https://en.wikipedia.org/wiki/Insertion_sort](https://en.wikipedia.org/wiki/Insertion_sort)


# Arguments
- `array::Array{Int64,1}`: Unsorted array of integers


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [64, 34, 25, 12, 22, 11, 90]
julia> ClassicAlgorithmsCollections.insertion_sorting(arr)
[11, 12, 22, 25, 34, 64, 90]
```
"""
function insertion_sorting(array::Array{Int64,1})

    # Traverse through 1 to len(array)
    for i in 2:length(array)
        #
        key = array[i]
        j = i - 1
        while j >= 1 && key < array[j]
            array[j+1] = array[j]
            j -= 1
            array[j+1] = key
        end
    end
    return array
end
