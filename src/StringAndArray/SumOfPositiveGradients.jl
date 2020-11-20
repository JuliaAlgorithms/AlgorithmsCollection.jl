"""
    sum_of_postive_gradients(array::Array{Int64,1}, m = nothing, n = nothing)

Estimates the sum of all positive gradients in array-sequence, calling the function itself
recursively. Every time if the `array[j] > array[i]` will be check, it will test the
monotony of the previous of the following elements.


# Arguments
- `array::Array{Int64,1}`: Unsorted array
- `m::Int64`: index for the nested `for-loops`; optional
- `n::Int64`: index for the nested `for-loops`; optional


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr =  arr = [100, 180, 260, 310, 40, 535, 695]
julia> ClassicAlgorithmsCollections.sum_of_postive_gradients(arr)
865
```
"""
function sum_of_postive_gradients(array::Array{Int64,1}, m = nothing, n = nothing)

    if isnothing(m) && isnothing(n)
        m = 1
        n = length(array)
    end
    gradient = 0

    for i in m:n
        for j in (i+1):n
            if array[j] > array[i]
                tmp_gradient =
                    array[j] - array[i] +
                    sum_of_postive_gradients(array, m, i - 1) +
                    sum_of_postive_gradients(array, j + 1, n)

                if tmp_gradient > gradient
                    gradient = tmp_gradient
                end
            end
        end
    end

    return gradient
end
