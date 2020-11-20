"""
    get_single_integer(array::Array{Int64,1})

For finding the single element in an array, where every other elements appear three times.


# Arguments
- `array::Array{Int64,1}`: Unsorted array with threetimes elements and one single element.


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [12, 1, 12, 3, 12, 1, 1, 2, 3, 3]
julia> ClassicAlgorithmsCollections.get_single_integer(arr)
2
```
"""
function get_single_integer(array::Array{Int64,1})
    first_appear_bits = 0
    second_appear_bits = 0

    for i in 1:length(array)
        second_appear_bits = second_appear_bits | (first_appear_bits & array[i])
        first_appear_bits = first_appear_bits ⊻ array[i]
        # Third times appearing bit
        third_appear_bits = ~(first_appear_bits & second_appear_bits)
        first_appear_bits &= third_appear_bits
        second_appear_bits &= third_appear_bits
    end
    return first_appear_bits
end
