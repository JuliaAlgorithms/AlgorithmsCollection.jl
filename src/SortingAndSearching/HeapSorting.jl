"""
    heapify(array::Array{Int64,1})

The heapify function merges the two subroutines for:
    1) Put elements of the array in heap order
    2) Repair the heap elements `i` whose root element, if is not at the index `largest`
For more information see: https://en.wikipedia.org/wiki/Heapsort


# Arguments
- `array::Array{Int64,1}`: Unsorted array of integers
- `n::Int64`: Length of the array
- `i::Int64`: Current index of the array

"""
function heapify(array::Array{Int64,1}, n::Int64, i::Int64)
    # Initialize largest as root and left and right subarrays
    largest = i
    # Julia notations, which starts with 1
    left = 2 * i
    right = 2 * i + 1

    # See if left child of root exists and is greater than root
    if left <= n && array[i] < array[left]
        largest = left
    end
    # See if right child of root exists and is greater than root
    if right <= n && array[largest] < array[right]
        largest = right
    end
    # Change root, if needed
    if largest != i
        array[i], array[largest] = array[largest], array[i]
        # Heapify the root again
        array = heapify(array, n, largest)
    end
    return array
end


"""
    heap_sorting(array::Array{Int64,1})

As a comparison-based sorting algorithm, the heapsort algorithm (HSA) divides its input
into a sorted and an unsorted region, and it iteratively shrinks the unsorted region by
extracting the largest element from it and inserting it into the sorted region. A specialty
is that the HSA keeps the unsorted region in a heap data structure to find the largest
element in each step more quickly. In more detail, in the first part of the HSA
(while-loop), the largest value has to be found and set to position one. In the second part
of the HSA (while-loop), the array's first and largest value has to be swap to the last
index of the array, and the swapping-procedure starts again for a new interval n-1. For
more information see: [https://en.wikipedia.org/wiki/Heapsort](https://en.wikipedia.org/wiki/Heapsort)


# Arguments
- `array::Array{Int64,1}`: Unsorted array of integers


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [64, 34, 25, 12, 22, 11, 90]
julia> ClassicAlgorithmsCollections.heap_sorting(arr)
[11, 12, 22, 25, 34, 64, 90]
```
"""
function heap_sorting(array::Array{Int64,1})
    # Base case. A array of zero or one elements is sorted, by definition.
    n = length(array)

    # Shrink the active space
    i = fld(n, 2)
    # Build a maxheap
    while i > 0
        array = heapify(array, n, i)
        i -= 1

    end

    # One by one extract elements
    i = n
    while i > 1
        array[i], array[1] = array[1], array[i]
        # Julia specific reducing effectiv index
        array = heapify(array, i - 1, 1)
        i -= 1
    end

    return array
end
