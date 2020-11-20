"""
    lis_length(str_1::String, str_2::String)

The longest increasing subsequence (LIS) algorithm is dedicated to finding the longest
increasing subsequence for a given array.  This subsequence does not have to be contiguous
or unique. 
    
    1. Figure out the number of possible different subsequences of a string with length `m` and `n`.
    2. Recontracted `for-loops` for defining the outer layer of the storing matrix `C`.
    3. Checking if `str_1[i] == str_2[j]` and updating the count in  matrix `C`.
    4.Return the latest element of `C[m,n]`.
    
For more information see: [https://en.wikipedia.org/wiki/Longest_increasing_subsequence](https://en.wikipedia.org/wiki/Longest_increasing_subsequence)


# Arguments
- `array::Array{Int64,1}`: array of integers unsortetd or sorted


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> arr = [10, 22, 9, 33, 21, 50, 41, 60] 
julia> ClassicAlgorithmsCollections.lis_length(arr)
4
```
"""
function lis_length(array::Array{Int64,1})
    n = length(array)
    list = fill(1, n)
    for i in 2:n
        for j in 1:i
            if array[i] > array[j] && list[i] < list[j] + 1
                list[i] = list[j] + 1
            end
        end
    end

    result = 0
    for i in 1:n
        if list[i] > result
            result = list[i]
        end
    end
    return result
end
