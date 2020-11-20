"""
    chinese_remainder_theorem(array::Array{Int64}, remainder::Array{Int64}))

The Chinese remainder theorem is based on simultaneous congruence. In more detail, if `x`
knows the `remainder` of the Euclidean division of an `array[i]` by several integers, then
`x` can determine the remainder of the division of `array[i]` by the product of these
integers uniquely, following the condition that the divisors are pairwise coprime. For more
information see: [https://en.wikipedia.org/wiki/Chinese_remainder_theorem](https://en.wikipedia.org/wiki/Chinese_remainder_theorem)


# Arguments
- `array::Array{Int64}`: Array with elements.
- `remainder::Array{Int64}`: Number of elements


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> num = [3, 4, 5]
julia> rem = [2, 3, 1]
julia> ClassicAlgorithmsCollections.chinese_remainder_theorem(num, rem)
11
```
"""
function chinese_remainder_theorem(array::Array{Int64}, remainder::Array{Int64})
    x = 1
    n = length(array)
    while true
        i = 1
        while i < n
            if x % array[i] != remainder[i]
                break
            end
            i += 1
        end
        if i == n
            return x
        end
        x += 1
    end
end
