"""
    int2binary(n::Int64, array=zeros(Int64,0))

Converts any integer to a binary representation as initiger array with 0, 1.


# Arguments
- `n::Int64`: Integer value which has to be converted
- `array=zeros(Int64,0)`: Empty array for return


# Examples
```julia-repl
julia> import ClassicAlgorithmsCollections
julia> ClassicAlgorithmsCollections.int2binary(131)
([1,0,0,0,0,0,1,1],1)
```
"""
function int2binary(n::Int64, array = zeros(Int64, 0))
    if n > 1
        int2binary(n >> 1, array)
    end
    n &= 1
    append!(array, n)
    return array, n
end
