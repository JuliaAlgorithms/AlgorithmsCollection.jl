"""
    generate_array(
        array_1::Array{Int64},
        array_2::Array{Int64},
        array_merged::Array{Int64},
        i::Int64,
        j::Int64,
        k::Int64,
        l::Int64,
        size::Int64,
        flag::Bool,
        result::Array{Any,1}
    )

`generate_array` is a modified [Breadth-First-Search]https://en.wikipedia.org/wiki/Breadth-first_search]
for generating the result-array with the possible combinations of two merged arrays with
ascending ordering.


# Arguments
- `array_1::Array{Int64}`: First sorted array
- `array_2::Array{Int64}`: Second sorted array
- `array_merged::Array{Int64}`: Merged sorted array
- `i::Int64`: Outer lower increment of first array
- `j::Int64`: Outer higher increment of first array
- `k::Int64`: Outer lower increment of second array
- `l::Int64`: Outer higher increment of second array
- `size::Int64`: Current size
- `flag::Bool`: Switching between first and second array
- `result::Array{Any,1}`: Result list of the merged arrays
"""
function generate_array(
    array_1::Array{Int64},
    array_2::Array{Int64},
    array_merged::Array{Int64},
    i::Int64,
    j::Int64,
    k::Int64,
    l::Int64,
    size::Int64,
    flag::Bool,
    result::Array{Any,1},
    )
    if flag
        if size > 1
            push!(result, array_merged[1:size])
        end
        for m in i:k
            # Define the first element
            if size < 2
                array_merged[size] = array_1[m]
                generate_array(array_1,
                array_2, array_merged, m + 1, j, k, l, size, !flag,
                result)
            else
                # Going to the third and higher element of array_1
                if array_1[m] > array_merged[size]
                    array_merged[size + 1] = array_1[m]
                    generate_array(
                        array_1,
                        array_2,
                        array_merged,
                        m + 1,
                        j,
                        k,
                        l,
                        size + 1,
                        !flag,result
                    )
                end
            end
        end

    else
        # Going to the second of array_2
        for n in j:l
            if array_2[n] > array_merged[size]
                array_merged[size + 1] = array_2[n]
                generate_array(
                    array_1,
                    array_2,
                    array_merged,
                    i,
                    n + 1,
                    k,
                    l,
                    size + 1,
                    !flag,result
                )

            end
        end

    end
    return result
end


"""
    combinations_of_2arrays(array_1::Array{Int64,1}, array_2::Array{Int64,1}))

Provides all combinations of sorted arrays with an increasing number of elements. Original
idea


# Arguments
- `array_1::Array{Int64,1}`: First sorted array
- `array_2::Array{Int64,1}`: Second sorted array


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr_1 = [10, 15, 25]
julia> arr_2 = [5, 20, 30]
julia> ClassicAlgorithmsCollections.combinations_of_2arrays(arr_1, arr_2)
[10, 20]
[10, 20, 25, 30]
[10, 30]
[15, 20]
[15, 20, 25, 30]
[15, 30]
[25, 30]
```
"""
function combinations_of_2arrays(array_1::Array{Int64,1}, array_2::Array{Int64,1})
    length_array_1,  length_array_2 = length(array_1),  length(array_2)
    init_array = zeros(Int64, (length_array_1 +  length_array_2))
     # Create array-list for the searching solution
    result = Array{Any,1}()
    return generate_array(
        array_1,
        array_2,
        init_array,
        1,
        1,
        length_array_1,  length_array_2,
        1,
        true,
        result
    )
end
