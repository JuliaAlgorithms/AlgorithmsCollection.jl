"""
    count_pythagorean_elements(array::Array{Int64,1})


Counting the number of `Pythagorean`-elements in the array, which sum is equal to
A^2 + B^2 = C^2.


# Arguments
- `array::Array{Int64,1}`: Unsorted array


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [5, 1, 3, 4, 17, 8, 15, 2, 2, 13 ,12]
julia> ClassicAlgorithmsCollections.count_pythagorean_elements(arr, sum)
3
```
"""
function count_pythagorean_elements(array::Array{Int64,1})

    # Initialize result
    ans = 0
    n = length(array)

    for i in 1:n-2
        for j in i+1:n-1
            for k in j+1:n
                AA = array[i]^2
                BB = array[j]^2
                CC = array[k]^2
                if (AA + BB == CC)
                    ans += 1
                elseif (AA + CC == BB)
                    ans += 1
                elseif (BB + CC == AA)
                    ans += 1
                end
            end
        end
    end
    return ans
end
